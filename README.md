# 🚀 Real-Time Fraud Detection & eCommerce Analytics
In this project, I demonstrated the integration of Apache Kafka, PySpark Structured Streaming, and Machine Learning to detect fraudulent eCommerce transactions and visualise customer behaviour in real time. It was developed as part of *FIT5202: Data Processing for Big Data* at Monash University.

Due to large dataset, I put the link this public drive: [Dataset information](https://drive.google.com/drive/u/1/folders/1YpGqiuJll28ZlYhHasONw-o4b4QAI_s9)

## Part A – Fraud Detection Model Development

***Goal:*** Build machine learning models on historical eCommerce data to detect fraud.

### *Key Contributions:*

- Processed large datasets with PySpark DataFrames.

- Engineered behavioural and demographic features for fraud detection.

- Analysed fraud patterns through statistics and visualisations.

- Trained and evaluated Random Forest and Gradient Boosted Trees models.

- Selected GBT (AUC > 0.9) as best-performing model and persisted it.

- Applied K-Means clustering to profile fraudster behaviours.

- Addressed data ethics, privacy, and security considerations.

***Result:*** Delivered a fraud detection model with high predictive accuracy and insights into fraud patterns.

## Part B – Real-Time Streaming & Prediction*

***Goal:*** Deploy the trained model in a streaming environment for real-time fraud detection.

### *Key Contributions:*

- Simulated real-time streams with Kafka producers (500–1000 records/5s).

- Ingested and processed data via Spark Structured Streaming.

- Applied the GBT model to classify streaming transactions.

- Persisted fraud predictions and shopping cart data in Parquet.

- Built real-time dashboards: fraud counts, top products, and fraud hotspot maps.

- Delivered a live end-to-end demo integrating Kafka, Spark, and ML.

***Result:*** Built a working real-time fraud detection prototype with actionable fraud and inventory insights.
## 🛠️ Tools & Technologies

- Big Data: Apache Spark (MLlib, Structured Streaming)

- Streaming: Apache Kafka

- ML Models: Gradient Boosted Trees, Random Forest, K-Means

- Storage: JSON, Parquet

- Visualisation: Matplotlib, Pandas

## ✅ Outcome

- Developed and deployed a scalable fraud detection system from historical ML model training to real-time streaming predictions. Achieved AUC > 0.9 with Gradient Boosted Trees in Part A.

- Delivered a working Kafka–Spark pipeline with live fraud detection and product monitoring in Part B. Strengthened expertise in end-to-end data pipelines, streaming architectures, and applied machine learning.
