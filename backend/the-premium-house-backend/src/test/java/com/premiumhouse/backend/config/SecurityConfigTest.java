package com.premiumhouse.backend.config;

import com.premiumhouse.backend.repository.UserRepository;
import com.premiumhouse.backend.security.JwtAuthenticationFilter;
import com.premiumhouse.backend.security.RateLimitFilter;
import com.premiumhouse.backend.security.RateLimitProperties;
import com.premiumhouse.backend.service.JwtService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.security.core.authority.AuthorityUtils.createAuthorityList;

@SpringBootTest
@AutoConfigureMockMvc
@Import({
        SecurityConfig.class,
        JwtAuthenticationFilter.class,
        RateLimitFilter.class,
        RateLimitProperties.class,
        SecurityConfigTest.TestAdminController.class
})
class SecurityConfigTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private JwtService jwtService;

    @MockitoBean
    private UserRepository userRepository;

    @Test
    void anonymousUserCannotAccessAdminRoute() throws Exception {
        mockMvc.perform(get("/api/admin/security-test"))
                .andExpect(status().isForbidden());
    }

    @Test
    void buyerCannotAccessAdminRoute() throws Exception {
        mockMvc.perform(get("/api/admin/security-test")
                        .with(user("buyer@example.com")
                                .authorities(createAuthorityList("ROLE_BUYER"))))
                .andExpect(status().isForbidden());
    }

    @Test
    void adminCanAccessAdminRoute() throws Exception {
        mockMvc.perform(get("/api/admin/security-test")
                        .with(user("admin@example.com")
                                .authorities(createAuthorityList("ROLE_ADMIN"))))
                .andExpect(status().isOk());
    }

    @RestController
    static class TestAdminController {

        @GetMapping("/api/admin/security-test")
        String adminOnlyEndpoint() {
            return "admin-ok";
        }
    }
}