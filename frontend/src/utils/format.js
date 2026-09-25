export function formatINR(value) {
  const amount = Number(value);
  if (!Number.isFinite(amount)) return "₹0";

  return new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "INR",
    maximumFractionDigits: 0,
  }).format(Math.round(amount));
}

export function percentOff(price, mrp) {
  const safePrice = Number(price);
  const safeMrp = Number(mrp);

  if (!Number.isFinite(safePrice) || !Number.isFinite(safeMrp) || safeMrp <= 0) {
    return 0;
  }

  return Math.max(0, Math.round(((safeMrp - safePrice) / safeMrp) * 100));
}

export function humanizeSlug(slug = "") {
  return slug
    .replaceAll("-", " ")
    .replace(/\b\w/g, (letter) => letter.toUpperCase());
}

export function truncate(text = "", length = 100) {
  if (text.length <= length) return text;
  return `${text.slice(0, length).trim()}…`;
}

export function getProductImage(product) {
  return product?.primaryImageUrl || product?.imageUrl || "";
}
