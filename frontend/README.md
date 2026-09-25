# THE PREMIUM HOUSE — Frontend

This frontend is built from scratch for the existing Spring Boot + MySQL catalog backend.

## Backend connection

Development requests use Vite's proxy:

- Frontend: `http://localhost:5173`
- Backend: `http://localhost:8080`
- Catalog API: `/api/catalog/products`
- Categories API: `/api/catalog/categories`
- Brands API: `/api/catalog/brands`

## Product shape expected from backend

The frontend uses the real catalog response fields:

- `id`
- `name`
- `slug`
- `sku`
- `shortDescription`
- `description`
- `price`
- `mrp`
- `discountPercent`
- `savings`
- `currencyCode`
- `primaryImageUrl`
- `categoryId`
- `categoryName`
- `categorySlug`
- `brandId`
- `brandName`
- `brandSlug`

## Main structure

- `src/components/` — UI components
- `src/hooks/` — reusable state/data hooks
- `src/services/` — API layer
- `src/utils/` — formatting/storage helpers
- `src/data/` — site/editorial data
- `src/App.jsx` — page composition
- `src/index.css` — premium visual system

The current checkout is intentionally a frontend prototype. The cart itself is persistent in `localStorage`.
