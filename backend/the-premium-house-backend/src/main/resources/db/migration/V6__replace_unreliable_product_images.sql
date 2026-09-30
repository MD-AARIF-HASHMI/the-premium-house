-- V6: Replace unreliable loremflickr product images with stable HTTPS image URLs.
-- The URLs are intentionally shared with the already-used storefront editorial assets.
-- This keeps the catalog renderable even when the original image provider is unavailable.

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-SHR-001';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-SHR-001' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-TSH-002';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-TSH-002' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-TRS-003';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-TRS-003' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-JNS-004';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-JNS-004' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-JKT-005';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-JKT-005' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-MEN-HOD-006';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-MEN-HOD-006' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WOM-DRS-007';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WOM-DRS-007' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WOM-TOP-008';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WOM-TOP-008' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WOM-SHR-009';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WOM-SHR-009' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WOM-JNS-010';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WOM-JNS-010' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WOM-JKT-011';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WOM-JKT-011' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-SHO-SNK-012';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-SHO-SNK-012' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-SHO-FRM-013';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-SHO-FRM-013' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-SHO-LOF-014';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-SHO-LOF-014' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-SHO-BOT-015';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-SHO-BOT-015' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-BAG-HAN-016';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-BAG-HAN-016' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-BAG-CRS-017';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-BAG-CRS-017' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-BAG-BPK-018';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-BAG-BPK-018' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WAT-ANA-019';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WAT-ANA-019' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WAT-CHR-020';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WAT-CHR-020' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WAT-SMT-021';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WAT-SMT-021' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-ACC-BEL-022';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-ACC-BEL-022' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-ACC-WAL-023';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-ACC-WAL-023' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-ACC-CAP-024';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-ACC-CAP-024' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-JWL-NCK-025';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-JWL-NCK-025' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-JWL-EAR-026';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-JWL-EAR-026' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-JWL-BRC-027';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-JWL-BRC-027' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-EYE-SUN-028';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-EYE-SUN-028' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-EYE-OPT-029';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-EYE-OPT-029' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-BEA-SKN-030';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-BEA-SKN-030' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-BEA-MUP-031';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-BEA-MUP-031' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-FRG-MEN-032';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-FRG-MEN-032' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-FRG-WOM-033';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-FRG-WOM-033' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-ACT-TRN-034';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-ACT-TRN-034' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-ACT-RUN-035';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-ACT-RUN-035' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-DNM-JNS-036';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-DNM-JNS-036' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-DNM-JKT-037';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-DNM-JKT-037' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WRK-SHR-038';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WRK-SHR-038' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-WRK-TRS-039';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-WRK-TRS-039' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-OCN-WED-040';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-OCN-WED-040' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-OCN-FST-041';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-OCN-FST-041' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-TRV-LUG-042';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-TRV-LUG-042' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-TRV-BAG-043';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-TRV-BAG-043' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-GFT-HER-044';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-GFT-HER-044' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-GFT-HIM-045';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-GFT-HIM-045' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-GFT-U2K-046';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-GFT-U2K-046' AND pi.is_primary = 1;

UPDATE products SET primary_image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE sku = 'PH-GFT-U5K-047';
UPDATE product_images pi JOIN products p ON p.id = pi.product_id SET pi.image_url = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1400&q=88' WHERE p.sku = 'PH-GFT-U5K-047' AND pi.is_primary = 1;
