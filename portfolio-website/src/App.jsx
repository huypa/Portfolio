import { useState, useEffect, useRef } from "react";
import { motion } from "framer-motion";
import { Analytics } from "@vercel/analytics/react";
import profileImg from "../profile.jpeg";

// ── FRAMER MOTION SCROLL REVEAL (replaces JS IntersectionObserver) ──
function Reveal({ children, delay = 0, dir = "up", className = "", style = {} }) {
  const variants = {
    hidden: dir === "left" ? { opacity: 0, x: -20 } : { opacity: 0, y: 22 },
    visible: { opacity: 1, x: 0, y: 0 },
  };
  return (
    <motion.div
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.08 }}
      variants={variants}
      transition={{ duration: 0.55, ease: "easeOut", delay: delay / 1000 }}
      className={className}
      style={style}
    >
      {children}
    </motion.div>
  );
}

// ── DATA ──
const techStack = [
  { cat: "Code",            pills: ["Python", "SQL", "R"],                      hl: ["Python", "SQL"] },
  { cat: "Visualisation",   pills: ["Power BI", "Tableau", "Looker Studio"],    hl: ["Power BI"] },
  { cat: "ELT & Warehouse", pills: ["dbt", "BigQuery", "Dataform", "Kimball"],  hl: ["dbt", "BigQuery"] },
  { cat: "Data Eng.",       pills: ["Kafka", "Spark", "Docker"],                hl: ["Kafka", "Spark", "Docker"] },
  { cat: "Machine Learning",pills: ["scikit-learn", "PyTorch", "PySpark MLlib"],hl: ["scikit-learn", "PyTorch"] },
  { cat: "LLM",             pills: ["OpenAI API", "RAG", "Prompt Eng."],        hl: [] },
];

const projects = [
  { id: 1, title: "eCommerce Fraud Detection System", year: "2025", cats: ["bigdata", "ml"],
    tags: [{ l: "Big Data", c: "blue" }, { l: "Machine Learning", c: "teal" }],
    bullets: ["Engineered a real-time fraud detection platform processing <strong>22M+ records</strong> via PySpark to rapidly detect and flag suspicious transactions", "Containerized solution with Docker for scalable deployment across environments", "Deployed Random Forest, Gradient-Boosted Trees, and K-Means clustering to predict fraud and uncover hidden behavioral patterns"],
    results: ["22M+ records", "RF + GBT + K-Means", "Docker deployed"],
    link: "https://github.com/huypa/Portfolio-Big-Data-Processing", lbl: "View on GitHub", ico: "gh" },
  { id: 2, title: "Text Data Wrangling & Pre-processing", year: "2025", cats: ["nlp", "ml"],
    tags: [{ l: "NLP", c: "purple" }, { l: "Machine Learning", c: "teal" }],
    bullets: ["Extracted and transformed semi-structured text (XML, YouTube comments) into structured datasets for NLP and database integration", "Applied regex parsing, text cleaning (emoji removal, stemming, language detection), and feature engineering (unigrams, bigrams, count vectors)", "Delivered JSON/CSV outputs ready for downstream modelling pipelines"],
    results: ["99/100 score", "Semi-structured → structured"],
    link: "https://github.com/huypa/Portfolio-Data-Wrangling", lbl: "View on GitHub", ico: "gh" },
  { id: 3, title: "Statistical Machine Learning Suite", year: "2024", cats: ["ml"],
    tags: [{ l: "Machine Learning", c: "teal" }],
    bullets: ["Implemented and evaluated ML models for regression, classification, and unsupervised learning — emphasizing model selection, regularization, and generalization", "Built custom algorithms from scratch: KNN, Ridge Regression, EM, and Neural Networks", "Applied cross-validation, learning curves, and representation learning for rigorous performance benchmarking"],
    results: ["5 algorithms from scratch", "k-fold cross-validated"],
    link: "https://github.com/huypa/Portfolio-Machine-Learning/blob/main/README.md", lbl: "View on GitHub", ico: "gh" },
  { id: 4, title: "Semi-Structured Data Analytics", year: "2024", cats: ["analytics", "nlp"],
    tags: [{ l: "Analytics Engineering", c: "green" }, { l: "NLP", c: "purple" }],
    bullets: ["Engineered end-to-end pipelines across three heterogeneous data sources (REST APIs, XML feeds, relational DB) into MongoDB and Neo4j", "Applied graph-based relationship modelling and NLP techniques to extract structured insights from unstructured content", "Designed a robust data quality validation framework delivering actionable outputs from ingestion to insight"],
    results: ["Top rank in class", "3 heterogeneous sources"],
    link: "https://github.com/huypa/Portfolio-Data-analytics-for-semi-structured-data/tree/main", lbl: "View on GitHub", ico: "gh" },
  { id: 5, title: "Wide World Importers — Data Warehouse", year: "2025", cats: ["analytics", "bigdata"],
    tags: [{ l: "Analytics Engineering", c: "green" }, { l: "Big Data", c: "blue" }],
    bullets: ["Designed Kimball star schema across Sales, Purchasing, Customers & Suppliers domains in BigQuery", "Built modular dbt staging, intermediate, and mart layers with full lineage documentation", "Standardized metric definitions across business units to ensure a single source of truth"],
    results: ["4 star schemas", "100% lineage docs"],
    link: "https://github.com/huypa/Portfolio", lbl: "View on GitHub", ico: "gh" },
  { id: 6, title: "Power BI — Coffee Shop Dashboard", year: "2024", cats: ["bi"],
    tags: [{ l: "Business Intelligence", c: "orange" }],
    bullets: ["Designed snowflake schema across 5 NYC store locations for a unified sales data model", "Built Monday vs weekend and cross-store performance comparisons to surface operational patterns", "Revealed consistent <strong>22–23% MoM revenue growth</strong> trend across all locations"],
    results: ["+23% MoM revenue", "5 locations"],
    link: "#", lbl: "View Live Dashboard", ico: "ext" },
  { id: 7, title: "Power BI — Pizza Sales Dashboard", year: "2024", cats: ["bi"],
    tags: [{ l: "Business Intelligence", c: "orange" }],
    bullets: ["Built dynamic metric switching across Revenue, Orders, Quantity, and AOV using DAX measure selection patterns", "Implemented percentile order analysis (P20–P90) to surface demand distribution insights", "Designed topN pizza ranking by concentration score to guide menu and pricing decisions"],
    results: ["4 dynamic metrics", "P20–P90 analysis"],
    link: "#", lbl: "View Live Dashboard", ico: "ext" },
];

