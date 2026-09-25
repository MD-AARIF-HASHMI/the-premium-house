-- ============================================================
-- V4: Fix seeded category labels + seed catalog products
-- ============================================================

UPDATE categories
SET name = 'Under INR 2,000'
WHERE slug = 'gifting-under-2000';

UPDATE categories
SET name = 'Under INR 5,000'
WHERE slug = 'gifting-under-5000';

INSERT INTO products
(
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
VALUES

(
    24, 1,
    'The Oxford Edit Shirt',
    'the-oxford-edit-shirt',
    'PH-MEN-SHR-001',
    'A refined Oxford shirt designed for polished everyday dressing.',
    'Structured yet comfortable cotton Oxford shirt with a clean silhouette, versatile styling and premium finishing.',
    2499.00, 3299.00, 'INR',
    NULL, 1
),

(
    25, 2,
    'Essential Knit Polo',
    'essential-knit-polo',
    'PH-MEN-TSH-002',
    'A refined knit polo for elevated casual looks.',
    'Soft-touch textured knit polo featuring a modern collar, balanced fit and understated finish.',
    2299.00, 2999.00, 'INR',
    NULL, 1
),

(
    26, 1,
    'Tailored Tapered Trouser',
    'tailored-tapered-trouser',
    'PH-MEN-TRS-003',
    'Modern tapered trousers with an elegant tailored profile.',
    'Clean front, tapered leg and comfortable stretch construction make this a versatile wardrobe essential.',
    2799.00, 3699.00, 'INR',
    NULL, 1
),

(
    27, 2,
    'Selvedge Straight Jeans',
    'selvedge-straight-jeans',
    'PH-MEN-JNS-004',
    'Premium straight-fit denim with a timeless profile.',
    'Structured denim crafted for daily wear with a clean wash, durable construction and classic straight silhouette.',
    3199.00, 4299.00, 'INR',
    NULL, 1
),

(
    28, 4,
    'Apex Bomber Jacket',
    'apex-bomber-jacket',
    'PH-MEN-JKT-005',
    'A contemporary bomber jacket with a clean luxury aesthetic.',
    'Elevated everyday outerwear with ribbed detailing, structured shoulders and a streamlined modern fit.',
    3999.00, 5499.00, 'INR',
    NULL, 1
),

(
    29, 2,
    'Cloudweight Hoodie',
    'cloudweight-hoodie',
    'PH-MEN-HOD-006',
    'Soft premium hoodie built for effortless layering.',
    'Brushed interior, structured hood and relaxed silhouette combine comfort with a refined streetwear feel.',
    2499.00, 3299.00, 'INR',
    NULL, 1
),

(
    30, 4,
    'Satin Drape Midi Dress',
    'satin-drape-midi-dress',
    'PH-WOM-DRS-007',
    'An elegant midi dress with fluid satin movement.',
    'Designed with a graceful drape, refined neckline and sophisticated silhouette for evening and occasion dressing.',
    4499.00, 5999.00, 'INR',
    NULL, 1
),

(
    31, 2,
    'Sculpted Rib Top',
    'sculpted-rib-top',
    'PH-WOM-TOP-008',
    'Minimal ribbed top with a sculpted contemporary fit.',
    'A versatile elevated basic designed to pair effortlessly with denim, trousers and tailored layers.',
    1899.00, 2499.00, 'INR',
    NULL, 1
),

(
    32, 1,
    'Relaxed Poplin Shirt',
    'relaxed-poplin-shirt',
    'PH-WOM-SHR-009',
    'Crisp poplin shirt with an effortlessly relaxed silhouette.',
    'Breathable cotton poplin, clean cuffs and an easy fit create a polished everyday essential.',
    2399.00, 3199.00, 'INR',
    NULL, 1
),

(
    33, 4,
    'Luna Straight Jeans',
    'luna-straight-jeans',
    'PH-WOM-JNS-010',
    'A modern straight-leg denim essential.',
    'Balanced proportions and premium stretch denim deliver everyday comfort with a sophisticated finish.',
    2999.00, 3999.00, 'INR',
    NULL, 1
),

(
    34, 4,
    'Atelier Cropped Jacket',
    'atelier-cropped-jacket',
    'PH-WOM-JKT-011',
    'Structured cropped outerwear for modern wardrobes.',
    'A clean architectural silhouette with premium tailoring details designed for effortless layering.',
    4299.00, 5799.00, 'INR',
    NULL, 1
),

(
    35, 2,
    'Courtline Leather Sneakers',
    'courtline-leather-sneakers',
    'PH-SHO-SNK-012',
    'Minimal leather sneakers with a premium court-inspired profile.',
    'Clean upper, cushioned sole and understated detailing make this pair suitable for everyday elevated dressing.',
    3499.00, 4699.00, 'INR',
    NULL, 1
),

(
    36, 1,
    'Verona Derby Formal Shoes',
    'verona-derby-formal-shoes',
    'PH-SHO-FRM-013',
    'Classic Derby shoes designed for polished formal dressing.',
    'Refined profile, clean leather upper and cushioned construction provide timeless style for work and occasions.',
    3999.00, 5299.00, 'INR',
    NULL, 1
),

(
    37, 4,
    'Milan Penny Loafers',
    'milan-penny-loafers',
    'PH-SHO-LOF-014',
    'Contemporary penny loafers with a refined finish.',
    'Elegant slip-on construction designed to transition from business dressing to evening occasions.',
    3799.00, 4999.00, 'INR',
    NULL, 1
),

(
    38, 1,
    'Ridge Chelsea Boots',
    'ridge-chelsea-boots',
    'PH-SHO-BOT-015',
    'Streamlined Chelsea boots with an elevated everyday profile.',
    'Elastic side panels, refined ankle height and durable construction make this a versatile wardrobe staple.',
    4499.00, 5999.00, 'INR',
    NULL, 1
),

(
    40, 4,
    'Aurelia Structured Handbag',
    'aurelia-structured-handbag',
    'PH-BAG-HAN-016',
    'A structured handbag designed for polished day-to-evening styling.',
    'Defined shape, practical interior space and elegant hardware create an understated statement piece.',
    4999.00, 6999.00, 'INR',
    NULL, 1
),

(
    41, 2,
    'Metro Crossbody Bag',
    'metro-crossbody-bag',
    'PH-BAG-CRS-017',
    'Compact crossbody designed for effortless everyday carry.',
    'Smart organization, adjustable strap and clean modern detailing make it an ideal daily companion.',
    2799.00, 3699.00, 'INR',
    NULL, 1
),

(
    42, 2,
    'Nomad Daypack',
    'nomad-daypack',
    'PH-BAG-BPK-018',
    'Premium everyday backpack for work, study and travel.',
    'Functional compartments, padded carry comfort and a minimal silhouette balance utility with modern style.',
    3299.00, 4299.00, 'INR',
    NULL, 1
),

(
    43, 1,
    'Meridian Automatic Watch',
    'meridian-automatic-watch',
    'PH-WAT-ANA-019',
    'Elegant automatic timepiece with a clean dial.',
    'A refined everyday watch combining classic proportions, polished detailing and a sophisticated dial layout.',
    7499.00, 9499.00, 'INR',
    NULL, 1
),

(
    44, 4,
    'Vector Chronograph Watch',
    'vector-chronograph-watch',
    'PH-WAT-CHR-020',
    'Statement chronograph with a contemporary premium profile.',
    'Multi-register dial, detailed indices and a robust case create a versatile modern timepiece.',
    5999.00, 7999.00, 'INR',
    NULL, 1
),

(
    45, 2,
    'Pulse Smart Watch',
    'pulse-smart-watch',
    'PH-WAT-SMT-021',
    'Modern smart watch with a clean lifestyle-focused design.',
    'Designed for everyday convenience with a sleek display, activity features and a lightweight profile.',
    4999.00, 6499.00, 'INR',
    NULL, 1
),

(
    46, 1,
    'Calibre Leather Belt',
    'calibre-leather-belt',
    'PH-ACC-BEL-022',
    'Premium leather belt with a refined metal buckle.',
    'A versatile wardrobe-finishing piece designed for both tailored and smart-casual looks.',
    1499.00, 1999.00, 'INR',
    NULL, 1
),

(
    47, 4,
    'Signature Card Wallet',
    'signature-card-wallet',
    'PH-ACC-WAL-023',
    'Slim leather wallet engineered for everyday carry.',
    'Compact card organization and clean finishing deliver a polished accessory without unnecessary bulk.',
    1599.00, 2199.00, 'INR',
    NULL, 1
),

(
    48, 2,
    'Heritage Cap',
    'heritage-cap',
    'PH-ACC-CAP-024',
    'Minimal cap with an elevated everyday finish.',
    'Structured crown, adjustable fit and understated branding make it a versatile casual accessory.',
    999.00, 1399.00, 'INR',
    NULL, 1
),

(
    49, 4,
    'Celeste Pendant Necklace',
    'celeste-pendant-necklace',
    'PH-JWL-NCK-025',
    'Elegant pendant necklace designed for subtle statement styling.',
    'A refined pendant silhouette that works beautifully alone or layered with delicate chains.',
    2299.00, 2999.00, 'INR',
    NULL, 1
),

(
    50, 4,
    'Lumiere Hoop Earrings',
    'lumiere-hoop-earrings',
    'PH-JWL-EAR-026',
    'Modern hoops with a clean luminous finish.',
    'Timeless proportions and refined detailing make this pair easy to style from day to evening.',
    1799.00, 2399.00, 'INR',
    NULL, 1
),

(
    51, 1,
    'Arc Cuff Bracelet',
    'arc-cuff-bracelet',
    'PH-JWL-BRC-027',
    'Minimal cuff bracelet with a sculptural profile.',
    'A contemporary accessory designed to add a clean finishing touch without overpowering the look.',
    1899.00, 2599.00, 'INR',
    NULL, 1
),

(
    52, 4,
    'Noir Square Sunglasses',
    'noir-square-sunglasses',
    'PH-EYE-SUN-028',
    'Bold square sunglasses with an editorial silhouette.',
    'A confident frame shape paired with lightweight construction for modern everyday styling.',
    1999.00, 2699.00, 'INR',
    NULL, 1
),

(
    53, 2,
    'Studio Optical Frames',
    'studio-optical-frames',
    'PH-EYE-OPT-029',
    'Clean optical frames with a modern architectural profile.',
    'Lightweight styling and balanced proportions create a versatile frame for everyday use.',
    1699.00, 2299.00, 'INR',
    NULL, 1
),

(
    54, 4,
    'Cloud Veil Moisturizer',
    'cloud-veil-moisturizer',
    'PH-BEA-SKN-030',
    'Lightweight daily moisturizer with a refined skincare feel.',
    'A simple hydration-focused essential designed to sit comfortably under everyday skincare and makeup routines.',
    1299.00, 1699.00, 'INR',
    NULL, 1
),

(
    55, 2,
    'Soft Focus Skin Tint',
    'soft-focus-skin-tint',
    'PH-BEA-MUP-031',
    'Lightweight skin tint for an effortless natural finish.',
    'Designed for breathable everyday coverage with a soft, polished appearance.',
    1499.00, 1999.00, 'INR',
    NULL, 1
),

(
    56, 1,
    'Santal No. 07 Eau de Parfum',
    'santal-no-07-eau-de-parfum',
    'PH-FRG-MEN-032',
    'A warm woody fragrance with an elegant modern character.',
    'A sophisticated fragrance profile built around warm woods and smooth aromatic depth.',
    3499.00, 4599.00, 'INR',
    NULL, 1
),

(
    57, 4,
    'Fleur No. 12 Eau de Parfum',
    'fleur-no-12-eau-de-parfum',
    'PH-FRG-WOM-033',
    'A graceful floral fragrance with a refined contemporary mood.',
    'A polished floral composition designed for versatile daytime and evening wear.',
    3299.00, 4399.00, 'INR',
    NULL, 1
),

(
    58, 2,
    'Motion Form Training Tee',
    'motion-form-training-tee',
    'PH-ACT-TRN-034',
    'Performance training tee with an elevated athletic silhouette.',
    'Lightweight active fabric and a comfortable cut designed for movement, training and everyday athleisure.',
    1599.00, 2199.00, 'INR',
    NULL, 1
),

(
    59, 2,
    'Velocity Run Shorts',
    'velocity-run-shorts',
    'PH-ACT-RUN-035',
    'Lightweight running shorts built for unrestricted movement.',
    'Designed with a clean athletic silhouette, breathable construction and practical everyday comfort.',
    1399.00, 1899.00, 'INR',
    NULL, 1
),

(
    60, 1,
    'Selvedge Everyday Jeans',
    'selvedge-everyday-jeans',
    'PH-DNM-JNS-036',
    'Elevated denim with a clean everyday silhouette.',
    'Premium-feel denim with a balanced fit and understated wash for effortless styling.',
    3199.00, 4299.00, 'INR',
    NULL, 1
),

(
    61, 4,
    'Studio Denim Jacket',
    'studio-denim-jacket',
    'PH-DNM-JKT-037',
    'Classic denim jacket updated with modern proportions.',
    'A versatile layering essential with refined stitching, clean hardware and an elevated contemporary fit.',
    3499.00, 4699.00, 'INR',
    NULL, 1
),

(
    62, 1,
    'Workline Oxford Shirt',
    'workline-oxford-shirt',
    'PH-WRK-SHR-038',
    'Smart Oxford shirt made for work and polished casual dressing.',
    'A dependable wardrobe essential balancing professional structure, everyday comfort and timeless styling.',
    2399.00, 3199.00, 'INR',
    NULL, 1
),

(
    63, 1,
    'Regent Pleated Trousers',
    'regent-pleated-trousers',
    'PH-WRK-TRS-039',
    'Tailored pleated trousers for modern professional dressing.',
    'A refined silhouette with considered pleating and clean construction for versatile smart wardrobes.',
    2999.00, 3999.00, 'INR',
    NULL, 1
),

(
    64, 4,
    'Heirloom Wedding Kurta Set',
    'heirloom-wedding-kurta-set',
    'PH-OCN-WED-040',
    'A sophisticated occasion set designed for wedding celebrations.',
    'Elegant detailing and a refined festive silhouette designed for memorable formal and cultural occasions.',
    4499.00, 5999.00, 'INR',
    NULL, 1
),

(
    65, 4,
    'Festive Silk Blend Saree',
    'festive-silk-blend-saree',
    'PH-OCN-FST-041',
    'Festive saree with an elegant contemporary finish.',
    'A polished celebration-ready drape balancing traditional character with modern styling.',
    4999.00, 6799.00, 'INR',
    NULL, 1
),

(
    66, 2,
    'Aero Cabin Spinner',
    'aero-cabin-spinner',
    'PH-TRV-LUG-042',
    'Premium cabin luggage designed for effortless travel.',
    'A clean lightweight travel case with practical organization and a refined modern exterior.',
    5499.00, 6999.00, 'INR',
    NULL, 1
),

(
    67, 4,
    'Weekender Leather Travel Bag',
    'weekender-leather-travel-bag',
    'PH-TRV-BAG-043',
    'Elegant travel bag designed for short getaways.',
    'Roomy interior, refined handles and a sophisticated silhouette make this a practical premium travel companion.',
    4999.00, 6499.00, 'INR',
    NULL, 1
),

(
    68, 4,
    'Pearl & Silk Gift Set',
    'pearl-and-silk-gift-set',
    'PH-GFT-HER-044',
    'A curated gifting set designed for her.',
    'A polished combination of elegant lifestyle pieces presented as a thoughtful premium gift.',
    3999.00, 4999.00, 'INR',
    NULL, 1
),

(
    69, 1,
    'Classic Grooming Set',
    'classic-grooming-set',
    'PH-GFT-HIM-045',
    'A refined grooming gift set curated for him.',
    'A practical and sophisticated gifting edit designed for birthdays, celebrations and special moments.',
    2999.00, 3899.00, 'INR',
    NULL, 1
),

(
    70, 2,
    'Everyday Luxe Gift Box',
    'everyday-luxe-gift-box',
    'PH-GFT-U2K-046',
    'An accessible premium gift option under INR 2,000.',
    'A thoughtfully curated gift concept focused on useful, stylish and presentation-ready essentials.',
    1699.00, 2199.00, 'INR',
    NULL, 1
),

(
    71, 4,
    'Signature Gift Edit',
    'signature-gift-edit',
    'PH-GFT-U5K-047',
    'A premium gifting collection designed for meaningful occasions.',
    'An elevated curated gift selection designed around presentation, versatility and premium everyday appeal.',
    3999.00, 4999.00, 'INR',
    NULL, 1
);
