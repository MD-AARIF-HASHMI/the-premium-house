package com.premiumhouse.backend.dto.catalog;

import java.math.BigDecimal;

public record ProductResponse(
        Long id,
        String name,
        String slug,
        String sku,
        String shortDescription,
        String description,
        BigDecimal price,
        BigDecimal mrp,
        BigDecimal discountPercent,
        BigDecimal savings,
        String currencyCode,
        String primaryImageUrl,
        Long categoryId,
        String categoryName,
        String categorySlug,
        Long brandId,
        String brandName,
        String brandSlug
) {
}