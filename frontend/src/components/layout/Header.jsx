import { AnimatePresence, motion } from "motion/react";
import { Menu, Search, ShoppingBag, X } from "lucide-react";
import { NAV_CATEGORIES } from "../../data/site";

export default function Header({
  cartCount,
  onSearch,
  mobileOpen,
  setMobileOpen,
  onCategoryChange,
}) {
  return (
    <>
      <div className="announcement">
        <span>Complimentary shipping over ₹2,999</span>
        <span className="announcement-dot">•</span>
        <span>Private access to new collections</span>
      </div>

      <header className="site-header">
        <div className="header-inner">
          <button
            className="mobile-menu-button"
            onClick={() => setMobileOpen(true)}
            aria-label="Open menu"
          >
            <Menu size={21} />
          </button>

          <a className="logo" href="#top" aria-label="The Premium House home">
            THE PREMIUM HOUSE
          </a>

          <nav className="desktop-nav" aria-label="Primary navigation">
            <a href="#shop">Shop</a>
            <a href="#new-arrivals">New Arrivals</a>
            <a href="#collections">Collections</a>
            <a href="#categories">Categories</a>
          </nav>

          <div className="header-actions">
            <button onClick={onSearch} aria-label="Search">
              <Search size={20} strokeWidth={1.6} />
            </button>

            <a
              className="bag-button"
              href="#cart"
              onClick={(event) => {
                event.preventDefault();
                document.dispatchEvent(new CustomEvent("tph:open-cart"));
              }}
              aria-label={`Shopping bag${cartCount ? `, ${cartCount} items` : ""}`}
            >
              <ShoppingBag size={20} strokeWidth={1.6} />
              <AnimatePresence>
                {cartCount > 0 && (
                  <motion.span
                    className="cart-number"
                    initial={{ scale: 0 }}
                    animate={{ scale: 1 }}
                    exit={{ scale: 0 }}
                  >
                    {cartCount}
                  </motion.span>
                )}
              </AnimatePresence>
            </a>
          </div>
        </div>
      </header>

      <AnimatePresence>
        {mobileOpen && (
          <>
            <motion.div
              className="drawer-overlay"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={() => setMobileOpen(false)}
            />

            <motion.aside
              className="mobile-drawer"
              initial={{ x: "-100%" }}
              animate={{ x: 0 }}
              exit={{ x: "-100%" }}
              transition={{ duration: 0.3, ease: "easeOut" }}
            >
              <div className="drawer-top">
                <span className="logo">TPH</span>
                <button onClick={() => setMobileOpen(false)} aria-label="Close menu">
                  <X size={22} />
                </button>
              </div>

              <nav className="mobile-navigation">
                <a href="#shop" onClick={() => setMobileOpen(false)}>Shop</a>
                <a href="#new-arrivals" onClick={() => setMobileOpen(false)}>New Arrivals</a>
                <a href="#collections" onClick={() => setMobileOpen(false)}>Collections</a>
                <a href="#categories" onClick={() => setMobileOpen(false)}>Categories</a>
              </nav>

              <div className="mobile-category-list">
                <p className="eyebrow">Browse categories</p>
                {NAV_CATEGORIES.filter((item) => item.slug).map((item) => (
                  <button
                    key={item.slug}
                    onClick={() => {
                      onCategoryChange(item.slug);
                      setMobileOpen(false);
                    }}
                  >
                    {item.label}
                  </button>
                ))}
              </div>
            </motion.aside>
          </>
        )}
      </AnimatePresence>
    </>
  );
}
