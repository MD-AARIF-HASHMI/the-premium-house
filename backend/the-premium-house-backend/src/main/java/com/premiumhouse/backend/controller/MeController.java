package com.premiumhouse.backend.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.LinkedHashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class MeController {

    @GetMapping("/me")
    public Map<String, Object> me(Authentication authentication) {

        Map<String, Object> response = new LinkedHashMap<>();

        response.put("authenticated", authentication != null);
        response.put("email", authentication.getName());
        response.put("authorities", authentication.getAuthorities());

        return response;
    }
}