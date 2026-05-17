# Text Classification & Topic Modelling on arXiv Papers

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
<strong>Binary classification</strong> of <strong>arXiv papers</strong> (<strong>Computational Linguistics</strong> vs. other) and unsupervised topic discovery via <strong>LDA</strong> — comparing <strong>statistical vs. neural approaches</strong> and <strong>unigram vs. bigram representations</strong> across dataset scales.
</p>

<div align="center">

![Python](https://img.shields.io/badge/Python-3.10-blue?style=flat-square&logo=python&logoColor=white)
![Scikit-learn](https://img.shields.io/badge/Scikit--learn-ML-orange?style=flat-square&logo=scikit-learn&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-RNN-red?style=flat-square&logo=pytorch&logoColor=white)
![Gensim](https://img.shields.io/badge/Gensim-LDA-green?style=flat-square)
![spaCy](https://img.shields.io/badge/spaCy-NLP-09A3D5?style=flat-square&logo=spacy&logoColor=white)
![Monash](https://img.shields.io/badge/Monash%20University-FIT5212-003087?style=flat-square)

</div>

> 📎 **Deliverables** &nbsp;|&nbsp; [📄 Report (PDF)](https://github.com/huypa/Portfolio/blob/main/semi-structured-data/report_34140298.pdf) &nbsp;|&nbsp; [📓 Part 1 Notebook](https://github.com/huypa/Portfolio/blob/main/semi-structured-data/code_34140298_part1.ipynb) &nbsp;|&nbsp; [📓 Part 2 Notebook](https://github.com/huypa/Portfolio/blob/main/semi-structured-data/code_34140298_part2.ipynb)

---

## 1. Quick Introduction

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
This project was completed as Assignment 1 for <strong>FIT5212</strong> (Semi-Structured Data) at Monash University, tackling real-world NLP challenges on a large corpus of <strong>arXiv research abstracts</strong>. In Part 1, I designed and benchmarked <strong>eight classification configurations</strong> — spanning input types, algorithms, and dataset scales — to identify the most effective approach for detecting Computational Linguistics papers. The standout result was <strong>Logistic Regression with TF-IDF</strong> on full abstracts, achieving <strong>87.4% accuracy</strong> and <strong>F1 0.84</strong>, outperforming an <strong>RNN baseline</strong> by over <strong>15 percentage points</strong> under the same compute constraints.
</p>

---

## 2. Problem Statement

- **Scale problem**: arXiv receives thousands of submissions daily, making manual **categorisation** and **thematic discovery** impractical for researchers and curators.
- **Classification gap**: without reliable automated labelling, relevant papers are buried and emerging research trends go undetected.
- **Core question**: can lightweight statistical models match or exceed neural approaches on a domain-specific **binary classification task**, and can unsupervised **LDA** surface coherent themes at scale?
- **Practical implication**: answers directly guide **NLP infrastructure investment** — favouring **interpretable, compute-efficient methods** when labelled data and GPU resources are constrained.

---

## 3. Architecture / Data Flow

```mermaid
flowchart LR
    A[arXiv Dataset\nCSV / JSON] --> B[Preprocessing Pipeline\nNLTK · spaCy · custom tokeniser]
    B --> C1[Part 1 — Classification\nTF-IDF + Logistic Regression\nEmbeddings + RNN]
    B --> C2[Part 2 — Topic Modelling\nGensim LDA\nUnigrams & Bigrams]
    C1 --> D1[Evaluation\nAcc · F1 · MCC · PR Curves]
    C2 --> D2[Visualisation\npyLDAvis · Topic–Document mapping]
    D1 --> E[Report & Insights]
    D2 --> E
```

---

## 4. Tech Stack

<div align="center">

| Tool | Role | Why chosen |
|:---|:---|:---|
| Python 3.10 | Core language | Ecosystem depth for NLP & ML |
| Scikit-learn | Logistic Regression, TF-IDF, evaluation metrics | Battle-tested, interpretable baseline |
| PyTorch | RNN with learnable embeddings | Flexible neural architecture prototyping |
| NLTK + spaCy | Tokenisation, stopword removal, lemmatisation | Complementary strengths: rules + statistical models |
| Gensim | LDA topic modelling, Phrases (bigrams) | Scalable probabilistic topic models |
| pyLDAvis | Interactive topic visualisation | Intuitive intertopic distance maps |
| NumPy / Pandas | Data manipulation | Standard tabular & array operations |
| Google Colab | Compute environment | Free GPU/CPU for RNN training |

</div>

---

## 5. Key Features

- **Eight classification configurations** systematically varied across input (Abstract vs. Title), algorithm (Logistic Regression vs. RNN), and dataset size (1,000 vs. full), enabling controlled ablation.
- **Custom tokenisation pipeline** combining frequency-based vocabulary filtering with stopword removal, purpose-built for academic text rather than off-the-shelf defaults.
- **Multi-metric evaluation** reporting Accuracy, Precision, Recall, F1, MCC, and Precision–Recall curves — avoiding the false confidence of accuracy-only assessment on an imbalanced corpus.
- **Four LDA variations** (unigrams vs. bigrams × 1k vs. 20k documents) with dictionary pruning (no_below=20, no_above=0.6), directly measuring how corpus scale and phrase detection affect topic coherence.
- **pyLDAvis visualisations** providing interactive intertopic distance maps, making latent topic structure accessible for non-technical stakeholders.

---

## 6. Getting Started

**Prerequisites**

```bash
pip install scikit-learn torch gensim spacy nltk pyldavis pandas numpy
python -m spacy download en_core_web_sm
python -m nltk.downloader stopwords punkt
```

**Run Part 1 — Text Classification**

Open `code_34140298_part1.ipynb` in Jupyter or Google Colab and run all cells in order. The notebook expects the arXiv CSV data file in the same working directory. Adjust the **`DATASET_SIZE`** variable at the top of the notebook to switch between the 1,000-sample and full-dataset configurations.

**Run Part 2 — Topic Modelling**

Open `code_34140298_part2.ipynb` and run all cells. Set the **`USE_BIGRAMS`** flag and **`N_DOCS`** variable to reproduce any of the four LDA variations. **`pyLDAvis`** visualisations are rendered inline; export the HTML for standalone viewing.

**View the report**

The full written analysis including methodology, results tables, and discussion is in `report_34140298.pdf`.

---

## 7. Results / Impact

<div align="center">

| Configuration | Input | Dataset Size | Accuracy | F1 Score | MCC |
|:---|:---|:---|:---:|:---:|:---:|
| Logistic Regression + TF-IDF | Abstract | Full | **87.4%** | **0.84** | — |
| Logistic Regression + TF-IDF | Abstract | 1,000 | ~82% | ~0.79 | — |
| Logistic Regression + TF-IDF | Title | Full | Lower | Lower | — |
| RNN + Embeddings | Abstract | Full | ~72% | ~0.68 | — |
| RNN + Embeddings | Abstract | 1,000 | ~70% | ~0.65 | — |

| LDA Configuration | Documents | Bigrams | Topic Coherence |
|:---|:---:|:---:|:---|
| Unigrams only | 1,000 | No | Noisy, low coherence |
| Unigrams only | 20,000 | No | Moderate coherence |
| Unigrams + Bigrams | 1,000 | Yes | Improved but unstable |
| Unigrams + Bigrams | 20,000 | Yes | **Stable, well-separated topics** |

</div>

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
The <strong>20,000-document bigram LDA model</strong> surfaced four coherent research clusters — <strong>neural networks</strong>, <strong>reinforcement learning</strong>, <strong>adversarial attacks</strong>, and <strong>human–computer interaction</strong> — with minimal topic overlap. These results confirm that <strong>corpus scale</strong> has a larger impact on topic quality than phrase detection alone.
</p>

---

## 8. Lessons Learned

- **Compute over architecture**: the RNN underperformed not due to a weaker design but insufficient training time — **TF-IDF + Logistic Regression** should always be the baseline before committing to neural models under **GPU constraints**.
- **Scale beats sophistication**: scaling from **1,000 to 20,000 documents** improved **LDA topic coherence** more than adding bigrams, confirming that **data quantity** is the dominant lever in unsupervised settings.
- **Input richness sets the ceiling**: **title-only models** consistently lagged abstract-based ones, showing that **feature selection** deserves as much attention as model selection — no tuning can compensate for information-poor inputs.

---

## 9. Author

<div align="center" style="font-family: 'Montserrat', sans-serif;">

Written by **Anh Huy Phung** — Analytics Engineer & Data Scientist

🌐 [Portfolio](https://huyphungportfolio.vercel.app/#) · 🐙 [GitHub](https://github.com/huypa) · 💼 [LinkedIn](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true) · 📧 [Huyphung.work@gmail.com](mailto:Huyphung.work@gmail.com)

</div>
