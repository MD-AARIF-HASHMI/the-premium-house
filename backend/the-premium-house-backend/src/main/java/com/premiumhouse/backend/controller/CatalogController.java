package com.premiumhouse.backend.controller;

import com.premiumhouse.backend.dto.catalog.BrandResponse;
import com.premiumhouse.backend.dto.catalog.CategoryResponse;
import com.premiumhouse.backend.dto.catalog.CategoryTreeResponse;
import com.premiumhouse.backend.dto.catalog.ProductResponse;
import com.premiumhouse.backend.service.CatalogService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/catalog")
public class CatalogController {

    private final CatalogService catalogService;

    public CatalogController(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @GetMapping("/categories")
    public List<CategoryResponse> getCategories() {
        return catalogService.getCategories();
    }

    @GetMapping("/categories/tree")
    public List<CategoryTreeResponse> getCategoryTree() {
        return catalogService.getCategoryTree();
    }

    @GetMapping("/brands")
    public List<BrandResponse> getBrands() {
        return catalogService.getBrands();
    }

    @GetMapping("/products")
    public Page<ProductResponse> getProducts(
            @RequestParam(
                    required = false,
                    defaultValue = ""
            )
            String search,

            @RequestParam(
                    required = false,
                    defaultValue = ""
            )
            String category,

            @RequestParam(defaultValue = "0")
            int page,

            @RequestParam(defaultValue = "24")
            int size
    ) {

        return catalogService.getProducts(
                search,
                category,
                page,
                size
        );
    }
}