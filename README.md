# Text Classification & Topic Modelling Project (FIT5212 – Assignment 1)
In this project, I explored supervised and unsupervised NLP tasks using research articles from arXiv. Part 1 focused on building binary classifiers to predict whether an article belongs to *Computational Linguistics* using both statistical and neural approaches. Part 2 applied topic modelling to uncover thematic structures across abstracts using variations of LDA.  

## Key Contributions

### Part 1 – Text Classification:
- Preprocessed titles and abstracts using custom tokenization pipelines, stopword removal, and frequency-based vocabulary filtering.
- Implemented **Logistic Regression with TF-IDF features** and **Recurrent Neural Networks (RNNs)** with embeddings.
- Trained and compared models under **eight configurations**:
  - Input source: **Abstracts vs. Titles**.
  - Algorithms: **Logistic Regression vs. RNN**.
  - Training size: **1,000 samples vs. full dataset** (subset for runtime efficiency in Colab).
- Evaluated models with **Accuracy, Precision, Recall, F1, MCC** and plotted **Precision–Recall curves**.
- Key Results:
  - Logistic Regression (Abstract, Full) achieved the highest performance (**Acc 87.4%, F1 0.84**).
  - Title-only models were faster but less accurate, reflecting lower semantic richness.
  - RNN models achieved stable results (~72% accuracy) but underperformed compared to TF-IDF + Logistic Regression due to limited training time/resources.

### Part 2 – Topic Modelling:
- Focused on the **Abstract field** for richer contextual signals, applying preprocessing with NLTK and spaCy (tokenization, stopword removal, lemmatization).
- Designed and compared **two LDA configurations**:
  - **Uni-grams only**.
  - **Uni-grams + Bi-grams** (using Gensim `Phrases`).
- Ran models on **two dataset sizes**: 1,000 vs. 20,000 documents, yielding 4 variations.
- Applied **dictionary pruning** (no_below=20, no_above=0.6) to balance rare/common tokens and improve interpretability.
- Visualized results using **pyLDAvis** and extracted exemplar documents per dominant topic.
- Key Findings:
  - **Smaller dataset (1,000 docs)** → topics were noisier and less coherent.
  - **Larger dataset (20,000 docs)** → produced stable and well-separated topics (e.g., neural networks, reinforcement learning, adversarial attacks, human–computer interaction).
  - **Bi-grams** improved topic coherence by capturing multi-word terms (e.g., “neural_network”, “reinforcement_learning”).

## Tools & Skills
- **Python** (NumPy, Pandas, Scikit-learn, PyTorch, Gensim, pyLDAvis)
- **NLP Preprocessing** (NLTK, spaCy – tokenization, stopwords, lemmatization, bigram detection)
- **Machine Learning** (Logistic Regression, RNN, TF-IDF, embeddings)
- **Evaluation Metrics** (Accuracy, Precision, Recall, F1, MCC, PR Curves)
- **Unsupervised Learning** (LDA topic modelling, vocabulary pruning, topic visualization)
