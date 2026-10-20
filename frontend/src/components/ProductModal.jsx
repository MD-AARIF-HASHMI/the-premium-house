import { useState } from "react";
import {
  X,
  Heart,
  Share2,
  ShieldCheck,
  Truck,
  RotateCcw,
  Ruler,
} from "lucide-react";

export default function ProductModal({
  product,
  onClose,
  onAdd,
  wishlisted,
  onWishlist,
}) {
  const [size, setSize] = useState(product.sizes?.[1] || "One Size");
  const [qty, setQty] = useState(1);

  const discount = Math.round((1 - product.price / product.mrp) * 100);

  return (
    <div className="overlay product-overlay" onClick={onClose}>
      <div className="pdp" onClick={(e) => e.stopPropagation()}>
        <button className="modal-close" onClick={onClose}>
          <X />
        </button>

        <div className="pdp-gallery">
          <div className="thumbs">
            {[product.image, product.image, product.image].map((x, i) => (
              <img key={i} src={x} alt="" />
            ))}
          </div>

          <div className="main-image">
            <img src={product.image} alt={product.name} />
            <span className="image-pill">360°</span>
          </div>
        </div>

        <div className="pdp-info">
          <div className="eyebrow">
            {product.brand} · PREMIUM COLLECTION
          </div>

          <h1>{product.name}</h1>

          <div className="pdp-rating">
            <span>★ {product.rating}</span>{" "}
            {product.reviews.toLocaleString("en-IN")} reviews
          </div>

          <div className="pdp-price">
            ₹{product.price.toLocaleString("en-IN")}{" "}
            <del>₹{product.mrp.toLocaleString("en-IN")}</del>
            <small>{discount}% OFF</small>
          </div>

          <p className="tax">Inclusive of all taxes</p>

          {product.sizes?.length ? (
            <div className="option">
              <div className="option-head">
                <b>Size</b>
                <button>
                  <Ruler size={14} /> Size Guide
                </button>
              </div>

              <div className="size-grid">
                {product.sizes.map((s) => (
                  <button
                    className={size === s ? "selected" : ""}
                    onClick={() => setSize(s)}
                    key={s}
                  >
                    {s}
                  </button>
                ))}
              </div>

              <button className="fit">
                <Ruler size={14} /> Check My Size
              </button>
            </div>
          ) : null}

          {product.colors?.length ? (
            <div className="option">
              <b>Color</b>

              <div className="color-row">
                {product.colors.map((c, i) => (
                  <button
                    key={i}
                    style={{ background: c }}
                    className={i === 0 ? "selected" : ""}
                  />
                ))}
              </div>
            </div>
          ) : null}

          <div className="delivery">
            <div>
              <Truck />
              <span>
                <b>Deliver to 110001</b>
                <small>Arrives by Thu, 20 Nov · Free delivery</small>
              </span>
              <button>Check</button>
            </div>
          </div>

          <div className="pdp-actions">
            <button
              className="primary"
              onClick={() => onAdd(product, size, qty)}
            >
              Add to Cart
            </button>

            <button
              className="dark"
              onClick={() => onAdd(product, size, qty)}
            >
              Buy Now
            </button>
          </div>

          <div className="secondary-actions">
            <button onClick={() => onWishlist(product)}>
              <Heart fill={wishlisted ? "currentColor" : "none"} />
              Wishlist
            </button>

            <button>
              <Share2 />
              Share
            </button>
          </div>

          <div className="trust-grid">
            <span>
              <RotateCcw /> 7 Days Return
            </span>
            <span>
              <ShieldCheck /> 1 Year Warranty
            </span>
            <span>
              <ShieldCheck /> 100% Authentic
            </span>
            <span>
              <ShieldCheck /> Secure Payment
            </span>
          </div>

          <div className="tabs">
            <button className="active">Description</button>
            <button>Specifications</button>
            <button>Reviews ({product.reviews})</button>
            <button>Delivery & Returns</button>
          </div>

          <div className="description">
            <p>
              A premium piece crafted with high-quality materials for a
              refined everyday wardrobe. Designed around comfort, durability
              and understated style.
            </p>

            <ul>
              <li>Premium material</li>
              <li>Soft inner finish</li>
              <li>Regular fit</li>
              <li>Ideal for autumn and winter</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
