import { Check, ShoppingBag } from "lucide-react";
import ModalShell from "../common/ModalShell";
import { formatINR, getProductImage, percentOff } from "../../utils/format";

export default function ProductModal({
  product,
  open,
  onClose,
  onAdd,
  onBuyNow,
}) {
  if (!product) return null;

  const discount = product.discountPercent
    ? Math.round(Number(product.discountPercent))
    : percentOff(product.price, product.mrp);

  return (
    <ModalShell open={open} onClose={onClose} className="product-modal">
      <div className="modal-image-panel">
        <img
          src={getProductImage(product)}
          alt={product.name}
          onError={(event) => {
            event.currentTarget.style.opacity = "0.35";
          }}
        />
      </div>

      <div className="modal-content">
        <p className="eyebrow">
          {product.brandName || product.categoryName || "THE PREMIUM HOUSE"}
        </p>

        <h2>{product.name}</h2>

        <p className="modal-description">
          {product.description || product.shortDescription || "A considered piece from the house."}
        </p>

        <div className="modal-price-row">
          <strong>{formatINR(product.price)}</strong>
          {Number(product.mrp) > Number(product.price) && (
            <span>{formatINR(product.mrp)}</span>
          )}
          {discount > 0 && <em>-{discount}%</em>}
        </div>

        <div className="modal-trust">
          <div>
            <Check size={15} />
            Curated quality
          </div>
          <div>
            <Check size={15} />
            Secure payments
          </div>
          <div>
            <Check size={15} />
            Easy returns
          </div>
        </div>

        <div className="modal-actions-row">
          <button className="secondary-action" onClick={() => onAdd(product)}>
            <ShoppingBag size={16} />
            Add to bag
          </button>

          <button className="primary-action" onClick={() => onBuyNow(product)}>
            Buy now
          </button>
        </div>

        <dl className="product-meta-list">
          <div>
            <dt>Category</dt>
            <dd>{product.categoryName}</dd>
          </div>
          <div>
            <dt>SKU</dt>
            <dd>{product.sku}</dd>
          </div>
          <div>
            <dt>Savings</dt>
            <dd>{Number(product.savings) > 0 ? formatINR(product.savings) : "—"}</dd>
          </div>
        </dl>
      </div>
    </ModalShell>
  );
}
