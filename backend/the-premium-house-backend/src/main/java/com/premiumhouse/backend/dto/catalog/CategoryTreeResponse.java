package com.premiumhouse.backend.dto.catalog;

import java.util.List;

public record CategoryTreeResponse(
        Long id,
        String name,
        String slug,
        String description,
        List<CategoryTreeResponse> children
) {
}