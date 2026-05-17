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

Two independent wrangling pipelines: a regex-only parser for malformed government XML trademark records (no library handles this format), and a full NLP pre-processing pipeline converting multi-channel YouTube comment exports into ML-ready sparse count vectors — covering language detection, emoji removal, stemming, and vocabulary construction. Scored **99/100**.

### 2. Real-Time Fraud Detection (Big Data)

End-to-end pipeline combining PySpark MLlib for batch model training (GBT, **AUC > 0.9**; K-Means fraudster profiling) with a live Kafka–Spark Structured Streaming system that classifies 500–1000 eCommerce transactions every 5 seconds, persists predictions to Parquet, and surfaces real-time fraud dashboards.

### 3. Data Warehouse — BigQuery + dbt

Production-grade Kimball dimensional warehouse on BigQuery using a modular 3-layer dbt DAG (staging → dimensional → facts). Delivers 10 conformed dimensions, 7 fact tables, role-playing dimensions, and a full automated test suite covering PK uniqueness, FK integrity, accepted values, and custom business rules — with **100% documentation coverage** via dbt docs.

### 4. Statistical Machine Learning

Two university assignments built entirely from scratch following scikit-learn conventions: Assignment 1 covers KNN regression, nested cross-validation, Ridge Regression (analytical gradient), and generative vs. discriminative classifiers; Assignment 2 covers Hard/Soft-EM document clustering (log-sum-exp stability), Autoencoder self-taught learning, MLP vs. Perceptron decision boundaries, and PCA visualisation.

### 5. Text Classification & Topic Modelling

Benchmarked 8 classification configurations on arXiv research abstracts — varying input type, algorithm, and dataset scale. Logistic Regression + TF-IDF on full abstracts achieved **87.4% accuracy, F1 0.84**, outperforming RNN by 15 percentage points. Part 2 applied LDA topic modelling across 4 variations (unigrams/bigrams × 1k/20k docs), surfacing coherent research clusters in neural networks, reinforcement learning, and HCI.

### 6 & 7. Power BI Dashboards

Two end-to-end Power BI solutions built on snowflake schemas with dynamic DAX measures and parameter-driven KPI switching. The Coffee Shop dashboard (3 NYC locations) showed all KPIs up **+22–23% in March** and identified weekday commuter traffic as the primary revenue driver. The Pizza Sales dashboard revealed consistent **$15K–$17K weekly revenue**, with 75% of orders completed within 16 minutes via percentile analysis using DAX window functions.

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