/*
 * V8
 * Replace unsuitable product images with local frontend assets.
 * Keep products and product_images synchronized.
 * V1-V7 remain untouched.
 */

-- Essential Knit Polo
UPDATE products
SET primary_image_url = '/images/products/essential-knit-polo.png'
WHERE id = 2
  AND sku = 'PH-MEN-TSH-002';

-- Tailored Tapered Trouser
UPDATE products
SET primary_image_url = '/images/products/tailored-tapered-trouser.png'
WHERE id = 3
  AND sku = 'PH-MEN-TRS-003';

-- Atelier Cropped Jacket
UPDATE products
SET primary_image_url = '/images/products/atelier-cropped-jacket.png'
WHERE id = 11
  AND sku = 'PH-WOM-JKT-011';

-- Synchronize primary product image records
UPDATE product_images pi
JOIN products p ON p.id = pi.product_id
SET pi.image_url = p.primary_image_url
WHERE p.id IN (2, 3, 11)
  AND pi.is_primary = 1;
