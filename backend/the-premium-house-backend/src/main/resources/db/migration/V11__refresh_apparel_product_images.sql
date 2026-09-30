-- V11: Assign distinct generated editorial images to selected apparel products.
-- Existing V1-V10 migrations remain unchanged.

UPDATE products
SET primary_image_url = CASE sku
    WHEN 'PH-ACT-TRN-034' THEN '/images/products/motion-form-training-tee.png'
    WHEN 'PH-ACT-RUN-035' THEN '/images/products/velocity-run-shorts.png'
    WHEN 'PH-DNM-JNS-036' THEN '/images/products/selvedge-everyday-jeans.png'
    ELSE primary_image_url
END
WHERE sku IN ('PH-ACT-TRN-034', 'PH-ACT-RUN-035', 'PH-DNM-JNS-036');

UPDATE product_images pi
JOIN products p ON p.id = pi.product_id
SET
    pi.image_url = CASE p.sku
        WHEN 'PH-ACT-TRN-034' THEN '/images/products/motion-form-training-tee.png'
        WHEN 'PH-ACT-RUN-035' THEN '/images/products/velocity-run-shorts.png'
        WHEN 'PH-DNM-JNS-036' THEN '/images/products/selvedge-everyday-jeans.png'
        ELSE pi.image_url
    END,
    pi.alt_text = CASE p.sku
        WHEN 'PH-ACT-TRN-034' THEN 'Motion Form Training Tee'
        WHEN 'PH-ACT-RUN-035' THEN 'Velocity Run Shorts'
        WHEN 'PH-DNM-JNS-036' THEN 'Selvedge Everyday Jeans'
        ELSE pi.alt_text
    END,
    pi.is_primary = 1
WHERE p.sku IN ('PH-ACT-TRN-034', 'PH-ACT-RUN-035', 'PH-DNM-JNS-036')
  AND pi.is_primary = 1;

INSERT INTO product_images
    (product_id, image_url, alt_text, sort_order, is_primary, created_at)
SELECT p.id,
       CASE p.sku
           WHEN 'PH-ACT-TRN-034' THEN '/images/products/motion-form-training-tee.png'
           WHEN 'PH-ACT-RUN-035' THEN '/images/products/velocity-run-shorts.png'
           WHEN 'PH-DNM-JNS-036' THEN '/images/products/selvedge-everyday-jeans.png'
       END,
       p.name,
       0,
       1,
       NOW()
FROM products p
WHERE p.sku IN ('PH-ACT-TRN-034', 'PH-ACT-RUN-035', 'PH-DNM-JNS-036')
  AND NOT EXISTS (
      SELECT 1
      FROM product_images existing
      WHERE existing.product_id = p.id
        AND existing.is_primary = 1
  );
