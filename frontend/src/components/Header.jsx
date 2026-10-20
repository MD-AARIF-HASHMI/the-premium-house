import { Heart, Search, ShoppingBag, UserRound, Bell, MapPin, Menu, X } from "lucide-react";
import { useState } from "react";

export default function Header({ cartCount, wishCount, onCart, onWishlist, onAccount, onSearch }) {
  const [open, setOpen] = useState(false);
  return (
    <>
      <header className="header">
        <button className="mobile-menu" onClick={()=>setOpen(!open)}>{open ? <X/> : <Menu/>}</button>
        <button className="logo" onClick={()=>window.scrollTo({top:0,behavior:"smooth"})}><span>◇</span> THE PREMIUM HOUSE</button>
        <div className="searchbar" onClick={onSearch}><Search size={17}/><span>Search for products, brands and more...</span></div>
        <div className="header-actions">
          <button title="Location"><MapPin size={18}/></button>
          <button onClick={onWishlist} title="Wishlist"><Heart size={19}/><b>{wishCount}</b></button>
          <button title="Notifications"><Bell size={19}/></button>
          <button onClick={onCart} title="Cart"><ShoppingBag size={19}/><b>{cartCount}</b></button>
          <button onClick={onAccount} title="Account"><UserRound size={19}/></button>
        </div>
      </header>
      <nav className={`nav ${open ? "open" : ""}`}>
        {["Men","Women","Shoes","Watches","Bags","Accessories","Brands","Deals"].map(x=><button key={x}>{x}</button>)}
      </nav>
    </>
  );
}