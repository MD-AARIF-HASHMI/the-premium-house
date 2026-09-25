import { AnimatePresence, motion } from "motion/react";
import { ArrowRight, Search, X } from "lucide-react";
import { formatINR, getProductImage } from "../../utils/format";

export default function SearchPanel({
  open,
  query,
  setQuery,
  results,
  onClose,
  onOpenProduct,
}) {
  return (
    <AnimatePresence>
      {open && (
        <motion.div
          className="search-screen"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
        >
          <div className="search-screen-inner">
            <div className="search-header">
              <div>
                <p className="eyebrow">THE PREMIUM HOUSE</p>
                <h2>Search the collection</h2>
              </div>
              <button onClick={onClose} aria-label="Close search">
                <X size={24} />
              </button>
            </div>

            <div className="search-input-wrap">
              <Search size={22} />
              <input
                autoFocus
                value={query}
                onChange={(event) => setQuery(event.target.value)}
                placeholder="Try “black shoes under 5000”, “watch for men”, “gift for her”"
              />
            </div>

            {!query.trim() ? (
              <div className="search-hints">
                <span>Popular</span>
                <button onClick={() => setQuery("shoes")}>Shoes</button>
                <button onClick={() => setQuery("watch")}>Watches</button>
                <button onClick={() => setQuery("gift")}>Gifts</button>
                <button onClick={() => setQuery("men")}>Men</button>
                <button onClick={() => setQuery("women")}>Women</button>
              </div>
            ) : (
              <div className="search-results">
                <div className="search-result-heading">
                  <span>{results.length} results</span>
                  <span>Matched across the house</span>
                </div>

                {results.length ? (
                  <div className="search-product-grid">
                    {results.slice(0, 12).map((product) => (
                      <button
                        className="search-product"
                        key={product.id}
                        onClick={() => onOpenProduct(product)}
                      >
                        <img
                          src={getProductImage(product)}
                          alt={product.name}
                          onError={(event) => {
                            event.currentTarget.style.opacity = "0.4";
                          }}
                        />
                        <span className="search-product-copy">
                          <small>
                            {product.brandName || product.categoryName}
                          </small>
                          <strong>{product.name}</strong>
                          <span>{formatINR(product.price)}</span>
                        </span>
                        <ArrowRight size={15} />
                      </button>
                    ))}
                  </div>
                ) : (
                  <div className="empty-results search-empty">
                    <div className="empty-results-mark">PH</div>
                    <h3>No exact match.</h3>
                    <p>Try a broader word such as shoes, watch, men, women or gift.</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
