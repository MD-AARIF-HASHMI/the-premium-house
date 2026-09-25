const API_PREFIX = "/api/catalog";

async function request(url, options = {}) {
  const response = await fetch(url, {
    ...options,
    headers: {
      Accept: "application/json",
      ...(options.headers || {}),
    },
  });

  if (!response.ok) {
    let message = "Request failed";
    try {
      const body = await response.json();
      message = body?.message || body?.error || message;
    } catch {
      // Ignore invalid error bodies.
    }
    throw new Error(message);
  }

  return response.json();
}

export async function fetchProducts({ search = "", category = "", page = 0, size = 48 } = {}) {
  const params = new URLSearchParams({
    page: String(Math.max(0, page)),
    size: String(Math.min(Math.max(size, 1), 48)),
  });

  if (search.trim()) params.set("search", search.trim());
  if (category.trim()) params.set("category", category.trim());

  return request(`${API_PREFIX}/products?${params.toString()}`);
}

export async function fetchCategories() {
  return request(`${API_PREFIX}/categories`);
}

export async function fetchBrands() {
  return request(`${API_PREFIX}/brands`);
}
