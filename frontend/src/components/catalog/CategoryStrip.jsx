import { NAV_CATEGORIES } from "../../data/site";

export default function CategoryStrip({ activeCategory, onChange }) {
  return (
    <div className="filter-bar">
      {NAV_CATEGORIES.map((item) => (
        <button
          key={item.slug || "all"}
          className={`filter ${activeCategory === item.slug ? "active" : ""}`}
          onClick={() => onChange(item.slug)}
        >
          {item.label}
        </button>
      ))}
    </div>
  );
}
