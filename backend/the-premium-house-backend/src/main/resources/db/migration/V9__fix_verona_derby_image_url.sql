/*
 * V9
 * Fix broken image URL for Verona Derby Formal Shoes
 * by copying the existing working URL from Milan Penny Loafers.
 */

UPDATE products target
JOIN products source ON source.sku = 'PH-SHO-LOF-014'
SET target.primary_image_url = source.primary_image_url
WHERE target.id = 13
  AND target.sku = 'PH-SHO-FRM-013';

-- Synchronize the primary product image record
UPDATE product_images pi
JOIN products p ON p.id = pi.product_id
SET pi.image_url = p.primary_image_url
WHERE p.id = 13
  AND p.sku = 'PH-SHO-FRM-013'
  AND pi.is_primary = 1;
