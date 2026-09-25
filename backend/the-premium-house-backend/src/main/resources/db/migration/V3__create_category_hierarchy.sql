-- ============================================================
-- V3: THE PREMIUM HOUSE CATEGORY HIERARCHY
-- ============================================================

ALTER TABLE categories DROP INDEX uk_categories_name;
ALTER TABLE categories ADD COLUMN parent_id BIGINT NULL;
ALTER TABLE categories ADD COLUMN sort_order INT NOT NULL DEFAULT 0;
CREATE INDEX idx_categories_parent_sort ON categories(parent_id, sort_order);
ALTER TABLE categories ADD CONSTRAINT fk_categories_parent FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL;

-- ============================================================
-- TOP LEVEL CATEGORIES
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Men', 'men', 'Mens fashion and lifestyle essentials.', NULL, 10, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Women', 'women', 'Womens fashion and lifestyle essentials.', NULL, 20, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Clothing', 'clothing', 'Curated clothing across everyday and elevated styles.', NULL, 30, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 30,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Shoes', 'shoes', 'Sneakers, formal shoes, loafers, boots and more.', NULL, 40, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 40,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Bags', 'bags', 'Everyday, travel and statement bags.', NULL, 50, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 50,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Watches', 'watches', 'Everyday, smart and statement timepieces.', NULL, 60, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 60,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Accessories', 'accessories', 'Finishing pieces for everyday style.', NULL, 70, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 70,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Jewelry', 'jewelry', 'Necklaces, earrings, bracelets and rings.', NULL, 80, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 80,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Eyewear', 'eyewear', 'Sunglasses and optical styles.', NULL, 90, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 90,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Beauty', 'beauty', 'Skincare, makeup and haircare essentials.', NULL, 100, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 100,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Fragrance', 'fragrance', 'Mens, womens and unisex fragrances.', NULL, 110, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 110,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Activewear', 'activewear', 'Training, running and movement essentials.', NULL, 120, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 120,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Denim', 'denim', 'Elevated denim essentials.', NULL, 130, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 130,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Workwear', 'workwear', 'Polished pieces for work and smart casual dressing.', NULL, 140, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 140,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Occasion Wear', 'occasion-wear', 'Pieces for weddings, celebrations and special occasions.', NULL, 150, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 150,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Travel', 'travel', 'Travel-ready clothing, bags and accessories.', NULL, 160, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 160,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
VALUES
    ('Gifting', 'gifting', 'Curated gifting for different people and budgets.', NULL, 170, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE
    description = VALUES(description),
    parent_id = NULL,
    sort_order = 170,
    is_active = 1;

-- ============================================================
-- MEN
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Shirts',
    'men-shirts',
    'Mens shirts.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'T-Shirts',
    'men-tshirts',
    'Mens t-shirts.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Trousers',
    'men-trousers',
    'Mens trousers.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jeans',
    'men-jeans',
    'Mens jeans.',
    id,
    40,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 40,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jackets',
    'men-jackets',
    'Mens jackets.',
    id,
    50,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 50,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Hoodies',
    'men-hoodies',
    'Mens hoodies and sweatshirts.',
    id,
    60,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'men'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 60,
    is_active = 1;

-- ============================================================
-- WOMEN
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Dresses',
    'women-dresses',
    'Womens dresses.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'women'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Tops',
    'women-tops',
    'Womens tops.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'women'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Shirts',
    'women-shirts',
    'Womens shirts.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'women'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jeans',
    'women-jeans',
    'Womens jeans.',
    id,
    40,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'women'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 40,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jackets',
    'women-jackets',
    'Womens jackets.',
    id,
    50,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'women'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 50,
    is_active = 1;

-- ============================================================
-- SHOES
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Sneakers',
    'shoes-sneakers',
    'Everyday and statement sneakers.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'shoes'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Formal',
    'shoes-formal',
    'Formal shoes.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'shoes'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Loafers',
    'shoes-loafers',
    'Loafers.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'shoes'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Boots',
    'shoes-boots',
    'Boots.',
    id,
    40,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'shoes'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 40,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Sandals',
    'shoes-sandals',
    'Sandals.',
    id,
    50,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'shoes'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 50,
    is_active = 1;

-- ============================================================
-- BAGS
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Handbags',
    'bags-handbags',
    'Handbags.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'bags'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Crossbody',
    'bags-crossbody',
    'Crossbody bags.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'bags'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Backpacks',
    'bags-backpacks',
    'Backpacks.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'bags'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

-- ============================================================
-- WATCHES
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Analog',
    'watches-analog',
    'Analog watches.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'watches'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Chronograph',
    'watches-chronograph',
    'Chronograph watches.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'watches'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Smart',
    'watches-smart',
    'Smart watches.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'watches'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

-- ============================================================
-- ACCESSORIES
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Belts',
    'accessories-belts',
    'Belts.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'accessories'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Wallets',
    'accessories-wallets',
    'Wallets.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'accessories'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Caps',
    'accessories-caps',
    'Caps.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'accessories'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

-- ============================================================
-- JEWELRY
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Necklaces',
    'jewelry-necklaces',
    'Necklaces.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'jewelry'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Earrings',
    'jewelry-earrings',
    'Earrings.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'jewelry'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Bracelets',
    'jewelry-bracelets',
    'Bracelets.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'jewelry'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

-- ============================================================
-- EYEWEAR
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Sunglasses',
    'eyewear-sunglasses',
    'Sunglasses.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'eyewear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Optical',
    'eyewear-optical',
    'Optical frames.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'eyewear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- BEAUTY
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Skincare',
    'beauty-skincare',
    'Skincare.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'beauty'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Makeup',
    'beauty-makeup',
    'Makeup.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'beauty'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- FRAGRANCE
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Men',
    'fragrance-men',
    'Mens fragrance.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'fragrance'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Women',
    'fragrance-women',
    'Womens fragrance.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'fragrance'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- ACTIVEWEAR
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Training',
    'activewear-training',
    'Training wear.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'activewear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Running',
    'activewear-running',
    'Running wear.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'activewear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- DENIM
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jeans',
    'denim-jeans',
    'Denim jeans.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'denim'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Jackets',
    'denim-jackets',
    'Denim jackets.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'denim'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- WORKWEAR
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Shirts',
    'workwear-shirts',
    'Work shirts.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'workwear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Trousers',
    'workwear-trousers',
    'Work trousers.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'workwear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- OCCASION WEAR
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Wedding',
    'occasion-wedding',
    'Wedding occasion wear.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'occasion-wear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Festive',
    'occasion-festive',
    'Festive occasion wear.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'occasion-wear'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- TRAVEL
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Luggage',
    'travel-luggage',
    'Travel luggage.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'travel'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Travel Bags',
    'travel-bags',
    'Bags for travel.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'travel'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

-- ============================================================
-- GIFTING
-- ============================================================

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'For Her',
    'gifting-for-her',
    'Gifts for her.',
    id,
    10,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'gifting'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 10,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'For Him',
    'gifting-for-him',
    'Gifts for him.',
    id,
    20,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'gifting'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 20,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Under â‚¹2,000',
    'gifting-under-2000',
    'Gift ideas under two thousand rupees.',
    id,
    30,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'gifting'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 30,
    is_active = 1;

INSERT INTO categories
    (name, slug, description, parent_id, sort_order, is_active, created_at, updated_at)
SELECT
    'Under â‚¹5,000',
    'gifting-under-5000',
    'Gift ideas under five thousand rupees.',
    id,
    40,
    1,
    NOW(),
    NOW()
FROM categories
WHERE slug = 'gifting'
ON DUPLICATE KEY UPDATE
    parent_id = VALUES(parent_id),
    sort_order = 40,
    is_active = 1;