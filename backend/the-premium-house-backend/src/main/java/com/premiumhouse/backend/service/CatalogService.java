package com.premiumhouse.backend.service;

import com.premiumhouse.backend.dto.catalog.BrandResponse;
import com.premiumhouse.backend.dto.catalog.CategoryResponse;
import com.premiumhouse.backend.dto.catalog.CategoryTreeResponse;
import com.premiumhouse.backend.dto.catalog.ProductResponse;
import com.premiumhouse.backend.entity.Brand;
import com.premiumhouse.backend.entity.Category;
import com.premiumhouse.backend.entity.Product;
import com.premiumhouse.backend.repository.BrandRepository;
import com.premiumhouse.backend.repository.CategoryRepository;
import com.premiumhouse.backend.repository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

@Service
public class CatalogService {

    private static final long EMPTY_CATEGORY_ID = -1L;

    private final CategoryRepository categoryRepository;
    private final BrandRepository brandRepository;
    private final ProductRepository productRepository;

    public CatalogService(
            CategoryRepository categoryRepository,
            BrandRepository brandRepository,
            ProductRepository productRepository
    ) {
        this.categoryRepository = categoryRepository;
        this.brandRepository = brandRepository;
        this.productRepository = productRepository;
    }

    @Transactional(readOnly = true)
    public List<CategoryResponse> getCategories() {

        return categoryRepository
                .findByActiveTrueOrderBySortOrderAscNameAsc()
                .stream()
                .map(this::toCategoryResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<CategoryTreeResponse> getCategoryTree() {

        List<Category> categories =
                categoryRepository
                        .findByActiveTrueOrderBySortOrderAscNameAsc();

        if (categories.isEmpty()) {
            return List.of();
        }

        Set<Long> existingIds = new HashSet<>();

        for (Category category : categories) {
            if (category.getId() != null) {
                existingIds.add(category.getId());
            }
        }

        Map<Long, List<Category>> childrenByParent =
                new LinkedHashMap<>();

        List<Category> roots =
                new ArrayList<>();

        for (Category category : categories) {

            Long parentId =
                    category.getParentId();

            if (
                    parentId == null
                            || !existingIds.contains(parentId)
            ) {
                roots.add(category);
            } else {
                childrenByParent
                        .computeIfAbsent(
                                parentId,
                                ignored -> new ArrayList<>()
                        )
                        .add(category);
            }
        }

        List<CategoryTreeResponse> result =
                new ArrayList<>();

        for (Category root : roots) {

            result.add(
                    buildTreeNode(
                            root,
                            childrenByParent,
                            new HashSet<>()
                    )
            );
        }

        return result;
    }

    private CategoryTreeResponse buildTreeNode(
            Category category,
            Map<Long, List<Category>> childrenByParent,
            Set<Long> currentPath
    ) {

        Long categoryId =
                category.getId();

        /*
         * Protect against accidental circular
         * category relationships.
         */
        if (
                categoryId == null
                        || !currentPath.add(categoryId)
        ) {
            return new CategoryTreeResponse(
                    category.getId(),
                    category.getName(),
                    category.getSlug(),
                    category.getDescription(),
                    List.of()
            );
        }

        List<CategoryTreeResponse> children =
                new ArrayList<>();

        List<Category> categoryChildren =
                childrenByParent.getOrDefault(
                        categoryId,
                        List.of()
                );

        for (Category child : categoryChildren) {

            Set<Long> childPath =
                    new HashSet<>(currentPath);

            children.add(
                    buildTreeNode(
                            child,
                            childrenByParent,
                            childPath
                    )
            );
        }

        return new CategoryTreeResponse(
                category.getId(),
                category.getName(),
                category.getSlug(),
                category.getDescription(),
                children
        );
    }

    @Transactional(readOnly = true)
    public List<BrandResponse> getBrands() {

        return brandRepository
                .findByActiveTrueOrderByNameAsc()
                .stream()
                .map(this::toBrandResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public Page<ProductResponse> getProducts(
            String search,
            String categorySlug,
            int page,
            int size
    ) {

        String safeSearch =
                search == null
                        ? ""
                        : search.trim()
                        .toLowerCase(Locale.ROOT);

        String safeCategorySlug =
                categorySlug == null
                        ? ""
                        : categorySlug.trim()
                        .toLowerCase(Locale.ROOT);

        int safePage =
                Math.max(page, 0);

        int safeSize =
                Math.min(
                        Math.max(size, 1),
                        48
                );

        /*
         * IMPORTANT:
         *
         * Do NOT pass Sort here.
         *
         * Repository query already contains:
         *
         * ORDER BY p.createdAt DESC
         *
         * Passing Sort with a native query was the reason
         * Spring generated p.createdAt in SQL.
         */
        Pageable pageable =
                PageRequest.of(
                        safePage,
                        safeSize
                );

        /*
         * Load active categories once.
         *
         * Java handles the category hierarchy so we don't
         * need MySQL recursive CTEs.
         */
        List<Category> activeCategories =
                categoryRepository
                        .findByActiveTrueOrderBySortOrderAscNameAsc();

        Map<Long, List<Category>> childrenByParent =
                buildChildrenMap(activeCategories);

        /*
         * -----------------------------------------
         * CATEGORY FILTER
         * -----------------------------------------
         *
         * Example:
         *
         * /products?category=men
         *
         * returns products in:
         *
         * Men
         * Men/Shirts
         * Men/T-Shirts
         * Men/Trousers
         * Men/Jeans
         * Men/Jackets
         * Men/Hoodies
         */
        Set<Long> categoryFilterIds =
                resolveCategoryFilterIds(
                        safeCategorySlug,
                        activeCategories,
                        childrenByParent
                );

        boolean categoryFilterEnabled =
                !safeCategorySlug.isBlank();

        /*
         * -----------------------------------------
         * SEARCH CATEGORY MATCHING
         * -----------------------------------------
         *
         * Example:
         *
         * "shoes"
         *
         * matches Shoes category and therefore:
         *
         * Sneakers
         * Formal
         * Loafers
         * Boots
         * Sandals
         *
         * The repository ALSO searches product name,
         * slug, SKU, descriptions and brand.
         */
        Set<Long> searchCategorySeedIds =
                findMatchingSearchCategories(
                        activeCategories,
                        safeSearch
                );

        Set<Long> searchCategoryIds;

        if (searchCategorySeedIds.isEmpty()) {

            searchCategoryIds =
                    Set.of(EMPTY_CATEGORY_ID);

        } else {

            searchCategoryIds =
                    expandCategoryTree(
                            searchCategorySeedIds,
                            childrenByParent
                    );
        }

        boolean searchCategoryFilterEnabled =
                !searchCategorySeedIds.isEmpty();

        return productRepository
                .findActiveProducts(
                        safeSearch,
                        categoryFilterEnabled,
                        categoryFilterIds,
                        searchCategoryFilterEnabled,
                        searchCategoryIds,
                        pageable
                )
                .map(this::toProductResponse);
    }

    private Map<Long, List<Category>> buildChildrenMap(
            List<Category> categories
    ) {

        Map<Long, List<Category>> childrenByParent =
                new LinkedHashMap<>();

        for (Category category : categories) {

            Long parentId =
                    category.getParentId();

            if (parentId != null) {

                childrenByParent
                        .computeIfAbsent(
                                parentId,
                                ignored -> new ArrayList<>()
                        )
                        .add(category);
            }
        }

        return childrenByParent;
    }

    private Set<Long> resolveCategoryFilterIds(
            String categorySlug,
            List<Category> categories,
            Map<Long, List<Category>> childrenByParent
    ) {

        if (categorySlug.isBlank()) {
            return Set.of(EMPTY_CATEGORY_ID);
        }

        Set<Long> seedIds =
                new HashSet<>();

        for (Category category : categories) {

            String slug =
                    category.getSlug();

            if (
                    slug != null
                            && slug.equalsIgnoreCase(
                            categorySlug
                    )
            ) {
                seedIds.add(
                        category.getId()
                );
            }
        }

        Set<Long> result =
                expandCategoryTree(
                        seedIds,
                        childrenByParent
                );

        if (result.isEmpty()) {
            return Set.of(EMPTY_CATEGORY_ID);
        }

        return result;
    }

    private Set<Long> expandCategoryTree(
            Collection<Long> seedIds,
            Map<Long, List<Category>> childrenByParent
    ) {

        Set<Long> result =
                new HashSet<>();

        Queue<Long> queue =
                new ArrayDeque<>();

        for (Long seedId : seedIds) {

            if (seedId != null) {
                queue.add(seedId);
            }
        }

        while (!queue.isEmpty()) {

            Long currentId =
                    queue.poll();

            if (!result.add(currentId)) {
                continue;
            }

            List<Category> children =
                    childrenByParent.getOrDefault(
                            currentId,
                            List.of()
                    );

            for (Category child : children) {

                Long childId =
                        child.getId();

                if (
                        childId != null
                                && !result.contains(childId)
                ) {
                    queue.add(childId);
                }
            }
        }

        return result;
    }

    private Set<Long> findMatchingSearchCategories(
            List<Category> categories,
            String search
    ) {

        Set<Long> result =
                new HashSet<>();

        if (
                search == null
                        || search.isBlank()
        ) {
            return result;
        }

        String query =
                search.trim()
                        .toLowerCase(Locale.ROOT);

        for (Category category : categories) {

            String name =
                    category.getName() == null
                            ? ""
                            : category.getName()
                            .toLowerCase(Locale.ROOT);

            String slug =
                    category.getSlug() == null
                            ? ""
                            : category.getSlug()
                            .toLowerCase(Locale.ROOT);

            String description =
                    category.getDescription() == null
                            ? ""
                            : category.getDescription()
                            .toLowerCase(Locale.ROOT);

            if (
                    matchesCategoryQuery(
                            name,
                            slug,
                            description,
                            query
                    )
            ) {
                result.add(
                        category.getId()
                );
            }
        }

        return result;
    }

    private boolean matchesCategoryQuery(
            String name,
            String slug,
            String description,
            String query
    ) {

        /*
         * Exact match.
         */
        if (
                name.equals(query)
                        || slug.equals(query)
        ) {
            return true;
        }

        /*
         * Token match.
         *
         * This prevents:
         *
         * "men" accidentally matching "women".
         */
        if (
                containsSearchToken(
                        name,
                        query
                )
        ) {
            return true;
        }

        if (
                containsSearchToken(
                        slug,
                        query
                )
        ) {
            return true;
        }

        /*
         * Category description fallback.
         */
        return !description.isBlank()
                && description.contains(query);
    }

    private boolean containsSearchToken(
            String value,
            String query
    ) {

        if (
                value == null
                        || value.isBlank()
        ) {
            return false;
        }

        String normalized =
                value.replaceAll(
                        "[^a-z0-9]+",
                        " "
                );

        String[] tokens =
                normalized.split("\\s+");

        for (String token : tokens) {

            if (
                    token.equals(query)
                            || token.startsWith(query)
            ) {
                return true;
            }
        }

        return false;
    }

    private CategoryResponse toCategoryResponse(
            Category category
    ) {

        return new CategoryResponse(
                category.getId(),
                category.getName(),
                category.getSlug(),
                category.getDescription(),
                category.getParentId(),
                category.getSortOrder()
        );
    }

    private BrandResponse toBrandResponse(
            Brand brand
    ) {

        return new BrandResponse(
                brand.getId(),
                brand.getName(),
                brand.getSlug(),
                brand.getDescription()
        );
    }

    private ProductResponse toProductResponse(
            Product product
    ) {

        BigDecimal mrp =
                product.getMrp();

        BigDecimal price =
                product.getPrice();

        BigDecimal savings =
                mrp.subtract(price)
                        .max(BigDecimal.ZERO)
                        .setScale(
                                2,
                                RoundingMode.HALF_UP
                        );

        BigDecimal discountPercent =
                BigDecimal.ZERO;

        if (
                mrp.compareTo(
                        BigDecimal.ZERO
                ) > 0
                        && mrp.compareTo(price) > 0
        ) {

            discountPercent =
                    mrp.subtract(price)
                            .divide(
                                    mrp,
                                    4,
                                    RoundingMode.HALF_UP
                            )
                            .multiply(
                                    BigDecimal.valueOf(100)
                            )
                            .setScale(
                                    2,
                                    RoundingMode.HALF_UP
                            );
        }

        Category category =
                product.getCategory();

        Brand brand =
                product.getBrand();

        return new ProductResponse(
                product.getId(),
                product.getName(),
                product.getSlug(),
                product.getSku(),
                product.getShortDescription(),
                product.getDescription(),
                price,
                mrp,
                discountPercent,
                savings,
                product.getCurrencyCode(),
                product.getPrimaryImageUrl(),
                category.getId(),
                category.getName(),
                category.getSlug(),
                brand != null
                        ? brand.getId()
                        : null,
                brand != null
                        ? brand.getName()
                        : null,
                brand != null
                        ? brand.getSlug()
                        : null
        );
    }
}