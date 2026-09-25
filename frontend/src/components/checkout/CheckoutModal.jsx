import { Check, Lock } from "lucide-react";
import ModalShell from "../common/ModalShell";
import { formatINR } from "../../utils/format";

export default function CheckoutModal({
  open,
  cart,
  subtotal,
  onClose,
  onComplete,
}) {
  return (
    <ModalShell open={open} onClose={onClose} className="checkout-modal">
      <div className="checkout-content">
        <p className="eyebrow">SECURE CHECKOUT</p>
        <h2>Complete your order.</h2>
        <p className="checkout-intro">
          This first frontend checkout step keeps your current bag intact. Payment gateway
          and order persistence can be connected to the Spring Boot order module next.
        </p>

        <div className="checkout-summary">
          <div>
            <span>Items</span>
            <strong>{cart.reduce((sum, item) => sum + item.quantity, 0)}</strong>
          </div>
          <div>
            <span>Subtotal</span>
            <strong>{formatINR(subtotal)}</strong>
          </div>
        </div>

        <div className="checkout-notes">
          <span><Check size={15} /> Secure payment handoff</span>
          <span><Check size={15} /> Delivery details collected next</span>
          <span><Lock size={15} /> Your bag is preserved</span>
        </div>

        <button className="primary-action full" onClick={onComplete}>
          Continue
        </button>
      </div>
    </ModalShell>
  );
}
