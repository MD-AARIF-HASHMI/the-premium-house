package com.premiumhouse.backend.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.Duration;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class RateLimitFilter extends OncePerRequestFilter {

    private final RateLimitProperties properties;

    private final ConcurrentHashMap<String, WindowCounter> counters =
            new ConcurrentHashMap<>();

    public RateLimitFilter(RateLimitProperties properties) {
        this.properties = properties;
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {

        String path = request.getRequestURI();

        RateLimitProperties.Limit limit;
        String keyPrefix;

        if (path.startsWith("/api/auth/")) {

            limit = properties.getAuth();
            keyPrefix = "auth:ip:";

        } else if (path.startsWith("/api/")) {

            Authentication authentication =
                    SecurityContextHolder.getContext().getAuthentication();

            if (authentication != null
                    && authentication.isAuthenticated()
                    && authentication.getName() != null
                    && !authentication.getName().equals("anonymousUser")) {

                limit = properties.getAuthenticated();
                keyPrefix = "user:";

            } else {

                limit = properties.getPublicRequests();
                keyPrefix = "public:ip:";
            }

        } else {

            filterChain.doFilter(request, response);
            return;
        }

        String clientKey;

        if ("user:".equals(keyPrefix)) {
            clientKey = authenticationName();
        } else {
            clientKey = getClientIp(request);
        }

        String fullKey = keyPrefix + clientKey;

        RateLimitResult result = consume(
                fullKey,
                limit.getMaxRequests(),
                limit.getWindowSeconds()
        );

        response.setHeader(
                "X-RateLimit-Limit",
                String.valueOf(result.limit())
        );

        response.setHeader(
                "X-RateLimit-Remaining",
                String.valueOf(result.remaining())
        );

        if (!result.allowed()) {

            response.setStatus(429);

            response.setHeader(
                    "Retry-After",
                    String.valueOf(result.retryAfterSeconds())
            );

            response.setContentType("application/json");

            response.getWriter().write(
                    "{\"success\":false,\"message\":\"Too many requests. Please try again later.\",\"errorCode\":\"RATE_LIMITED\"}"
            );

            return;
        }

        filterChain.doFilter(request, response);
    }

    private RateLimitResult consume(
            String key,
            int maxRequests,
            int windowSeconds
    ) {

        long now = System.currentTimeMillis();

        long windowMillis =
                Duration.ofSeconds(windowSeconds).toMillis();

        WindowCounter counter = counters.computeIfAbsent(
                key,
                ignored -> new WindowCounter(now)
        );

        synchronized (counter) {

            if (now - counter.windowStart >= windowMillis) {
                counter.windowStart = now;
                counter.count = 0;
            }

            if (counter.count >= maxRequests) {

                long elapsed =
                        now - counter.windowStart;

                long remainingMillis =
                        Math.max(0, windowMillis - elapsed);

                long retryAfterSeconds =
                        Math.max(
                                1,
                                (remainingMillis + 999) / 1000
                        );

                return new RateLimitResult(
                        false,
                        maxRequests,
                        0,
                        retryAfterSeconds
                );
            }

            counter.count++;

            int remaining =
                    Math.max(
                            0,
                            maxRequests - counter.count
                    );

            return new RateLimitResult(
                    true,
                    maxRequests,
                    remaining,
                    0
            );
        }
    }

    private String authenticationName() {

        Authentication authentication =
                SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null
                && authentication.getName() != null) {

            return authentication.getName();
        }

        return "unknown";
    }

    private String getClientIp(HttpServletRequest request) {
        return request.getRemoteAddr();
    }

    private static class WindowCounter {

        private long windowStart;
        private int count;

        private WindowCounter(long windowStart) {
            this.windowStart = windowStart;
            this.count = 0;
        }
    }

    private record RateLimitResult(
            boolean allowed,
            int limit,
            int remaining,
            long retryAfterSeconds
    ) {
    }
}