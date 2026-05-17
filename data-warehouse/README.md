# Data Warehouse — BigQuery + dbt (Kimball Dimensional Modeling)

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
An end-to-end data warehouse built on <strong>Google BigQuery</strong> and <strong>dbt</strong>, applying Kimball dimensional modeling to the Wide World Importers dataset — covering sales, purchasing, supplier transactions, and salesperson performance across a modular, fully-tested dbt pipeline.
</p>

<div align="center">

![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Kimball](https://img.shields.io/badge/Kimball%20Modeling-star%20schema-blueviolet?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

> 📎 **Deliverables** &nbsp;|&nbsp; [📄 Report](https://github.com/huypa/Portfolio/blob/main/data-warehouse/) &nbsp;|&nbsp; [🗂️ Models](https://github.com/huypa/Portfolio/blob/main/data-warehouse/models/analytics/)

---

## 1. Quick Introduction

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
This project demonstrates a <strong>production-grade data warehouse</strong> workflow for a fictional international wholesale trading company — <strong>Wide World Importers</strong> — using BigQuery as the <strong>cloud warehouse</strong> and dbt as the <strong>transformation layer</strong>. I designed a <strong>Kimball-style star schema</strong> with <strong>10 dimension tables</strong> and <strong>7 fact tables</strong>, organized into a fully modular dbt DAG spanning <strong>staging, dimensional, and analytical layers</strong>. The most impressive outcome is a pipeline that enforces data quality through <strong>automated dbt tests</strong> (unique, not_null, FK relationships, accepted values, and custom business rules) with <strong>full documentation coverage</strong> generated via <code>dbt docs</code>.
</p>

---

## 2. Problem Statement

- **Raw OLTP data is not analytics-ready**: normalized tables, deep joins, and business logic buried in application code make direct querying slow and error-prone.
- **No shared definitions**: without a warehouse layer, analysts disagree on metrics like "revenue" or "active customer," producing inconsistent reports.
- **This project's solution**: centralize **business definitions** in dbt models and enforce **data contracts** through automated tests.
- **Outcome**: a **single source of truth** exposing clean, **conformed dimensions and facts** for sales, purchasing, supplier, and salesperson performance.

---

## 3. Architecture / Data Flow

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
The pipeline follows a <strong>three-layer dbt architecture</strong>: raw source data lands in BigQuery, <strong>staging models</strong> clean and rename fields, <strong>dimensional models</strong> apply <strong>Kimball SCD logic</strong> and <strong>surrogate keys</strong>, and <strong>fact models</strong> join dimensions to produce <strong>conformed grain-level metrics</strong>.
</p>

```mermaid
flowchart LR
    A[Wide World Importers\nSource Tables\nBigQuery] --> B[Staging Layer\nstg_* models\ntype casting / renaming]
    B --> C[Dimensional Layer\ndim_* models\n10 dimensions + role-playing dims]
    B --> D[Fact Layer\nfact_* models\n7 fact tables]
    C --> D
    D --> E[dbt Tests\nunique / not_null / FK\naccepted values / custom rules]
    D --> F[BI / Analytics\ndbt docs · BigQuery Studio]
```

---

## 4. Tech Stack

<div align="center">

| Tool | Role | Why Chosen |
|:---|:---|:---|
| **Google BigQuery** | Cloud data warehouse | Serverless, scalable, native dbt adapter |
| **dbt Core** | Transformation & orchestration | SQL-first, modular, built-in testing & docs |
| **Python** | Environment & dependencies | dbt installation via `requirements.txt` |
| **Kimball Dimensional Modeling** | Schema design methodology | Industry-standard star schema for BI workloads |
| **YAML** | Test & schema definitions | Declarative data contracts for every model |
| **Wide World Importers** | Source dataset | Rich, realistic OLTP dataset from Microsoft |

</div>

---

## 5. Key Features

- **Modular 3-layer DAG** — staging → dimensional → facts with clean dependency graph; every model is independently testable and re-runnable
- **10 conformed dimensions** including a monthly customer snapshot (`fact_customer_snapshot_monthly`) and role-playing dimensions under `models/analytics/role_playing_dimensions/`
- **7 fact tables** spanning sales orders, purchase orders, supplier transactions, and salesperson targets — each at its natural business grain
- **Automated dbt test suite** covering primary key uniqueness, not-null constraints, referential integrity (FK), accepted value sets, and custom business rule assertions
- **Full documentation coverage** — every model and column documented and served via `dbt docs generate && dbt docs serve`

---

## 6. Getting Started

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Clone the repository and follow the steps below. You will need a <strong>Google Cloud project</strong> with <strong>BigQuery</strong> enabled and a <strong>service account key</strong>.
</p>

```bash
# 1. Install Python dependencies
pip install -r bin/requirements.txt

# 2. Copy the connection profile template
cp profiles.bigquery-template.yml ~/.dbt/profiles.yml

# 3. Edit ~/.dbt/profiles.yml and fill in your BigQuery project, dataset,
#    and service account credentials

# 4. Install dbt packages
dbt deps

# 5. Run all models
dbt run

# 6. Execute the full test suite
dbt test

# 7. Generate and serve documentation (lineage DAG + column descriptions)
dbt docs generate && dbt docs serve
```

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
After <code>dbt docs serve</code>, open <code>http://localhost:8080</code> to explore the <strong>lineage DAG</strong>, model descriptions, and <strong>column-level documentation</strong>.
</p>

---

## 7. Results / Impact

<div align="center">

| Metric | Value |
|:---|:---:|
| Dimension tables delivered | 10 |
| Fact tables delivered | 7 |
| dbt models in pipeline | 17+ |
| dbt test assertions | 6 YAML test files |
| Test types covered | unique, not_null, FK, accepted_values, custom |
| Documentation coverage | 100% of analytical models |
| Pipeline layers | 3 (staging → dimensional → facts) |
| Source dataset tables modeled | Wide World Importers (full transactional scope) |

</div>

---

## 8. Lessons Learned

- **Grain definition is the hardest part**: mixing order-level and line-level measures in one fact table causes silent aggregation errors — splitting `fact_sales_order` (header grain) from `fact_sales_order_line` (line grain) was essential for BI accuracy.
- **dbt tests are a contract, not an afterthought**: writing tests late surfaced FK mismatches rooted in staging logic; embedding tests from the first model and failing the pipeline on errors would have prevented significant rework.
- **Role-playing dimensions need explicit naming conventions**: reusing `dim_date` for order, ship, and delivery dates requires aliased keys (`order_date_key`, `ship_date_key`) defined consistently across all fact tables to eliminate SQL and documentation ambiguity.

---

## 9. Author

<div align="center" style="font-family: 'Montserrat', sans-serif;">

**Anh Huy Phung** — Analytics Engineer & Data Scientist

🌐 [Portfolio](https://huyphungportfolio.vercel.app/#) · 🐙 [GitHub](https://github.com/huypa) · 💼 [LinkedIn](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true) · 📧 [Huyphung.work@gmail.com](mailto:Huyphung.work@gmail.com)

</div>
