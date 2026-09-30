/*
 * V7
 * Assign unique product-specific imagery.
 *
 * Existing V1-V6 migrations are intentionally left untouched.
 * Every product receives its own primary image URL.
 */

-- ============================================================
-- MEN
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=1400&q=88'
WHERE id = 1;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?auto=format&fit=crop&w=1400&q=88'
WHERE id = 2;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1506629905607-d9f7d8d1f6b6?auto=format&fit=crop&w=1400&q=88'
WHERE id = 3;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=1400&q=88'
WHERE id = 4;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=1400&q=88'
WHERE id = 5;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?auto=format&fit=crop&w=1400&q=88'
WHERE id = 6;

-- ============================================================
-- WOMEN
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=1400&q=88'
WHERE id = 7;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1485968579580-b6d095142e6e?auto=format&fit=crop&w=1400&q=88'
WHERE id = 8;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1596755389378-c31d21fd1273?auto=format&fit=crop&w=1400&q=88'
WHERE id = 9;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=1400&q=88'
WHERE id = 10;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1539109136881-2081271f7f2e?auto=format&fit=crop&w=1400&q=88'
WHERE id = 11;

-- ============================================================
-- SHOES
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=1400&q=88'
WHERE id = 12;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1614252235316-8c857d6a0c8f?auto=format&fit=crop&w=1400&q=88'
WHERE id = 13;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1533867617858-e7b97e060509?auto=format&fit=crop&w=1400&q=88'
WHERE id = 14;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?auto=format&fit=crop&w=1400&q=88'
WHERE id = 15;

-- ============================================================
-- BAGS
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=1400&q=88'
WHERE id = 16;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?auto=format&fit=crop&w=1400&q=88'
WHERE id = 17;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=1400&q=88'
WHERE id = 18;

-- ============================================================
-- WATCHES
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=1400&q=88'
WHERE id = 19;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=1400&q=88'
WHERE id = 20;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=1400&q=88'
WHERE id = 21;

-- ============================================================
-- ACCESSORIES
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1624222247344-550fb60583dc?auto=format&fit=crop&w=1400&q=88'
WHERE id = 22;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1627123424574-724758594e93?auto=format&fit=crop&w=1400&q=88'
WHERE id = 23;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1521369909029-2afed882baee?auto=format&fit=crop&w=1400&q=88'
WHERE id = 24;

-- ============================================================
-- JEWELLERY
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?auto=format&fit=crop&w=1400&q=88'
WHERE id = 25;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?auto=format&fit=crop&w=1400&q=88'
WHERE id = 26;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1611652022419-a9419f74343d?auto=format&fit=crop&w=1400&q=88'
WHERE id = 27;

-- ============================================================
-- EYEWEAR
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?auto=format&fit=crop&w=1400&q=88'
WHERE id = 28;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?auto=format&fit=crop&w=1400&q=88'
WHERE id = 29;

-- ============================================================
-- BEAUTY
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1556228720-195a672e8a03?auto=format&fit=crop&w=1400&q=88'
WHERE id = 30;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?auto=format&fit=crop&w=1400&q=88'
WHERE id = 31;

-- ============================================================
-- FRAGRANCE
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&w=1400&q=88'
WHERE id = 32;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&w=1400&q=88'
WHERE id = 33;

-- ============================================================
-- ACTIVE / SPORTS
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?auto=format&fit=crop&w=1400&q=88'
WHERE id = 34;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1400&q=88'
WHERE id = 35;

-- ============================================================
-- DENIM
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1475178626620-a4d074967452?auto=format&fit=crop&w=1400&q=88'
WHERE id = 36;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1523381294911-8d3cead13475?auto=format&fit=crop&w=1400&q=88'
WHERE id = 37;

-- ============================================================
-- WORKWEAR
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?auto=format&fit=crop&w=1400&q=88'
WHERE id = 38;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?auto=format&fit=crop&w=1400&q=88'
WHERE id = 39;

-- ============================================================
-- OCCASION / ETHNIC
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1610030469983-98e550d6193c?auto=format&fit=crop&w=1400&q=88'
WHERE id = 40;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1617627143750-d86bc21e42bb?auto=format&fit=crop&w=1400&q=88'
WHERE id = 41;

-- ============================================================
-- TRAVEL
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?auto=format&fit=crop&w=1400&q=88'
WHERE id = 42;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?auto=format&fit=crop&w=1400&q=88'
WHERE id = 43;

-- ============================================================
-- GIFTS
-- ============================================================

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1512909006721-3d6018887383?auto=format&fit=crop&w=1400&q=88'
WHERE id = 44;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=1400&q=88'
WHERE id = 45;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?auto=format&fit=crop&w=1400&q=88'
WHERE id = 46;

UPDATE products
SET primary_image_url = 'https://images.unsplash.com/photo-1602173574767-37ac01994b2a?auto=format&fit=crop&w=1400&q=88'
WHERE id = 47;