const FILTERS = [
  { k: "all", l: "All" }, { k: "bigdata", l: "Big Data" }, { k: "ml", l: "Machine Learning" },
  { k: "nlp", l: "NLP" }, { k: "analytics", l: "Analytics Engineering" }, { k: "bi", l: "Business Intelligence" },
];

// ── ICONS ──
const GithubIcon = () => (
  <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
    <path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 00-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0020 4.77 5.07 5.07 0 0019.91 1S18.73.65 16 2.48a13.38 13.38 0 00-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 005 4.77a5.44 5.44 0 00-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 009 18.13V22" />
  </svg>
);
const ExtIcon = () => (
  <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
    <path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6" />
    <polyline points="15 3 21 3 21 9" /><line x1="10" y1="14" x2="21" y2="3" />
  </svg>
);

// ── NAV ──
function Nav() {
  const [active, setActive] = useState("");
  useEffect(() => {
    const ids = ["projects", "experience", "education", "contact"];
    const fn = () => {
      let cur = "";
      ids.forEach(id => { const el = document.getElementById(id); if (el && window.scrollY >= el.offsetTop - 80) cur = id; });
      setActive(cur);
    };
    window.addEventListener("scroll", fn, { passive: true });
    return () => window.removeEventListener("scroll", fn);
  }, []);
  const scroll = id => document.getElementById(id)?.scrollIntoView({ behavior: "smooth" });
  return (
    <motion.nav initial={{ y: -60, opacity: 0 }} animate={{ y: 0, opacity: 1 }} transition={{ duration: 0.4, ease: "easeOut" }}>
      <div className="nav-inner">
        <button className="nav-logo-btn" onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}>
          <div className="nav-logo-icon">
            <svg width="14" height="14" fill="none" stroke="#fff" strokeWidth="2" viewBox="0 0 24 24">
              <polyline points="16 18 22 12 16 6" /><polyline points="8 6 2 12 8 18" />
            </svg>
          </div>
          <span className="nav-logo">Anh Huy Phung</span>
        </button>
        <div className="nav-links">
          {["Projects", "Experience", "Education", "Contact"].map(l => (
            <span key={l} onClick={() => scroll(l.toLowerCase())} className={active === l.toLowerCase() ? "nav-active" : ""}>{l}</span>
          ))}
          <button className="nav-cv">
            <svg width="13" height="13" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
              <path d="M12 15V3m0 12-4-4m4 4 4-4M2 17l.621 2.485A2 2 0 004.561 21h14.878a2 2 0 001.94-1.515L22 17" />
            </svg>
            Download CV
          </button>
        </div>
      </div>
    </motion.nav>
  );
}

