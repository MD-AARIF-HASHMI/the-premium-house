import { X, Search, Clock3, TrendingUp } from "lucide-react";
import { useMemo, useState } from "react";

export default function SearchPanel({ products, onClose, onOpen }) {
  const [q,setQ]=useState("");
  const results=useMemo(()=>products.filter(p=>(p.name+" "+p.brand+" "+p.category).toLowerCase().includes(q.toLowerCase())).slice(0,6),[q,products]);
  return <div className="overlay search-overlay" onClick={onClose}><div className="search-panel" onClick={e=>e.stopPropagation()}>
    <div className="search-big"><Search/><input autoFocus value={q} onChange={e=>setQ(e.target.value)} placeholder="Search products, brands, categories..."/><button onClick={onClose}><X/></button></div>
    {!q && <div className="search-suggestions"><div><h4><Clock3/> Recent searches</h4><button>suede jacket</button><button>nike sneakers</button><button>leather bags</button></div><div><h4><TrendingUp/> Trending now</h4><button>New season</button><button>Premium watches</button><button>Minimal accessories</button></div></div>}
    {q && <div className="search-results">{results.length ? results.map(p=><button key={p.id} onClick={()=>onOpen(p)}><img src={p.image}/><span><b>{p.name}</b><small>{p.brand} · ₹{p.price.toLocaleString("en-IN")}</small></span></button>) : <div className="no-results"><h3>No exact match</h3><p>Try a brand, category or a simpler search.</p></div>}</div>}
  </div></div>
}