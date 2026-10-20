import { X, Minus, Plus, Trash2, ArrowRight, Heart } from "lucide-react";

export default function Drawer({ cart, onClose, onQty, onRemove, onCheckout }) {
  const subtotal = cart.reduce((s,i)=>s+i.price*i.qty,0);
  const discount = cart.reduce((s,i)=>s+(i.mrp-i.price)*i.qty,0);
  return <div className="overlay" onClick={onClose}>
    <aside className="drawer" onClick={e=>e.stopPropagation()}>
      <div className="drawer-head"><div><span className="eyebrow">SHOPPING BAG</span><h2>My Cart <small>({cart.reduce((s,i)=>s+i.qty,0)} items)</small></h2></div><button onClick={onClose}><X/></button></div>
      {cart.length===0 ? <div className="empty"><ShoppingBagIcon/><h3>Your bag is waiting</h3><p>Add something exceptional to continue.</p></div> :
      <><div className="cart-list">{cart.map(i=><div className="cart-item" key={i.id}>
        <img src={i.image} alt={i.name}/><div className="cart-info"><div className="eyebrow">{i.brand}</div><strong>{i.name}</strong><div className="mini-price">₹{i.price.toLocaleString("en-IN")} <del>₹{i.mrp.toLocaleString("en-IN")}</del></div>
        <div className="qty"><button onClick={()=>onQty(i.id,-1)}><Minus size={13}/></button><span>{i.qty}</span><button onClick={()=>onQty(i.id,1)}><Plus size={13}/></button><button className="remove" onClick={()=>onRemove(i.id)}><Trash2 size={14}/></button></div>
        </div></div>)}</div>
        <div className="cart-bottom"><label>Have a coupon code?<div className="coupon"><input placeholder="PREMIUM10"/><button>Apply</button></div></label>
          <div className="summary"><span>Subtotal</span><b>₹{subtotal.toLocaleString("en-IN")}</b><span>Discount</span><b className="green">-₹{discount.toLocaleString("en-IN")}</b><span>Delivery</span><b className="green">FREE</b><strong>Total</strong><strong>₹{(subtotal).toLocaleString("en-IN")}</strong></div>
          <button className="primary full" onClick={onCheckout}>Proceed to Checkout <ArrowRight size={16}/></button>
          <p className="secure-note"><Heart size={14}/> Secure checkout · Easy returns · Genuine products</p>
        </div></>}
    </aside>
  </div>
}
function ShoppingBagIcon(){ return <div className="empty-icon">♢</div> }