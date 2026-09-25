package com.premiumhouse.backend.repository;

import com.premiumhouse.backend.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {

    List<ProductImage> findByProductIdOrderBySortOrderAscIdAsc(Long productId);

    List<ProductImage> findByProductIdAndPrimaryTrueOrderBySortOrderAscIdAsc(Long productId);

    void deleteByProductId(Long productId);
}