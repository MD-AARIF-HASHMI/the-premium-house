import ProductCard from "./ProductCard";

export default function ProductGrid(props) {
  const { products = [], ...cardProps } = props;

  if (!products.length) {
    return (
      <div className="empty-results">
        <ShoppingBagIcon />
        <h3>No pieces found.</h3>
        <p>Try another search or category.</p>
      </div>
    );
  }

  return (
    <div className="product-grid">
      {products.map((product, index) => (
        <ProductCard
          key={product.id}
          product={product}
          index={index}
          {...cardProps}
        />
      ))}
    </div>
  );
}

function ShoppingBagIcon() {
  return <div className="empty-results-mark">PH</div>;
}
