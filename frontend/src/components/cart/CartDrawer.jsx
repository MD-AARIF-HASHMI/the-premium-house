import { AnimatePresence, motion } from "motion/react";
import { ArrowRight, Minus, Plus, ShoppingBag, Trash2, X } from "lucide-react";
import { formatINR, getProductImage } from "../../utils/format";

export default function CartDrawer({
  open,
  cart,
  subtotal,
  onClose,
  onChangeQuantity,
  onRemove,
  onCheckout,
}) {
  return (
    <AnimatePresence>
      {open && (
        <>
          <motion.div
            className="drawer-overlay"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
          />

          <motion.aside
            className="cart-drawer"
            initial={{ x: "100%" }}
            animate={{ x: 0 }}
            exit={{ x: "100%" }}
            transition={{ duration: 0.32, ease: "easeOut" }}
          >
            <div className="drawer-header">
              <div>
                <p className="eyebrow">YOUR SELECTION</p>
                <h2>Shopping bag</h2>
              </div>
              <button onClick={onClose} aria-label="Close bag">
                <X size={22} />
              </button>
            </div>

            <div className="cart-content">
              {cart.length === 0 ? (
                <div className="empty-cart">
                  <ShoppingBag size={42} />
                  <h3>Your bag is empty</h3>
                  <p>Discover something worth keeping.</p>
                  <button onClick={onClose}>Continue shopping</button>
                </div>
              ) : (
                cart.map((item) => (
                  <div className="cart-item" key={item.id}>
                    <img src={getProductImage(item)} alt={item.name} />
                    <div className="cart-item-info">
                      <span className="product-brand">
                        {item.brandName || item.categoryName}
                      </span>
                      <h3>{item.name}</h3>
                      <strong>{formatINR(item.price)}</strong>

                      <div className="cart-controls">
                        <div className="quantity-control">
                          <button onClick={() => onChangeQuantity(item.id, -1)}>
                            <Minus size={13} />
                          </button>
                          <span>{item.quantity}</span>
                          <button onClick={() => onChangeQuantity(item.id, 1)}>
                            <Plus size={13} />
                          </button>
                        </div>

                        <button
                          className="remove-button"
                          onClick={() => onRemove(item.id)}
                        >
                          <Trash2 size={14} />
                          Remove
                        </button>
                      </div>
                    </div>
                  </div>
                ))
              )}
            </div>

            {cart.length > 0 && (
              <div className="cart-footer">
                <div className="subtotal">
                  <span>Subtotal</span>
                  <strong>{formatINR(subtotal)}</strong>
                </div>

                <p>
                  Shipping is complimentary above ₹2,999. Taxes and final delivery details
                  appear at checkout.
                </p>

                <button className="checkout-button" onClick={onCheckout}>
                  Secure checkout
                  <ArrowRight size={16} />
                </button>
              </div>
            )}
          </motion.aside>
        </>
      )}
    </AnimatePresence>
  );
}
