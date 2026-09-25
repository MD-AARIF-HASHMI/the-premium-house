import { useCallback, useEffect, useState } from "react";
import { fetchCategories, fetchProducts } from "../services/catalogApi";

export function useCatalog({ search, category }) {
  const [data, setData] = useState({
    products: [],
    totalElements: 0,
    totalPages: 0,
  });
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const load = useCallback(async () => {
    try {
      setLoading(true);
      setError("");

      const [productPage, categoryList] = await Promise.all([
        fetchProducts({ search, category, page: 0, size: 48 }),
        fetchCategories(),
      ]);

      setData({
        products: Array.isArray(productPage?.content) ? productPage.content : [],
        totalElements: Number(productPage?.totalElements || 0),
        totalPages: Number(productPage?.totalPages || 0),
      });

      setCategories(Array.isArray(categoryList) ? categoryList : []);
    } catch (err) {
      console.error("Catalog load error:", err);
      setError(
        "We couldn't load the collection. Make sure the Spring Boot backend is running on port 8080."
      );
    } finally {
      setLoading(false);
    }
  }, [search, category]);

  useEffect(() => {
    load();
  }, [load]);

  return {
    ...data,
    categories,
    loading,
    error,
    reload: load,
  };
}
