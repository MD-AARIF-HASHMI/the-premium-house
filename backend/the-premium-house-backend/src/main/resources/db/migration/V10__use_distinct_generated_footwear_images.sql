/* V10: use distinct generated footwear product images. V1-V9 remain untouched. */

UPDATE products
SET primary_image_url = '/images/products/verona-derby-formal-shoes.png'
WHERE id = 13 AND sku = 'PH-SHO-FRM-013';

UPDATE products
SET primary_image_url = '/images/products/milan-penny-loafers.png'
WHERE id = 14 AND sku = 'PH-SHO-LOF-014';

UPDATE products
SET primary_image_url = '/images/products/ridge-chelsea-boots.png'
WHERE id = 15 AND sku = 'PH-SHO-BOT-015';

UPDATE product_images pi
JOIN products p ON p.id = pi.product_id
SET pi.image_url = p.primary_image_url
WHERE p.id IN (13, 14, 15) AND pi.is_primary = 1;
