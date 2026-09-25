import { motion } from "motion/react";
import { ArrowRight } from "lucide-react";

export default function CategoryShowcase({ items, onSelect }) {
  return (
    <div className="category-grid">
      {items.map((item) => (
        <motion.button
          key={item.slug}
          className="category-card"
          onClick={() => onSelect(item.slug)}
          whileHover={{ y: -6 }}
          transition={{ duration: 0.22 }}
        >
          <img src={item.image} alt={item.title} loading="lazy" />
          <div className="category-overlay" />
          <div className="category-content">
            <span>{item.subtitle}</span>
            <h3>{item.title}</h3>
            <div>
              Explore
              <ArrowRight size={14} />
            </div>
          </div>
        </motion.button>
      ))}
    </div>
  );
}
