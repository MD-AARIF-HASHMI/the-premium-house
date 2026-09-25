import { useEffect, useMemo, useState } from "react";
import { AnimatePresence, motion } from "motion/react";
import { ArrowRight, Check, Heart, Sparkles, Truck, ShieldCheck } from "lucide-react";

import Header from "./components/layout/Header";
import ProductCard from "./components/catalog/ProductCard";
import ProductSkeleton from "./components/catalog/ProductSkeleton";
import CategoryStrip from "./components/catalog/CategoryStrip";
import CategoryShowcase from "./components/catalog/CategoryShowcase";
import SearchPanel from "./components/search/SearchPanel";
import CartDrawer from "./components/cart/CartDrawer";
import ProductModal from "./components/catalog/ProductModal";
import CheckoutModal from "./components/checkout/CheckoutModal";

import { FEATURED_CATEGORIES, HERO_IMAGE, EDITORIAL_IMAGE, SHOWCASE_IMAGE } from "./data/site";
import { useCatalog } from "./hooks/useCatalog";
import { useLocalStorage } from "./hooks/useLocalStorage";
import { formatINR, getProductImage } from "./utils/format";

function mapProduct(product) {
  return {
    ...product,
    imageUrl: product.primaryImageUrl || "",
  };
}

export default function App() {
  const [category, setCategory] = useState("");
  const [search, setSearch] = useState("");
  const [searchOpen, setSearchOpen] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [cartOpen, setCartOpen] = useState(false);
  const [quickView, setQuickView] = useState(null);
  const [buyNow, setBuyNow] = useState(null);
  const [checkoutOpen, setCheckoutOpen] = useState(false);
  const [toast, setToast] = useState("");

  const [cart, setCart] = useLocalStorage("tph-cart-v1", []);
  const [wishlist, setWishlist] = useLocalStorage("tph-wishlist-v1", []);

  const {
    products: apiProducts,
    totalElements,
    loading,
    error,
    reload,
  } = useCatalog({ search, category });

  const products = useMemo(
    () => apiProducts.map(mapProduct),
    [apiProducts]
  );

  const searchResults = useMemo(() => {
    if (!search.trim()) return products;

    const q = search.trim().toLowerCase();

    const numericMax = q.match(/(?:under|below|less than)\s*(?:₹|rs\.?|inr)?\s*(\d[\d,]*)/i);
    const maxPrice = numericMax ? Number(numericMax[1].replaceAll(",", "")) : null;

    const wantsMen = /\bmen\b|\bmens\b|\bfor him\b/i.test(q);
    const wantsWomen = /\bwomen\b|\bwomens\b|\bfor her\b/i.test(q);

    const tokens = q
      .replace(/under|below|less than|₹|rs\.?|inr|\d[\d,]*/gi, "")
      .split(/\s+/)
      .map((token) => token.trim())
      .filter((token) => token.length >= 2);

    return products.filter((product) => {
      const haystack = [
        product.name,
        product.brandName,
        product.categoryName,
        product.categorySlug,
        product.slug,
        product.shortDescription,
        product.description,
        product.sku,
      ]
        .filter(Boolean)
        .join(" ")
        .toLowerCase();

      const categoryMatch = wantsMen
        ? /men/i.test(`${product.categoryName} ${product.categorySlug}`)
        : wantsWomen
          ? /women/i.test(`${product.categoryName} ${product.categorySlug}`)
          : true;

      const priceMatch =
        maxPrice === null || Number(product.price) <= maxPrice;

      const textMatch =
        tokens.length === 0 || tokens.every((token) => haystack.includes(token));

      return categoryMatch && priceMatch && textMatch;
    });
  }, [products, search]);

  const trending = useMemo(
    () => [...products].sort((a, b) => Number(b.discountPercent || 0) - Number(a.discountPercent || 0)).slice(0, 8),
    [products]
  );

  const newArrivals = useMemo(
    () => [...products].slice(0, 8),
    [products]
  );

  const premiumEdit = useMemo(
    () => [...products].filter((item) => Number(item.price) >= 5000).slice(0, 4),
    [products]
  );

  const cartCount = cart.reduce((sum, item) => sum + Number(item.quantity || 0), 0);

  const subtotal = cart.reduce(
    (sum, item) => sum + Number(item.price || 0) * Number(item.quantity || 0),
    0
  );

  useEffect(() => {
    const handler = () => setCartOpen(true);
    document.addEventListener("tph:open-cart", handler);

    return () => document.removeEventListener("tph:open-cart", handler);
  }, []);

  useEffect(() => {
    const handleKeyDown = (event) => {
      if (event.key === "Escape") {
        setSearchOpen(false);
        setCartOpen(false);
        setMobileOpen(false);
        setQuickView(null);
        setBuyNow(null);
        setCheckoutOpen(false);
      }
    };

    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, []);

  useEffect(() => {
    if (!toast) return;

    const timer = window.setTimeout(() => setToast(""), 2200);
    return () => window.clearTimeout(timer);
  }, [toast]);

  function showToast(message) {
    setToast(message);
  }

  function toggleWishlist(id) {
    setWishlist((current) =>
      current.includes(id)
        ? current.filter((item) => item !== id)
        : [...current, id]
    );
    showToast(wishlist.includes(id) ? "Removed from wishlist" : "Saved to wishlist");
  }

  function addToCart(product) {
    setCart((current) => {
      const existing = current.find((item) => item.id === product.id);

      if (existing) {
        return current.map((item) =>
          item.id === product.id
            ? { ...item, quantity: Number(item.quantity || 0) + 1 }
            : item
        );
      }

      return [...current, { ...product, quantity: 1 }];
    });

    showToast(`${product.name} added to your bag`);
    setCartOpen(true);
  }

  function updateQuantity(id, amount) {
    setCart((current) =>
      current
        .map((item) => {
          if (item.id !== id) return item;
          const next = Math.max(1, Number(item.quantity || 1) + amount);
          return { ...item, quantity: next };
        })
        .filter((item) => Number(item.quantity) > 0)
    );
  }

  function removeFromCart(id) {
    setCart((current) => current.filter((item) => item.id !== id));
    showToast("Removed from bag");
  }

  function changeCategory(nextCategory) {
    setCategory(nextCategory);
    setSearch("");
    window.requestAnimationFrame(() => {
      document.getElementById("shop")?.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  }

  function openBuyNow(product) {
    setBuyNow(product);
  }

  function continueFromBuyNow(product) {
    addToCart(product);
    setBuyNow(null);
    setCartOpen(true);
    setCheckoutOpen(true);
  }

  function openCheckout() {
    setCartOpen(false);
    setCheckoutOpen(true);
  }

  function finishCheckout() {
    setCheckoutOpen(false);
    setCart([]);
    showToast("Checkout prototype completed");
  }

  return (
    <div className="premium-app" id="top">
      <Header
        cartCount={cartCount}
        onSearch={() => setSearchOpen(true)}
        mobileOpen={mobileOpen}
        setMobileOpen={setMobileOpen}
        onCategoryChange={changeCategory}
      />

      <main>
        <section className="hero">
          <img src={HERO_IMAGE} alt="Luxury fashion editorial" />
          <div className="hero-overlay" />

          <div className="hero-content section">
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.75, ease: "easeOut" }}
            >
              <p className="eyebrow light">The Premium House / 2026</p>
              <h1>
                Wear what
                <br />
                <em>defines you.</em>
              </h1>
              <p className="hero-description">
                A considered collection of fashion, accessories and timeless pieces for people
                with their own point of view.
              </p>

              <div className="hero-buttons">
                <button className="button-white" onClick={() => document.getElementById("shop")?.scrollIntoView({ behavior: "smooth" })}>
                  Explore collection <ArrowRight size={16} />
                </button>
                <a className="button-outline" href="#new-arrivals">
                  New arrivals
                </a>
              </div>
            </motion.div>
          </div>

          <div className="hero-bottom">
            <span>01</span>
            <div />
            <span>THE HOUSE</span>
          </div>
        </section>

        <section className="philosophy section">
          <div className="two-column">
            <div>
              <p className="eyebrow">The House Philosophy</p>
              <h2>
                Luxury is not
                <br />
                <em>more.</em>
              </h2>
            </div>

            <div className="philosophy-copy">
              <p>
                It is knowing exactly what belongs. The Premium House brings together fashion
                and objects chosen for their character, versatility and ability to stay relevant
                beyond a season.
              </p>
              <button onClick={() => document.getElementById("shop")?.scrollIntoView({ behavior: "smooth" })}>
                Discover the house <ArrowRight size={15} />
              </button>
            </div>
          </div>
        </section>

        <section id="shop" className="section shop-section">
          <div className="section-heading-row">
            <div>
              <p className="eyebrow">The Collection</p>
              <h2>Shop the edit</h2>
            </div>
            <span className="product-total">
              {loading ? "Loading collection" : `${totalElements} pieces`}
            </span>
          </div>

          <CategoryStrip activeCategory={category} onChange={changeCategory} />

          {loading ? (
            <ProductSkeleton />
          ) : error ? (
            <div className="error-state">
              <div className="empty-results-mark">PH</div>
              <h3>The collection is resting.</h3>
              <p>{error}</p>
              <button onClick={reload}>Refresh collection</button>
            </div>
          ) : (
            <div key={`${category}:${search}`} className="product-grid">
              {products.length > 0 ? (
                products.map((product, index) => (
                  <ProductCard
                    key={product.id}
                    product={product}
                    index={index}
                    wishlisted={wishlist.includes(product.id)}
                    onWishlist={toggleWishlist}
                    onAdd={addToCart}
                    onQuickView={setQuickView}
                    onBuyNow={openBuyNow}
                  />
                ))
              ) : (
                <div className="empty-results-grid">
                  <div className="empty-results">
                    <div className="empty-results-mark">PH</div>
                    <h3>No pieces found.</h3>
                    <p>Try another category or clear your search.</p>
                    <button onClick={() => { setCategory(""); setSearch(""); }}>
                      View everything
                    </button>
                  </div>
                </div>
              )}
            </div>
          )}
        </section>

        <section id="collections" className="section editorial">
          <div className="editorial-image">
            <img src={EDITORIAL_IMAGE} alt="The Premium House editorial collection" />
            <div className="editorial-overlay" />
            <div className="editorial-content">
              <p className="eyebrow light">Editorial 01</p>
              <h2>
                The art of
                <br />
                <em>dressing well.</em>
              </h2>
              <a href="#new-arrivals" className="editorial-link">
                Explore the edit <ArrowRight size={15} />
              </a>
            </div>
          </div>
        </section>

        <section className="dark-section">
          <div className="section dark-section-inner">
            <div className="section-heading-row">
              <div>
                <p className="eyebrow light">Most wanted</p>
                <h2>Trending now</h2>
              </div>
              <span className="product-total light">Curated from the current house edit</span>
            </div>

            {loading ? (
              <ProductSkeleton />
            ) : (
              <div className="product-grid product-grid-dark">
                {trending.map((product, index) => (
                  <ProductCard
                    key={product.id}
                    product={product}
                    index={index}
                    wishlisted={wishlist.includes(product.id)}
                    onWishlist={toggleWishlist}
                    onAdd={addToCart}
                    onQuickView={setQuickView}
                    onBuyNow={openBuyNow}
                  />
                ))}
              </div>
            )}
          </div>
        </section>

        <section id="new-arrivals" className="section">
          <div className="section-heading-row">
            <div>
              <p className="eyebrow">Just landed</p>
              <h2>New arrivals</h2>
            </div>
            <button className="text-button" onClick={() => changeCategory("")}>
              View all <ArrowRight size={15} />
            </button>
          </div>

          {loading ? (
            <ProductSkeleton />
          ) : (
            <div className="product-grid">
              {newArrivals.map((product, index) => (
                <ProductCard
                  key={product.id}
                  product={product}
                  index={index}
                  wishlisted={wishlist.includes(product.id)}
                  onWishlist={toggleWishlist}
                  onAdd={addToCart}
                  onQuickView={setQuickView}
                  onBuyNow={openBuyNow}
                />
              ))}
            </div>
          )}
        </section>

        <section id="categories" className="section category-section">
          <div className="section-heading-row">
            <div>
              <p className="eyebrow">Browse by mood</p>
              <h2>Find your direction</h2>
            </div>
          </div>

          <CategoryShowcase items={FEATURED_CATEGORIES} onSelect={changeCategory} />
        </section>

        <section className="premium-edit">
          <div className="section premium-edit-inner">
            <div className="premium-copy">
              <p className="eyebrow">The Premium Edit</p>
              <h2>
                Pieces worth
                <br />
                <em>keeping.</em>
              </h2>
              <p>
                A refined selection for material, silhouette and presence — made to stay with you
                beyond the trend cycle.
              </p>
              <button onClick={() => document.getElementById("shop")?.scrollIntoView({ behavior: "smooth" })}>
                Shop premium picks <ArrowRight size={15} />
              </button>
            </div>

            <div className="premium-products-wrap">
              {premiumEdit.length ? (
                <div className="product-grid">
                  {premiumEdit.map((product, index) => (
                    <ProductCard
                      key={product.id}
                      product={product}
                      index={index}
                      wishlisted={wishlist.includes(product.id)}
                      onWishlist={toggleWishlist}
                      onAdd={addToCart}
                      onQuickView={setQuickView}
                      onBuyNow={openBuyNow}
                    />
                  ))}
                </div>
              ) : (
                <div className="premium-empty-image">
                  <img src={SHOWCASE_IMAGE} alt="Premium House edit" />
                </div>
              )}
            </div>
          </div>
        </section>

        <section className="service-strip section">
          <div className="service-item">
            <Sparkles size={19} />
            <strong>Curated quality</strong>
            <p>Considered selections across fashion and lifestyle.</p>
          </div>
          <div className="service-item">
            <Truck size={19} />
            <strong>Clear delivery</strong>
            <p>Simple shipping information before checkout.</p>
          </div>
          <div className="service-item">
            <ShieldCheck size={19} />
            <strong>Secure payments</strong>
            <p>Designed for trusted, frictionless shopping.</p>
          </div>
          <div className="service-item">
            <Heart size={19} />
            <strong>Save favourites</strong>
            <p>Your wishlist stays in the browser.</p>
          </div>
        </section>

        <section className="newsletter">
          <div className="newsletter-inner">
            <p className="eyebrow light">The Private List</p>
            <h2>
              Your next
              <br />
              <em>favourite piece.</em>
            </h2>
            <p>New drops, private edits and limited collections. No unnecessary noise.</p>
            <form
              onSubmit={(event) => {
                event.preventDefault();
                showToast("You're on the private list");
              }}
            >
              <input type="email" required placeholder="Your email address" />
              <button type="submit">
                Join <ArrowRight size={15} />
              </button>
            </form>
          </div>
        </section>
      </main>

      <footer>
        <div className="section footer-grid">
          <div className="footer-brand">
            <div className="logo">THE PREMIUM HOUSE</div>
            <p>A modern destination for considered fashion, accessories and everyday luxury.</p>
          </div>

          <div className="footer-column">
            <span>Explore</span>
            <a href="#shop">Shop</a>
            <a href="#new-arrivals">New Arrivals</a>
            <a href="#collections">Collections</a>
            <a href="#categories">Categories</a>
          </div>

          <div className="footer-column">
            <span>House</span>
            <a href="#top">About</a>
            <a href="#top">Contact</a>
            <a href="#top">Shipping</a>
            <a href="#top">Returns</a>
          </div>

          <div className="footer-column">
            <span>Follow</span>
            <a href="#top">Instagram</a>
            <a href="#top">Pinterest</a>
            <a href="#top">YouTube</a>
            <a href="#top">Newsletter</a>
          </div>
        </div>

        <div className="footer-bottom section">
          <span>© 2026 The Premium House</span>
          <span>Built around a real Spring Boot catalog API</span>
        </div>
      </footer>

      <SearchPanel
        open={searchOpen}
        query={search}
        setQuery={setSearch}
        results={searchResults}
        onClose={() => setSearchOpen(false)}
        onOpenProduct={(product) => {
          setSearchOpen(false);
          setQuickView(product);
        }}
      />

      <CartDrawer
        open={cartOpen}
        cart={cart}
        subtotal={subtotal}
        onClose={() => setCartOpen(false)}
        onChangeQuantity={updateQuantity}
        onRemove={removeFromCart}
        onCheckout={openCheckout}
      />

      <ProductModal
        product={quickView}
        open={Boolean(quickView)}
        onClose={() => setQuickView(null)}
        onAdd={(product) => {
          addToCart(product);
          setQuickView(null);
        }}
        onBuyNow={(product) => {
          setQuickView(null);
          openBuyNow(product);
        }}
      />

      <ProductModal
        product={buyNow}
        open={Boolean(buyNow)}
        onClose={() => setBuyNow(null)}
        onAdd={(product) => {
          addToCart(product);
          setBuyNow(null);
        }}
        onBuyNow={(product) => continueFromBuyNow(product)}
      />

      <CheckoutModal
        open={checkoutOpen}
        cart={cart}
        subtotal={subtotal}
        onClose={() => setCheckoutOpen(false)}
        onComplete={finishCheckout}
      />

      <AnimatePresence>
        {toast && (
          <motion.div
            className="toast"
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 16 }}
          >
            <Check size={15} />
            {toast}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
