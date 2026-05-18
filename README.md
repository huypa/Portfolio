# Anh Huy Phung — Data & Analytics Portfolio

<div align="center">

[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-black?style=for-the-badge&logo=vercel&logoColor=white)](https://huyphungportfolio.vercel.app/#)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true)
[![Email](https://img.shields.io/badge/Email-Huyphung.work%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:Huyphung.work@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-huypa-181717?style=for-the-badge&logo=github)](https://github.com/huypa)

![Profile Views](https://komarev.com/ghpvc/?username=huypa&color=blueviolet&style=flat-square)

</div>

---

## About Me

I am an Analytics Engineer & Data Scientist with a Master's degree in Data Science from Monash University and 2 years of hands-on experience in the Modern Data Stack — spanning BigQuery, dbt, PySpark, and Power BI. My work sits at the intersection of data engineering and applied machine learning: I build the pipelines that make data trustworthy, and the models that make it actionable. Every project in this portfolio reflects full end-to-end ownership — from raw data to production-ready output.

---

## Projects

<div align="center">

| # | Project | Stack | Key Result | Links |
|:---:|:---|:---|:---|:---:|
| 1 | Text Data Wrangling & NLP Pre-processing | Python · Regex · NLTK · Pandas | Score **99/100** — parsed quasi-XML trademark records & built NLP count vectors | [README](data-wrangling/README.md) |
| 2 | Real-Time Fraud Detection (Big Data) | PySpark · Kafka · GBT · K-Means | **AUC > 0.9** — live streaming inference at 500–1000 transactions/5s | [README](big-data-processing/README.md) |
| 3 | Data Warehouse — BigQuery + dbt | BigQuery · dbt · Kimball | **17+ models** — 10 dims, 7 facts, 100% test & doc coverage | [README](data-warehouse/README.md) |
| 4 | Statistical Machine Learning | Python · NumPy · PyTorch · scikit-learn | From-scratch KNN, Ridge, EM, Autoencoder — numerically stable, nested CV | [README](machine-learning/README.md) |
| 5 | Text Classification & Topic Modelling | Scikit-learn · PyTorch · Gensim · spaCy | LR+TF-IDF: **87.4% accuracy, F1 0.84** — outperformed RNN by 15pp | [README](semi-structured-data/README.md) |
| 6 | Power BI Coffee Shop Dashboard | Power BI · DAX · Snowflake Schema | All KPIs **+22–23% in March** — 3-store NYC live dashboard | [README](power-bi/coffee-shop/README.md) · [Live](https://app.powerbi.com/view?r=eyJrIjoiNDg2NmI3MDYtOGQxYS00M2RmLTk2YWUtNTFmNTk4OGY0ODIxIiwidCI6IjMyNGViYTBiLTJjNTUtNDE3NS1iMzBjLThjODNlMzZmMTE2ZCJ9) |
| 7 | Power BI Pizza Sales Dashboard | Power BI · DAX · DAX Window Functions | **$15K–$17K/week** — percentile order analysis, dynamic KPI switching | [README](power-bi/pizza-sales/README.md) · [Live](https://app.powerbi.com/view?r=eyJrIjoiODkwNzMwOTQtMzVjYi00NjM0LWE0MGMtZWQ0NjE2NTIyZDliIiwidCI6IjMyNGViYTBiLTJjNTUtNDE3NS1iMzBjLThjODNlMzZmMTE2ZCJ9) |

</div>

---

## Project Highlights

### 1. Text Data Wrangling & NLP Pre-processing

- **Pipeline 1 — Regex XML parser:** Custom regex-only parser for malformed government XML trademark records; no existing library handles this quasi-XML format
- **Pipeline 2 — NLP pre-processing:** Language detection, emoji removal, stemming & vocabulary construction from multi-channel YouTube comment exports
- **Output:** ML-ready sparse bigram count vectors · **Scored 99/100**

### 2. Real-Time Fraud Detection (Big Data)

- **Streaming pipeline:** Kafka → Spark Structured Streaming classifying **500–1,000 eCommerce transactions every 5 seconds** with live Parquet persistence
- **ML models:** GBT classifier for fraud inference (**AUC > 0.9**) · K-Means clustering for fraudster behaviour profiling via PySpark MLlib
- **Output:** Real-time fraud dashboards tracking hotspots, counts, and product trends across the streaming window

### 3. Data Warehouse — BigQuery + dbt

- **Model:** Kimball dimensional warehouse on BigQuery — 10 conformed dimensions, 7 fact tables, role-playing dimensions
- **Pipeline:** Modular 3-layer dbt DAG (staging → dimensional → facts) with **100% documentation coverage** via dbt docs
- **Quality:** Automated test suite covering PK uniqueness, FK integrity, accepted values, and custom business rules

### 4. Statistical Machine Learning

- **Algorithms from scratch:** KNN regression · Ridge Regression (closed-form gradient) · Generative vs. discriminative classifiers
- **Advanced models:** Hard/Soft-EM document clustering (log-sum-exp stability) · Autoencoder self-taught learning · MLP decision boundaries
- **Methodology:** Nested cross-validation with learning curves · PCA for high-dimensional visualisation

### 5. Text Classification & Topic Modelling

- **Classification:** LR + TF-IDF on arXiv abstracts — **87.4% accuracy, F1 0.84**; outperformed RNN baseline by 15 percentage points
- **Benchmarking:** 8 configurations across input type (title vs. abstract), algorithm (LR vs. RNN), and dataset scale (1K → 20K docs)
- **Topic modelling:** LDA over 20K bigram documents — surfaced 4 distinct CS research clusters (neural networks, RL, adversarial attacks, HCI)

### 6. Power BI — Coffee Shop Dashboard

- **Model:** Snowflake schema — Transaction fact table + 4 dimension tables across 3 NYC locations
- **DAX:** Parameter Table for dynamic KPI switching (Revenue, Quantity, Transactions) · Period-over-period trend line · Store share indicators
- **Result:** All major KPIs **+22–23% in March** · Identified weekday commuter traffic as the primary revenue driver

### 7. Power BI — Pizza Sales Dashboard

- **DAX:** Window functions for P25/P50/P75/P90 order interval analysis · Time-intelligence measures for weekly revenue trend
- **Dynamic KPI:** Parameter Table switching across Revenue, Orders, Quantity, AOV, and Avg Pizza/Order on a single page
- **Result:** Consistent **$15K–$17K weekly revenue** · 75% of orders completed within 16 minutes

---

## Technical Skills

<div align="center">

| Domain | Tools & Technologies |
|:---|:---|
| **Languages** | Python · SQL · DAX · M (Power Query) |
| **Data Warehouse** | Google BigQuery · dbt Core · Kimball Dimensional Modeling |
| **Big Data & Streaming** | Apache Spark (MLlib, Structured Streaming) · Apache Kafka · Parquet |
| **Machine Learning** | Scikit-learn · PyTorch · Gradient Boosted Trees · K-Means · EM · Autoencoders |
| **NLP** | NLTK · spaCy · Gensim (LDA) · TF-IDF · RNN · Tokenisation · Stemming |
| **Visualisation & BI** | Power BI · DAX Window Functions · Matplotlib · Seaborn · pyLDAvis |
| **Data Engineering** | Pandas · NumPy · Regex · JSON · XML · Google Colab |

</div>

---

<div align="center">

*"Turning data into stories, and stories into impact."*

🌐 [Portfolio](https://huyphungportfolio.vercel.app/#) &nbsp;·&nbsp; 🐙 [GitHub](https://github.com/huypa) &nbsp;·&nbsp; 💼 [LinkedIn](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true) &nbsp;·&nbsp; 📧 [Huyphung.work@gmail.com](mailto:Huyphung.work@gmail.com)

</div>