// ── HERO ──
function Hero() {
  const [displayName, setDisplayName] = useState("");
  const fullName = "Anh Huy Phung";

  useEffect(() => {
    const timeout = setTimeout(() => {
      let i = 0;
      const timer = setInterval(() => {
        setDisplayName(fullName.slice(0, ++i));
        if (i >= fullName.length) clearInterval(timer);
      }, 68);
      return () => clearInterval(timer);
    }, 400);
    return () => clearTimeout(timeout);
  }, []);

  return (
    <section className="hero">
      <div className="wrap">
        {/* Status badge */}
        <motion.div initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.5, delay: 0.05 }} style={{ marginBottom: "24px" }}>
          <div className="status-badge">
            <div className="status-dot" /><span>Open to opportunities</span>
          </div>
        </motion.div>

        {/* Avatar + Name */}
        <div style={{ display: "flex", alignItems: "center", gap: "18px", marginBottom: "16px" }}>
          <motion.div className="avatar" initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.5, delay: 0.2 }}>
            <img src={profileImg} alt="Anh Huy Phung" style={{ width: "100%", height: "100%", objectFit: "cover", borderRadius: "50%" }} />
          </motion.div>
          <div>
            <h1 className="hero-name">{displayName}</h1>
            <motion.p className="hero-title" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ duration: 0.5, delay: 0.75 }} style={{ marginBottom: 0 }}>
              Data Scientist &amp; Analytics Engineer
            </motion.p>
          </div>
        </div>

        {/* About me + What I'm looking for */}
        <Reveal style={{ border: "1px solid var(--border)", borderRadius: "12px", padding: "24px 28px", marginBottom: "16px" }}>
          <div style={{ display: "grid", gridTemplateColumns: "6fr 4fr", alignItems: "stretch" }}>
            <div style={{ paddingRight: "28px", borderRight: "1px solid var(--border)", display: "flex", flexDirection: "column" }}>
              <div className="col-label" style={{ marginBottom: "10px" }}>About me</div>
              <p className="hero-bio">
                Data Analyst with <span className="kw-anim" style={{ animationDelay: "0.2s" }}>2+ years of experience</span> and a <span className="kw-anim" style={{ animationDelay: "0.4s" }}>Master of Data Science</span> (Monash, WAM&nbsp;82.13). Translates complex business challenges into advanced <span className="kw-anim" style={{ animationDelay: "0.6s" }}>ML and analytics solutions</span> — from <span className="kw-anim" style={{ animationDelay: "0.8s" }}>fraud detection systems</span> and <span className="kw-anim" style={{ animationDelay: "1.0s" }}>uplift experiments</span> to <span className="kw-anim" style={{ animationDelay: "1.2s" }}>real-time Spark pipelines</span>. Proven ability to partner with cross-functional stakeholders in <span className="kw-anim" style={{ animationDelay: "1.4s" }}>Fintech (FE Credit, MoMo)</span>, contribute to <span className="kw-anim" style={{ animationDelay: "1.6s" }}>agile delivery lifecycles</span>, and uphold responsible, quality-validated modelling practices.
              </p>
            </div>
            <div style={{ paddingLeft: "28px", display: "flex", flexDirection: "column" }}>
              <div className="col-label" style={{ marginBottom: "10px" }}>What I'm looking for</div>
              <p style={{ fontSize: "13px", color: "var(--subtle)", lineHeight: "1.85" }}>
                Seeking a <span className="kw">Data Analyst</span>, <span className="kw">Data Scientist</span>, or <span className="kw">Analytics Engineer</span> role — building systems that turn data into decisions. Bringing <span className="kw">ML</span>, analytics engineering, and responsible modelling to real-world problems, partnering across functions within a mission-driven team.
              </p>
            </div>
          </div>
        </Reveal>

        {/* Tech I use */}
        <Reveal delay={80} style={{ border: "1px solid var(--border)", borderRadius: "12px", padding: "24px 28px", marginBottom: "28px" }}>
          <div className="col-label" style={{ marginBottom: "14px" }}>Tech I use</div>
          <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "8px 48px" }}>
            {[techStack.slice(0, 3), techStack.slice(3)].map((group, gi) => (
              <div className="tech-grid" key={gi}>
                {group.map(row => (
                  <div className="tech-row" key={row.cat}>
                    <span className="tech-cat">{row.cat}</span>
                    <div className="tech-pills">
                      {row.pills.map(p => <span key={p} className={`pill${row.hl.includes(p) ? " pill-hl" : ""}`}>{p}</span>)}
                    </div>
                  </div>
                ))}
              </div>
            ))}
          </div>
        </Reveal>

        {/* Social buttons */}
        <Reveal delay={160} className="social-row">
          {[
            { href: "mailto:huyphung.work@gmail.com", label: "Mail", icon: <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg> },
            { href: "https://www.linkedin.com/in/anh-huy-phung-a16503212/", label: "LinkedIn", icon: <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24"><path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6z"/><rect x="2" y="9" width="4" height="12"/><circle cx="4" cy="4" r="2"/></svg> },
            { href: "https://github.com/huypa/Portfolio", label: "GitHub", icon: <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 00-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0020 4.77 5.07 5.07 0 0019.91 1S18.73.65 16 2.48a13.38 13.38 0 00-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 005 4.77a5.44 5.44 0 00-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 009 18.13V22"/></svg> },
            { href: "https://calendar.google.com/calendar/u/0/r?authuser=huyphung.work@gmail.com", label: "Book Interview", icon: <svg fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg> },
          ].map(({ href, label, icon }) => (
            <a key={label} href={href} target={href.startsWith("mailto") ? "_self" : "_blank"} rel="noopener noreferrer" className="btn-social">
              {icon}{label}
            </a>
          ))}
        </Reveal>
      </div>
    </section>
  );
}

