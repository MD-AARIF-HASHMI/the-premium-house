package com.premiumhouse.backend.dto.catalog;

public record BrandResponse(
        Long id,
        String name,
        String slug,
        String description
) {
}