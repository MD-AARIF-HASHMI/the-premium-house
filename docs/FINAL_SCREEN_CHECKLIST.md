# Final screen checklist

## Desktop
- [x] Home
- [x] Category/product grid
- [x] Product detail
- [x] Cart
- [x] Checkout
- [x] Account overview
- [ ] Orders screen — backend integration phase
- [ ] Tracking screen — backend/integration phase
- [ ] Returns/refunds screen — backend/integration phase
- [ ] Wishlist dedicated page — account integration phase
- [ ] Notifications center — integration phase

## Mobile
- [x] Responsive home
- [x] Responsive category/product cards
- [x] Responsive product detail
- [x] Responsive cart
- [x] Responsive checkout
- [x] Responsive account

## Production acceptance criteria
- Server remains source of truth for price, stock and totals.
- Checkout creates an order exactly once.
- Payment callback/webhook is idempotent.
- Inventory is reserved/deducted transactionally.
- Seller ownership is enforced server-side.
- Admin actions are audited.
- Every order has status history.
- Returns/refunds have explicit states.
- Authentication/authorization is enforced at controller/service boundaries.
