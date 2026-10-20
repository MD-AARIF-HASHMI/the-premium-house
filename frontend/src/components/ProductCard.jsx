import { Heart, Star, ShoppingBag } from "lucide-react";

export default function ProductCard({ product, wishlisted, onWishlist, onOpen, onAdd }) {
  const discount = Math.round((1 - product.price / product.mrp) * 100);
  return (
    <article className="product-card">
      <button className={`heart ${wishlisted ? "active" : ""}`} onClick={(e)=>{e.stopPropagation();onWishlist(product)}} aria-label="Wishlist">
        <Heart size={17} fill={wishlisted ? "currentColor" : "none"} />
      </button>
      {product.badge && <span className="badge">{product.badge}</span>}
      <button className="product-media" onClick={()=>onOpen(product)}>
        <img src={product.image} alt={product.name} loading="lazy" />
      </button>
      <div className="product-copy">
        <div className="eyebrow">{product.brand}</div>
        <button className="product-name" onClick={()=>onOpen(product)}>{product.name}</button>
        <div className="rating"><span><Star size={12} fill="currentColor"/></span> {product.rating} <em>({product.reviews})</em></div>
        <div className="price-row"><strong>₹{product.price.toLocaleString("en-IN")}</strong><del>₹{product.mrp.toLocaleString("en-IN")}</del><small>{discount}% OFF</small></div>
        <button className="quick-add" onClick={()=>onAdd(product)}><ShoppingBag size={14}/> Add to bag</button>
      </div>
    </article>
  );
}