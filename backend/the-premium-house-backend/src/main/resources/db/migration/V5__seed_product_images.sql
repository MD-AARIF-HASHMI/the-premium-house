-- ============================================================
-- V5: Seed primary product images
-- ============================================================
--
-- Purpose:
-- 1. Add one primary image for every seeded product.
-- 2. Store the image in product_images.
-- 3. Keep products.primary_image_url synchronized.
--
-- This migration is designed for the existing 47 seeded products.
-- V1-V4 must remain unchanged.
-- ============================================================


-- ============================================================
-- 01. REMOVE ONLY EXISTING SEEDED IMAGE ROWS FOR THESE PRODUCTS
-- ============================================================
--
-- Safe for the current empty product_images table and also makes
-- the migration deterministic in a development database.
--
-- Because Flyway runs this migration only once, this mainly protects
-- against manually inserted development image rows.
-- ============================================================

DELETE FROM product_images
WHERE product_id IN (
    SELECT id
    FROM products
    WHERE sku IN (
        'PH-MEN-SHR-001',
        'PH-MEN-TSH-002',
        'PH-MEN-TRS-003',
        'PH-MEN-JNS-004',
        'PH-MEN-JKT-005',
        'PH-MEN-HOD-006',
        'PH-WOM-DRS-007',
        'PH-WOM-TOP-008',
        'PH-WOM-SHR-009',
        'PH-WOM-JNS-010',
        'PH-WOM-JKT-011',
        'PH-SHO-SNK-012',
        'PH-SHO-FRM-013',
        'PH-SHO-LOF-014',
        'PH-SHO-BOT-015',
        'PH-BAG-HAN-016',
        'PH-BAG-CRS-017',
        'PH-BAG-BPK-018',
        'PH-WAT-ANA-019',
        'PH-WAT-CHR-020',
        'PH-WAT-SMT-021',
        'PH-ACC-BEL-022',
        'PH-ACC-WAL-023',
        'PH-ACC-CAP-024',
        'PH-JWL-NCK-025',
        'PH-JWL-EAR-026',
        'PH-JWL-BRC-027',
        'PH-EYE-SUN-028',
        'PH-EYE-OPT-029',
        'PH-BEA-SKN-030',
        'PH-BEA-MUP-031',
        'PH-FRG-MEN-032',
        'PH-FRG-WOM-033',
        'PH-ACT-TRN-034',
        'PH-ACT-RUN-035',
        'PH-DNM-JNS-036',
        'PH-DNM-JKT-037',
        'PH-WRK-SHR-038',
        'PH-WRK-TRS-039',
        'PH-OCN-WED-040',
        'PH-OCN-FST-041',
        'PH-TRV-LUG-042',
        'PH-TRV-BAG-043',
        'PH-GFT-HER-044',
        'PH-GFT-HIM-045',
        'PH-GFT-U2K-046',
        'PH-GFT-U5K-047'
    )
);


-- ============================================================
-- 02. INSERT PRIMARY IMAGES
-- ============================================================

INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,shirt?lock=1',
    'The Oxford Edit Shirt',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-SHR-001';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,polo?lock=2',
    'Essential Knit Polo',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-TSH-002';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,trousers?lock=3',
    'Tailored Tapered Trouser',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-TRS-003';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,jeans?lock=4',
    'Selvedge Straight Jeans',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-JNS-004';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,jacket?lock=5',
    'Apex Bomber Jacket',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-JKT-005';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,fashion,hoodie?lock=6',
    'Cloudweight Hoodie',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-MEN-HOD-006';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,fashion,dress?lock=7',
    'Satin Drape Midi Dress',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WOM-DRS-007';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,fashion,top?lock=8',
    'Sculpted Rib Top',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WOM-TOP-008';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,fashion,shirt?lock=9',
    'Relaxed Poplin Shirt',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WOM-SHR-009';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,fashion,jeans?lock=10',
    'Luna Straight Jeans',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WOM-JNS-010';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,fashion,jacket?lock=11',
    'Atelier Cropped Jacket',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WOM-JKT-011';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/shoes,sneakers,fashion?lock=12',
    'Courtline Leather Sneakers',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-SHO-SNK-012';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/shoes,formal,leather?lock=13',
    'Verona Derby Formal Shoes',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-SHO-FRM-013';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/shoes,loafers,leather?lock=14',
    'Milan Penny Loafers',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-SHO-LOF-014';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/shoes,boots,leather?lock=15',
    'Ridge Chelsea Boots',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-SHO-BOT-015';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,handbag,luxury?lock=16',
    'Aurelia Structured Handbag',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-BAG-HAN-016';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/crossbody,bag,fashion?lock=17',
    'Metro Crossbody Bag',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-BAG-CRS-017';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/backpack,travel,fashion?lock=18',
    'Nomad Daypack',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-BAG-BPK-018';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/automatic,watch,luxury?lock=19',
    'Meridian Automatic Watch',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WAT-ANA-019';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/chronograph,watch,luxury?lock=20',
    'Vector Chronograph Watch',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WAT-CHR-020';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/smartwatch,technology,watch?lock=21',
    'Pulse Smart Watch',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WAT-SMT-021';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/leather,belt,mens-fashion?lock=22',
    'Calibre Leather Belt',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-ACC-BEL-022';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/leather,wallet,accessory?lock=23',
    'Signature Card Wallet',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-ACC-WAL-023';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/cap,mens-fashion,accessory?lock=24',
    'Heritage Cap',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-ACC-CAP-024';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/necklace,jewelry,fashion?lock=25',
    'Celeste Pendant Necklace',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-JWL-NCK-025';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/earrings,jewelry,fashion?lock=26',
    'Lumiere Hoop Earrings',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-JWL-EAR-026';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/bracelet,jewelry,fashion?lock=27',
    'Arc Cuff Bracelet',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-JWL-BRC-027';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/sunglasses,fashion,accessory?lock=28',
    'Noir Square Sunglasses',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-EYE-SUN-028';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/eyeglasses,frames,fashion?lock=29',
    'Studio Optical Frames',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-EYE-OPT-029';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/skincare,moisturizer,beauty?lock=30',
    'Cloud Veil Moisturizer',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-BEA-SKN-030';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/makeup,beauty,cosmetics?lock=31',
    'Soft Focus Skin Tint',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-BEA-MUP-031';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,perfume,fragrance?lock=32',
    'Santal No. 07 Eau de Parfum',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-FRG-MEN-032';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,perfume,fragrance?lock=33',
    'Fleur No. 12 Eau de Parfum',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-FRG-WOM-033';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/training,activewear,sportswear?lock=34',
    'Motion Form Training Tee',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-ACT-TRN-034';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/running,shorts,activewear?lock=35',
    'Velocity Run Shorts',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-ACT-RUN-035';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/denim,jeans,fashion?lock=36',
    'Selvedge Everyday Jeans',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-DNM-JNS-036';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/denim,jacket,fashion?lock=37',
    'Studio Denim Jacket',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-DNM-JKT-037';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,oxford,shirt,formal?lock=38',
    'Workline Oxford Shirt',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WRK-SHR-038';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,trousers,formalwear?lock=39',
    'Regent Pleated Trousers',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-WRK-TRS-039';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/mens,kurta,wedding,fashion?lock=40',
    'Heirloom Wedding Kurta Set',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-OCN-WED-040';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/womens,saree,festive,fashion?lock=41',
    'Festive Silk Blend Saree',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-OCN-FST-041';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/cabin,luggage,travel?lock=42',
    'Aero Cabin Spinner',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-TRV-LUG-042';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/leather,weekender,travel,bag?lock=43',
    'Weekender Leather Travel Bag',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-TRV-BAG-043';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/gift,womens,luxury,presentation?lock=44',
    'Pearl & Silk Gift Set',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-GFT-HER-044';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/grooming,mens,gift,set?lock=45',
    'Classic Grooming Set',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-GFT-HIM-045';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/giftbox,lifestyle,gift?lock=46',
    'Everyday Luxe Gift Box',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-GFT-U2K-046';


INSERT INTO product_images
(
    product_id,
    image_url,
    alt_text,
    sort_order,
    is_primary,
    created_at
)
SELECT
    p.id,
    'https://loremflickr.com/1200/1500/luxury,gift,box,premium?lock=47',
    'Signature Gift Edit',
    0,
    1,
    NOW()
FROM products p
WHERE p.sku = 'PH-GFT-U5K-047';


-- ============================================================
-- 03. SYNCHRONIZE products.primary_image_url
-- ============================================================

UPDATE products p
JOIN product_images pi
    ON pi.product_id = p.id
   AND pi.is_primary = 1
   AND pi.sort_order = 0
SET p.primary_image_url = pi.image_url
WHERE p.sku IN (
    'PH-MEN-SHR-001',
    'PH-MEN-TSH-002',
    'PH-MEN-TRS-003',
    'PH-MEN-JNS-004',
    'PH-MEN-JKT-005',
    'PH-MEN-HOD-006',
    'PH-WOM-DRS-007',
    'PH-WOM-TOP-008',
    'PH-WOM-SHR-009',
    'PH-WOM-JNS-010',
    'PH-WOM-JKT-011',
    'PH-SHO-SNK-012',
    'PH-SHO-FRM-013',
    'PH-SHO-LOF-014',
    'PH-SHO-BOT-015',
    'PH-BAG-HAN-016',
    'PH-BAG-CRS-017',
    'PH-BAG-BPK-018',
    'PH-WAT-ANA-019',
    'PH-WAT-CHR-020',
    'PH-WAT-SMT-021',
    'PH-ACC-BEL-022',
    'PH-ACC-WAL-023',
    'PH-ACC-CAP-024',
    'PH-JWL-NCK-025',
    'PH-JWL-EAR-026',
    'PH-JWL-BRC-027',
    'PH-EYE-SUN-028',
    'PH-EYE-OPT-029',
    'PH-BEA-SKN-030',
    'PH-BEA-MUP-031',
    'PH-FRG-MEN-032',
    'PH-FRG-WOM-033',
    'PH-ACT-TRN-034',
    'PH-ACT-RUN-035',
    'PH-DNM-JNS-036',
    'PH-DNM-JKT-037',
    'PH-WRK-SHR-038',
    'PH-WRK-TRS-039',
    'PH-OCN-WED-040',
    'PH-OCN-FST-041',
    'PH-TRV-LUG-042',
    'PH-TRV-BAG-043',
    'PH-GFT-HER-044',
    'PH-GFT-HIM-045',
    'PH-GFT-U2K-046',
    'PH-GFT-U5K-047'
);