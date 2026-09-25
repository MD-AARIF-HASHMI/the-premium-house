package com.premiumhouse.backend.repository;

import com.premiumhouse.backend.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("""
        SELECT p
        FROM Product p
        JOIN p.category c
        LEFT JOIN p.brand b
        WHERE p.active = true

          AND (
              :search = ''
              OR LOWER(p.name) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(p.slug) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(p.sku) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(p.shortDescription) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(p.description) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(c.name) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(c.slug) LIKE LOWER(CONCAT('%', :search, '%'))
              OR LOWER(b.name) LIKE LOWER(CONCAT('%', :search, '%'))

              OR (
                  :searchCategoryFilterEnabled = true
                  AND c.id IN :searchCategoryIds
              )
          )

          AND (
              :categoryFilterEnabled = false
              OR c.id IN :categoryFilterIds
          )

        ORDER BY p.createdAt DESC
        """)
    Page<Product> findActiveProducts(
            @Param("search") String search,
            @Param("categoryFilterEnabled") boolean categoryFilterEnabled,
            @Param("categoryFilterIds") Collection<Long> categoryFilterIds,
            @Param("searchCategoryFilterEnabled") boolean searchCategoryFilterEnabled,
            @Param("searchCategoryIds") Collection<Long> searchCategoryIds,
            Pageable pageable
    );
}