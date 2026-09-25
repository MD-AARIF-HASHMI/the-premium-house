export default function ProductSkeleton({ count = 8 }) {
  return (
    <div className="product-grid">
      {Array.from({ length: count }).map((_, index) => (
        <div className="skeleton-product" key={index}>
          <div className="skeleton-image" />
          <div className="skeleton-line small" />
          <div className="skeleton-line" />
          <div className="skeleton-line price" />
        </div>
      ))}
    </div>
  );
}
