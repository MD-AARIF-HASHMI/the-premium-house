import { motion } from "motion/react";
import { ArrowRight, Heart, ShoppingBag } from "lucide-react";
import { formatINR, getProductImage, percentOff, truncate } from "../../utils/format";

function fallbackDataUrl(name = "The Premium House") {
  const label = name.slice(0, 22).replace(/[<>&"]/g, "");
  const svg = `
    <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1250" viewBox="0 0 1000 1250">
      <rect width="1000" height="1250" fill="#e7e2d9"/>
      <text x="500" y="590" text-anchor="middle" font-family="Arial, sans-serif" font-size="34" fill="#7b756b" letter-spacing="4">${label}</text>
      <text x="500" y="645" text-anchor="middle" font-family="Arial, sans-serif" font-size="15" fill="#a39c90" letter-spacing="3">THE PREMIUM HOUSE</text>
    </svg>
  `;
  return `data:image/svg+xml;charset=UTF-8,${encodeURIComponent(svg)}`;
}

export default function ProductCard({
  product,
  index = 0,
  wishlisted,
  onWishlist,
  onAdd,
  onQuickView,
  onBuyNow,
}) {
  const discount = product.discountPercent
    ? Math.round(Number(product.discountPercent))
    : percentOff(product.price, product.mrp);

  const image = getProductImage(product) || fallbackDataUrl(product.name);

  return (
    <motion.article
      className="product-card"
      initial={{ opacity: 0, y: 16 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, amount: 0.05 }}
      transition={{
        duration: 0.42,
        delay: Math.min(index * 0.025, 0.16),
      }}
    >
      <div className="product-image">
        <img
          src={image}
          alt={product.name}
          loading="lazy"
          onError={(event) => {
            event.currentTarget.src = fallbackDataUrl(product.name);
          }}
        />

        <div className="product-topline">
          {discount > 0 && <span className="discount-pill">-{discount}%</span>}
          <span className="category-pill-small">
            {product.categoryName || "Curated"}
          </span>
        </div>

        <button
          className={`heart ${wishlisted ? "heart-active" : ""}`}
          onClick={() => onWishlist(product.id)}
          aria-label={wishlisted ? "Remove from wishlist" : "Add to wishlist"}
        >
          <Heart size={17} fill={wishlisted ? "currentColor" : "none"} />
        </button>

        <div className="product-actions">
          <button onClick={() => onQuickView(product)}>Quick view</button>
          <button onClick={() => onAdd(product)}>Add to bag</button>
          <button onClick={() => onBuyNow(product)} className="product-buy-action">
            Buy now
          </button>
        </div>
      </div>

      <button className="product-information" onClick={() => onQuickView(product)}>
        <div className="product-title-row">
          <div>
            <span className="product-brand">
              {product.brandName || product.categoryName || "THE PREMIUM HOUSE"}
            </span>
            <h3>{product.name}</h3>
          </div>
        </div>

        <p className="product-description">
          {truncate(
            product.shortDescription || product.description || "A considered piece from the house.",
            88
          )}
        </p>

        <div className="price-row">
          <strong>{formatINR(product.price)}</strong>
          {Number(product.mrp) > Number(product.price) && (
            <span>{formatINR(product.mrp)}</span>
          )}
          {Number(product.savings) > 0 && (
            <em>Save {formatINR(product.savings)}</em>
          )}
        </div>

        <div className="product-foot">
          <span>SKU {product.sku}</span>
          <ArrowRight size={14} />
        </div>
      </button>
    </motion.article>
  );
}
