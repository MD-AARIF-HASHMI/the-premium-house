package com.premiumhouse.backend.service;

import com.premiumhouse.backend.dto.auth.AuthResponse;
import com.premiumhouse.backend.dto.auth.RegisterRequest;
import com.premiumhouse.backend.entity.Role;
import com.premiumhouse.backend.entity.User;
import com.premiumhouse.backend.repository.RoleRepository;
import com.premiumhouse.backend.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock UserRepository userRepository;
    @Mock RoleRepository roleRepository;
    @Mock PasswordEncoder passwordEncoder;
    @Mock JwtService jwtService;

    @InjectMocks AuthService authService;

    private Role buyerRole;

    @BeforeEach
    void setUp() {
        buyerRole = new Role(1L, "BUYER");
    }

    @Test
    void registerShouldAlwaysAssignBuyerRole() {
        RegisterRequest request = new RegisterRequest();
        request.setFullName("Test Buyer");
        request.setEmail("BUYER@example.com");
        request.setPassword("StrongPass1!");

        when(userRepository.existsByEmailIgnoreCase("buyer@example.com"))
                .thenReturn(false);
        when(roleRepository.findByName("BUYER"))
                .thenReturn(Optional.of(buyerRole));
        when(passwordEncoder.encode("StrongPass1!"))
                .thenReturn("encoded-password");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(10L);
            return user;
        });
        when(jwtService.generateToken(10L, "buyer@example.com", "BUYER"))
                .thenReturn("test-access-token");

        AuthResponse response = authService.register(request);

        ArgumentCaptor<User> captor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(captor.capture());

        User savedUser = captor.getValue();
        assertEquals("BUYER", savedUser.getRole().getName());
        assertEquals("buyer@example.com", savedUser.getEmail());
        assertEquals("encoded-password", savedUser.getPasswordHash());
        assertNotEquals("StrongPass1!", savedUser.getPasswordHash());
        assertTrue(savedUser.isActive());
        assertEquals("BUYER", response.getRole());
        assertEquals("test-access-token", response.getAccessToken());
    }

    @Test
    void registerShouldRejectDuplicateEmail() {
        RegisterRequest request = new RegisterRequest();
        request.setFullName("Existing Buyer");
        request.setEmail("existing@example.com");
        request.setPassword("StrongPass1!");

        when(userRepository.existsByEmailIgnoreCase("existing@example.com"))
                .thenReturn(true);

        assertThrows(
                IllegalArgumentException.class,
                () -> authService.register(request)
        );

        verify(userRepository, never()).save(any(User.class));
        verifyNoInteractions(roleRepository, passwordEncoder, jwtService);
    }

    @Test
    void registerShouldNormalizeEmailAndTrimFullName() {
        RegisterRequest request = new RegisterRequest();
        request.setFullName("  Test Buyer  ");
        request.setEmail("  BUYER@EXAMPLE.COM  ");
        request.setPassword("StrongPass1!");

        when(userRepository.existsByEmailIgnoreCase("buyer@example.com"))
                .thenReturn(false);
        when(roleRepository.findByName("BUYER"))
                .thenReturn(Optional.of(buyerRole));
        when(passwordEncoder.encode("StrongPass1!"))
                .thenReturn("encoded-password");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setId(11L);
            return user;
        });
        when(jwtService.generateToken(11L, "buyer@example.com", "BUYER"))
                .thenReturn("test-token");

        AuthResponse response = authService.register(request);

        ArgumentCaptor<User> captor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(captor.capture());

        assertEquals("Test Buyer", captor.getValue().getFullName());
        assertEquals("buyer@example.com", captor.getValue().getEmail());
        assertEquals("buyer@example.com", response.getEmail());
    }
}