// ── PROJECTS ──
function Projects() {
  const [active, setActive] = useState("all");
  const filtered = projects.filter(p => active === "all" || p.cats.includes(active));

  // Counter animation for result chips
  useEffect(() => {
    function animCount(el, target, suffix) {
      let v = 0;
      const inc = target / (1200 / 16);
      el.dataset.counted = "1";
      const t = setInterval(() => {
        v = Math.min(v + inc, target);
        el.textContent = Math.round(v) + suffix;
        if (v >= target) clearInterval(t);
      }, 16);
    }
    const obs = new IntersectionObserver(els => {
      els.forEach(e => {
        if (!e.isIntersecting || e.target.dataset.counted) return;
        const txt = e.target.textContent;
        const m = txt.match(/(\d+)/);
        if (m) animCount(e.target, parseInt(m[1]), txt.replace(/\d/g, "").trim());
      });
    }, { threshold: 0.6 });
    document.querySelectorAll(".result-chip").forEach(el => obs.observe(el));
    return () => obs.disconnect();
  }, [active]);

  return (
    <section className="projects-section" id="projects">
      <div className="wrap">
        <div className="section-header">
          <h2 className="section-title">Projects</h2>
          <span className="section-count">{filtered.length} projects</span>
        </div>
        <div className="search-bar">
          <svg width="14" height="14" fill="none" stroke="#C0BFB9" strokeWidth="2" viewBox="0 0 24 24">
            <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
          </svg>
          <span>Search by title, technology, or keyword...</span>
        </div>
        <div className="filter-row">
          {FILTERS.map(f => (
            <span key={f.k} onClick={() => setActive(f.k)} className={active === f.k ? "filter-active" : "filter-pill"}>{f.l}</span>
          ))}
        </div>
        <div className="projects-grid">
          {filtered.map((p, i) => (
            <motion.div
              key={p.id}
              className="project-card"
              initial={{ opacity: 0, y: 22 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, amount: 0.08 }}
              transition={{ duration: 0.45, delay: i * 0.06, ease: "easeOut" }}
              whileHover={{ y: -3, boxShadow: "0 8px 24px rgba(0,0,0,.08)", borderColor: "var(--border-strong)" }}
            >
              <div className="project-header">
                <span className="project-title">{p.title}</span>
                <span className="project-year">{p.year}</span>
              </div>
              <div className="project-tags">
                {p.tags.map(t => <span key={t.l} className={`pill pill-${t.c}`}>{t.l}</span>)}
              </div>
              <ul className="project-bullets">
                {p.bullets.map((b, j) => <li key={j} dangerouslySetInnerHTML={{ __html: b }} />)}
              </ul>
              <div className="project-results">
                {p.results.map(r => <span key={r} className="result-chip">{r}</span>)}
              </div>
              <div className="project-footer">
                <a href={p.link} target="_blank" rel="noopener noreferrer">
                  {p.ico === "gh" ? <GithubIcon /> : <ExtIcon />}{p.lbl}
                </a>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

// ── EXPERIENCE ──
function Experience() {
  const sectionRef = useRef(null);

  const expData = [
    { period: "Aug 2024 – Jan 2026", role: "Fulfilment Operations Co-worker", co: "IKEA", loc: "Springvale, Melbourne",
      bullets: ["Maintained <span class='exp-kw'>97% adherence to operational KPIs</span> across high-volume fulfilment workflows by coordinating across cross-functional teams", "Demonstrated accountability and agile delivery skills directly transferable to data science environments"] },
    { period: "Feb 2023 – May 2023", role: "Business Analyst — Advanced Analytics & BI", co: "FE CREDIT", loc: "Ho Chi Minh City",
      bullets: ["Translated Call Center and CRM requirements into <span class='exp-kw'>analytics-ready ELT workflows</span>, standardizing metric definitions to ensure accuracy, consistency, and risk analytical outputs across business units", "Delivered incremental <span class='exp-kw'>pipeline improvements (bi-weekly → daily)</span> in an agile team; reviewed transformation logic with Data Engineers to ensure quality-controlled inputs for CRM dashboards and ML feature datasets", "Designed target vs. control measurement logic, achieving <span class='exp-kw'>~1% uplift in conversion rate</span> by evaluating campaign effectiveness and refining ML-informed targeting strategies"] },
    { period: "Aug 2021 – Dec 2022", role: "Data Analyst — Market Research & Business Intelligence", co: "MOMO E-WALLET", loc: "Ho Chi Minh City",
      bullets: ["Architected and maintained enterprise-level BigQuery dimensional models (raw, staging, OLAP/cubes) powering business operations for <span class='exp-kw'>400K+ monthly users</span> across Travel and Cinema sectors", "Executed <span class='exp-kw'>A/B and uplift experiments</span> using Firebase Analytics and statistical testing (T-test, Chi-square), validating measurable incremental impact of product features and campaigns", "<span class='exp-kw'>Served as trusted analytics partner</span> to Marketing, Finance, Product, and Operations — delivering model-driven insights to optimize incentives and conversion, while aligning stakeholders on a single source of truth"] },
  ];

  useEffect(() => {
    const el = sectionRef.current;
    if (!el) return;
    const obs = new IntersectionObserver(([entry]) => {
      if (!entry.isIntersecting) return;
      el.querySelectorAll(".exp-kw").forEach((kw, i) => setTimeout(() => kw.classList.add("active"), i * 100));
      obs.unobserve(el);
    }, { threshold: 0.05 });
    obs.observe(el);
    return () => obs.disconnect();
  }, []);

  return (
    <section className="experience-section" id="experience" ref={sectionRef}>
      <div className="wrap">
        <h2 className="section-title" style={{ marginBottom: "32px" }}>Working history</h2>
        {expData.map((e, i) => (
          <div key={i}>
            <motion.div
              className="exp-row"
              initial={{ opacity: 0, x: -20 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true, amount: 0.1 }}
              transition={{ duration: 0.5, delay: i * 0.08, ease: "easeOut" }}
              style={i === 0 ? { paddingTop: 0 } : {}}
            >
              <div className="exp-header">
                <div className="exp-role">{e.role}</div>
                <div className="exp-date-badge">{e.period}</div>
              </div>
              <div className="exp-company"><span className="exp-company-name">{e.co}</span> · {e.loc}</div>
              <ul className="exp-bullets">
                {e.bullets.map((b, j) => <li key={j} dangerouslySetInnerHTML={{ __html: b }} />)}
              </ul>
            </motion.div>
            {i < expData.length - 1 && <div className="divider" />}
          </div>
        ))}
      </div>
    </section>
  );
}

// ── EDUCATION ──
function Education() {
  const edu = [
    { degree: "Master of Data Science", school: "Monash University · Melbourne, Australia · 2023–2025", grade: "WAM 82.13",
      bullets: ["Machine Learning", "Analysis for Semi-Structured Data — Top class", "Data Wrangling & Data Visualisation"] },
    { degree: "Bachelor of External Economics", school: "Foreign Trade University (FTU) · Ho Chi Minh City · 2018–2022", grade: "GPA 3.4 / 4.0",
      bullets: ["Top 6 — Data Analyst Camp 2021, Foreign Trade University", "Incentive Prize — National Mathematics Competition for High School Students"] },
  ];
  return (
    <section className="education-section" id="education">
      <div className="wrap">
        <h2 className="section-title" style={{ marginBottom: "24px" }}>Education</h2>
        <div className="edu-grid">
          {edu.map((e, i) => (
            <motion.div
              key={i}
              className="card"
              initial={{ opacity: 0, y: 22 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, amount: 0.1 }}
              transition={{ duration: 0.5, delay: i * 0.1, ease: "easeOut" }}
            >
              <div className="edu-meta">{e.degree}</div>
              <div className="edu-sub">{e.school}</div>
              <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "4px" }}>
                <span className="pill-hl pill">{e.grade}</span>
              </div>
              <ul className="edu-bullets">
                {e.bullets.map(b => <li key={b}>{b}</li>)}
              </ul>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

// ── CONTACT ──
function Contact() {
  return (
    <section className="contact-section" id="contact">
      <div className="wrap">
        <Reveal className="contact-grid">
          <div>
            <h2 className="contact-title">Let's connect</h2>
            <p className="contact-desc">Open to Data Analyst, Data Scientist, or Analytics Engineer roles. Always happy to talk data, collaborate on projects, or just connect.</p>
            {[
              { href: "mailto:huyphung.work@gmail.com", label: "huyphung.work@gmail.com", icon: <svg fill="none" stroke="var(--footer-muted)" strokeWidth="2" viewBox="0 0 24 24"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg> },
              { href: "https://www.linkedin.com/in/anh-huy-phung-a16503212/", label: "View LinkedIn Profile", icon: <svg fill="none" stroke="var(--footer-muted)" strokeWidth="2" viewBox="0 0 24 24"><path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6z"/><rect x="2" y="9" width="4" height="12"/><circle cx="4" cy="4" r="2"/></svg> },
              { href: "https://github.com/huypa/Portfolio", label: "View GitHub", icon: <svg fill="none" stroke="var(--footer-muted)" strokeWidth="2" viewBox="0 0 24 24"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 00-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0020 4.77 5.07 5.07 0 0019.91 1S18.73.65 16 2.48a13.38 13.38 0 00-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 005 4.77a5.44 5.44 0 00-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 009 18.13V22"/></svg> },
            ].map(({ href, label, icon }) => (
              <a key={label} href={href} target={href.startsWith("mailto") ? "_self" : "_blank"} rel="noopener noreferrer" className="contact-link">
                {icon}{label}
              </a>
            ))}
          </div>
          <div>
            <h2 className="contact-title">Download Resume</h2>
            <p className="contact-desc">Full experience, projects, and education in PDF format.</p>
            <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-start", gap: "8px" }}>
              <button className="btn-footer btn-footer-light">
                <svg width="13" height="13" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
                  <path d="M12 15V3m0 12-4-4m4 4 4-4M2 17l.621 2.485A2 2 0 004.561 21h14.878a2 2 0 001.94-1.515L22 17" />
                </svg>
                Download CV (PDF)
              </button>
              <a href="https://calendar.google.com/calendar/u/0/r?authuser=huyphung.work@gmail.com" target="_blank" rel="noopener noreferrer" className="btn-footer">
                <svg width="13" height="13" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
                  <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/>
                </svg>
                Book an Interview
              </a>
            </div>
          </div>
        </Reveal>
        <div className="footer-bar">
          <span>© 2025 Anh Huy Phung</span>
          <span>huyphung.work@gmail.com · 0400 710 824</span>
        </div>
      </div>
    </section>
  );
}

// ── SCROLL TO TOP ──
function ScrollTop() {
  const [visible, setVisible] = useState(false);
  useEffect(() => {
    const fn = () => setVisible(window.scrollY > 320);
    window.addEventListener("scroll", fn, { passive: true });
    return () => window.removeEventListener("scroll", fn);
  }, []);
  return (
    <motion.button
      className="scroll-top"
      animate={{ opacity: visible ? 1 : 0, y: visible ? 0 : 10 }}
      transition={{ duration: 0.2 }}
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
      aria-label="Back to top"
    >
      <svg width="16" height="16" fill="none" stroke="currentColor" strokeWidth="2.5" viewBox="0 0 24 24">
        <polyline points="18 15 12 9 6 15" />
      </svg>
    </motion.button>
  );
}

// ── APP ──
export default function App() {
  return (
    <>
      <Nav />
      <Hero />
      <div className="divider" />
      <Projects />
      <div className="divider" />
      <Experience />
      <div className="divider" />
      <Education />
      <div className="divider" />
      <Contact />
      <ScrollTop />
      <Analytics />
    </>
  );
}
