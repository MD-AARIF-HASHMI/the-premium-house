package com.premiumhouse.backend.dto.catalog;

public record CategoryResponse(
        Long id,
        String name,
        String slug,
        String description,
        Long parentId,
        int sortOrder
) {
}