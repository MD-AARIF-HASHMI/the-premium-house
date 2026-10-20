
-- V12: Add Atelier Noir Italian Leather Jacket
-- Keep the old product record for historical references.

INSERT INTO products (
    category_id,
    brand_id,
    name,
    slug,
    sku,
    short_description,
    description,
    price,
    mrp,
    currency_code,
    primary_image_url,
    is_active
)
SELECT
    c.id,
    b.id,
    'Atelier Noir – The Italian Leather Jacket',
    'atelier-noir-italian-leather-jacket',
    'PH-JKT-LTH-042',
    'A refined leather jacket with a timeless silhouette.',
    'An elevated wardrobe essential inspired by Italian craftsmanship, featuring a clean silhouette and premium finishing.',
    18999.00,
    24999.00,
    'INR',
    NULL,
    1
FROM categories c
JOIN brands b ON b.slug = 'ph-atelier'
WHERE c.slug = 'men-jackets'
  AND NOT EXISTS (
      SELECT 1
      FROM products p
      WHERE p.sku = 'PH-JKT-LTH-042'
         OR p.slug = 'atelier-noir-italian-leather-jacket'
  );

-- Retain the existing product record, but remove it from the active catalog.
UPDATE products
SET is_active = 0
WHERE sku = 'PH-MEN-SHR-001';