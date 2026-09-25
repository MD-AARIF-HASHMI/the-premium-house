package com.premiumhouse.backend.security;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "app.rate-limit")
public class RateLimitProperties {

    private Limit auth = new Limit(10, 60);
    private Limit publicRequests = new Limit(120, 60);
    private Limit authenticated = new Limit(180, 60);

    private int loginMaxFailures = 5;
    private int loginBaseBackoffSeconds = 2;
    private int loginMaxBackoffSeconds = 300;

    public Limit getAuth() {
        return auth;
    }

    public void setAuth(Limit auth) {
        this.auth = auth;
    }

    public Limit getPublicRequests() {
        return publicRequests;
    }

    public void setPublicRequests(Limit publicRequests) {
        this.publicRequests = publicRequests;
    }

    public Limit getAuthenticated() {
        return authenticated;
    }

    public void setAuthenticated(Limit authenticated) {
        this.authenticated = authenticated;
    }

    public int getLoginMaxFailures() {
        return loginMaxFailures;
    }

    public void setLoginMaxFailures(int loginMaxFailures) {
        this.loginMaxFailures = loginMaxFailures;
    }

    public int getLoginBaseBackoffSeconds() {
        return loginBaseBackoffSeconds;
    }

    public void setLoginBaseBackoffSeconds(int loginBaseBackoffSeconds) {
        this.loginBaseBackoffSeconds = loginBaseBackoffSeconds;
    }

    public int getLoginMaxBackoffSeconds() {
        return loginMaxBackoffSeconds;
    }

    public void setLoginMaxBackoffSeconds(int loginMaxBackoffSeconds) {
        this.loginMaxBackoffSeconds = loginMaxBackoffSeconds;
    }

    public static class Limit {

        private int maxRequests;
        private int windowSeconds;

        public Limit() {
        }

        public Limit(int maxRequests, int windowSeconds) {
            this.maxRequests = maxRequests;
            this.windowSeconds = windowSeconds;
        }

        public int getMaxRequests() {
            return maxRequests;
        }

        public void setMaxRequests(int maxRequests) {
            this.maxRequests = maxRequests;
        }

        public int getWindowSeconds() {
            return windowSeconds;
        }

        public void setWindowSeconds(int windowSeconds) {
            this.windowSeconds = windowSeconds;
        }
    }
}