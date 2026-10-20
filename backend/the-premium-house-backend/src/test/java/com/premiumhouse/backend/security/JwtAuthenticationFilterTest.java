package com.premiumhouse.backend.security;

import com.premiumhouse.backend.entity.Role;
import com.premiumhouse.backend.entity.User;
import com.premiumhouse.backend.repository.UserRepository;
import com.premiumhouse.backend.service.JwtService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockFilterChain;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class JwtAuthenticationFilterTest {

    private JwtService jwtService;
    private UserRepository userRepository;
    private JwtAuthenticationFilter filter;

    @BeforeEach
    void setUp() {
        SecurityContextHolder.clearContext();
        jwtService = mock(JwtService.class);
        userRepository = mock(UserRepository.class);
        filter = new JwtAuthenticationFilter(jwtService, userRepository);
    }

    @Test
    void validAdminTokenUsesDatabaseRole() throws Exception {
        mockValidToken("admin-token", "admin@example.com", 4L, "ADMIN", true);
        MockHttpServletResponse response = execute("admin-token");

        assertEquals(200, response.getStatus());
        assertTrue(SecurityContextHolder.getContext().getAuthentication()
                .getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN")));
    }

    @Test
    void buyerTokenUsesBuyerRole() throws Exception {
        mockValidToken("buyer-token", "buyer@example.com", 5L, "BUYER", true);
        MockHttpServletResponse response = execute("buyer-token");

        assertEquals(200, response.getStatus());
        assertTrue(SecurityContextHolder.getContext().getAuthentication()
                .getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_BUYER")));
    }

    @Test
    void invalidTokenReturnsUnauthorized() throws Exception {
        when(jwtService.isTokenValid("bad-token")).thenReturn(false);

        MockHttpServletResponse response = execute("bad-token");

        assertEquals(401, response.getStatus());
        assertNull(SecurityContextHolder.getContext().getAuthentication());
        verifyNoInteractions(userRepository);
    }

    @Test
    void inactiveUserReturnsUnauthorized() throws Exception {
        mockValidToken("inactive-token", "inactive@example.com", 6L, "ADMIN", false);

        MockHttpServletResponse response = execute("inactive-token");

        assertEquals(401, response.getStatus());
        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    @Test
    void mismatchedUserIdReturnsUnauthorized() throws Exception {
        when(jwtService.isTokenValid("mismatch-token")).thenReturn(true);
        when(jwtService.extractEmail("mismatch-token")).thenReturn("admin@example.com");
        when(jwtService.extractUserId("mismatch-token")).thenReturn(99L);
        when(userRepository.findByEmailIgnoreCase("admin@example.com"))
                .thenReturn(Optional.of(makeUser(4L, "admin@example.com", "ADMIN", true)));

        MockHttpServletResponse response = execute("mismatch-token");

        assertEquals(401, response.getStatus());
        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    @Test
    void missingUserReturnsUnauthorized() throws Exception {
        when(jwtService.isTokenValid("missing-token")).thenReturn(true);
        when(jwtService.extractEmail("missing-token")).thenReturn("missing@example.com");
        when(jwtService.extractUserId("missing-token")).thenReturn(7L);
        when(userRepository.findByEmailIgnoreCase("missing@example.com"))
                .thenReturn(Optional.empty());

        MockHttpServletResponse response = execute("missing-token");

        assertEquals(401, response.getStatus());
        assertNull(SecurityContextHolder.getContext().getAuthentication());
    }

    private void mockValidToken(
            String token, String email, Long id, String role, boolean active
    ) {
        when(jwtService.isTokenValid(token)).thenReturn(true);
        when(jwtService.extractEmail(token)).thenReturn(email);
        when(jwtService.extractUserId(token)).thenReturn(id);
        when(userRepository.findByEmailIgnoreCase(email))
                .thenReturn(Optional.of(makeUser(id, email, role, active)));
    }

    private User makeUser(Long id, String email, String roleName, boolean active) {
        Role role = new Role("ADMIN".equals(roleName) ? 3L : 1L, roleName);
        User user = new User();
        user.setId(id);
        user.setFullName("Test User");
        user.setEmail(email);
        user.setPasswordHash("test-hash");
        user.setRole(role);
        user.setActive(active);
        return user;
    }

    private MockHttpServletResponse execute(String token) throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setMethod("GET");
        request.setRequestURI("/api/admin/security-test");
        request.addHeader("Authorization", "Bearer " + token);

        MockHttpServletResponse response = new MockHttpServletResponse();
        filter.doFilterInternal(request, response, new MockFilterChain());
        return response;
    }
}
