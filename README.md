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

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
I am an <strong>Analytics Engineer & Data Scientist</strong> with a <strong>Master's degree in Data Science</strong> from Monash University and 2 years of hands-on experience in the <strong>Modern Data Stack</strong> — spanning BigQuery, dbt, PySpark, and Power BI. My work sits at the intersection of data engineering and applied machine learning: I build the pipelines that make data trustworthy, and the models that make it actionable. Every project in this portfolio reflects a full end-to-end ownership — from raw data to production-ready output.
</p>

---

## Projects

<div align="center">

| # | Project | Stack | Key Result | Links |
|:---:|:---|:---|:---|:---:|
| 1 | **Text Data Wrangling & NLP Pre-processing** | Python · Regex · NLTK · Pandas | Score **99/100** — parsed quasi-XML trademark records & built NLP count vectors | [📁 README](data-wrangling/README.md) |
| 2 | **Real-Time Fraud Detection (Big Data)** | PySpark · Kafka · GBT · K-Means | **AUC > 0.9** — live streaming inference at 500–1000 transactions/5s | [📁 README](big-data-processing/README.md) |
| 3 | **Data Warehouse — BigQuery + dbt** | BigQuery · dbt · Kimball | **17+ models** — 10 dims, 7 facts, 100% test & doc coverage | [📁 README](data-warehouse/README.md) |
| 4 | **Statistical Machine Learning** | Python · NumPy · PyTorch · scikit-learn | From-scratch KNN, Ridge, EM, Autoencoder — numerically stable, nested CV | [📁 README](machine-learning/README.md) |
| 5 | **Text Classification & Topic Modelling** | Scikit-learn · PyTorch · Gensim · spaCy | LR+TF-IDF: **87.4% accuracy, F1 0.84** — outperformed RNN by 15pp | [📁 README](semi-structured-data/README.md) |
| 6 | **Power BI Coffee Shop Dashboard** | Power BI · DAX · Snowflake Schema | All KPIs **+22–23%** in March — 3-store NYC live dashboard | [📁 README](power-bi/coffee-shop/README.md) · [📊 Live](https://app.powerbi.com/view?r=eyJrIjoiNDg2NmI3MDYtOGQxYS00M2RmLTk2YWUtNTFmNTk4OGY0ODIxIiwidCI6IjMyNGViYTBiLTJjNTUtNDE3NS1iMzBjLThjODNlMzZmMTE2ZCJ9) |
| 7 | **Power BI Pizza Sales Dashboard** | Power BI · DAX · DAX Window Functions | **$15K–$17K/week** — percentile order analysis, dynamic KPI switching | [📁 README](power-bi/pizza-sales/README.md) · [📊 Live](https://app.powerbi.com/view?r=eyJrIjoiODkwNzMwOTQtMzVjYi00NjM0LWE0MGMtZWQ0NjE2NTIyZDliIiwidCI6IjMyNGViYTBiLTJjNTUtNDE3NS1iMzBjLThjODNlMzZmMTE2ZCJ9) |

</div>

---

## Project Highlights

### 1. Text Data Wrangling & NLP Pre-processing

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Two independent wrangling pipelines: a <strong>regex-only parser</strong> for malformed government XML trademark records (no library handles this format), and a full <strong>NLP pre-processing pipeline</strong> converting multi-channel YouTube comment exports into <strong>ML-ready sparse count vectors</strong> — covering language detection, emoji removal, stemming, and vocabulary construction. Scored <strong>99/100</strong>.
</p>

### 2. Real-Time Fraud Detection (Big Data)

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
End-to-end pipeline combining <strong>PySpark MLlib</strong> for batch model training (GBT, <strong>AUC > 0.9</strong>; K-Means fraudster profiling) with a live <strong>Kafka–Spark Structured Streaming</strong> system that classifies <strong>500–1000 eCommerce transactions every 5 seconds</strong>, persists predictions to Parquet, and surfaces real-time fraud dashboards.
</p>

### 3. Data Warehouse — BigQuery + dbt

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Production-grade <strong>Kimball dimensional warehouse</strong> on BigQuery using a modular <strong>3-layer dbt DAG</strong> (staging → dimensional → facts). Delivers <strong>10 conformed dimensions</strong>, <strong>7 fact tables</strong>, role-playing dimensions, and a full automated test suite covering PK uniqueness, FK integrity, accepted values, and custom business rules — with <strong>100% documentation coverage</strong> via dbt docs.
</p>

### 4. Statistical Machine Learning

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Two university assignments built entirely <strong>from scratch</strong> following scikit-learn conventions: Assignment 1 covers <strong>KNN regression</strong>, <strong>nested cross-validation</strong>, <strong>Ridge Regression</strong> (analytical gradient), and generative vs. discriminative classifiers; Assignment 2 covers <strong>Hard/Soft-EM document clustering</strong> (log-sum-exp stability), <strong>Autoencoder self-taught learning</strong>, MLP vs. Perceptron decision boundaries, and PCA visualisation.
</p>

### 5. Text Classification & Topic Modelling

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Benchmarked <strong>8 classification configurations</strong> on arXiv research abstracts — varying input type, algorithm, and dataset scale. <strong>Logistic Regression + TF-IDF</strong> on full abstracts achieved <strong>87.4% accuracy, F1 0.84</strong>, outperforming RNN by 15 percentage points. Part 2 applied <strong>LDA topic modelling</strong> across 4 variations (unigrams/bigrams × 1k/20k docs), surfacing coherent research clusters in neural networks, reinforcement learning, and HCI.
</p>

### 6 & 7. Power BI Dashboards

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Two end-to-end Power BI solutions built on <strong>snowflake schemas</strong> with <strong>dynamic DAX measures</strong> and <strong>parameter-driven KPI switching</strong>. The <strong>Coffee Shop dashboard</strong> (3 NYC locations) showed all KPIs up <strong>22–23% in March</strong> and identified weekday commuter traffic as the primary revenue driver. The <strong>Pizza Sales dashboard</strong> revealed consistent <strong>$15K–$17K weekly revenue</strong>, with <strong>75% of orders completed within 16 minutes</strong> via percentile analysis using DAX window functions.
</p>

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

<p style="font-family: 'Montserrat', sans-serif;">
<em>"Turning data into stories, and stories into impact."</em>
</p>

🌐 [Portfolio](https://huyphungportfolio.vercel.app/#) &nbsp;·&nbsp; 🐙 [GitHub](https://github.com/huypa) &nbsp;·&nbsp; 💼 [LinkedIn](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true) &nbsp;·&nbsp; 📧 [Huyphung.work@gmail.com](mailto:Huyphung.work@gmail.com)

</div>
