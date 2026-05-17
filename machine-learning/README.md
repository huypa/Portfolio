# Statistical Machine Learning — FIT5201

<div align="center">

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?style=for-the-badge&logo=jupyter&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-Scientific_Computing-013243?style=for-the-badge&logo=numpy&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-Neural_Networks-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white)
![Monash](https://img.shields.io/badge/Monash_University-FIT5201-003087?style=for-the-badge)
![Semester](https://img.shields.io/badge/Semester-2_2024-6A0DAD?style=for-the-badge)

</div>

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Two end-to-end machine learning assignments built entirely from scratch — covering supervised regression and classification, probabilistic learning, unsupervised document clustering via EM, and deep representation learning with autoencoders — all implemented following scikit-learn conventions without relying on high-level APIs.
</p>

---

> 📎 **Deliverables** &nbsp;|&nbsp; [📓 A1 Notebooks](https://github.com/huypa/Portfolio/blob/main/machine-learning/34140298_ANH_HUY_PHUNG_assignment1/) &nbsp;|&nbsp; [📓 A2 Notebooks](https://github.com/huypa/Portfolio/blob/main/machine-learning/34140298_Anh_Huy_Phung_assignment2/)

---

## 1. Quick Introduction

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
This project is my assessed coursework for <strong>FIT5201 — Statistical Machine Learning</strong> at Monash University (Semester 2, 2024), where I designed and implemented two comprehensive assignments spanning core ML theory and practice. My role covered everything from mathematical derivation — analytical Ridge Regression gradients, EM convergence proofs — to end-to-end Python implementation and quantitative evaluation. The most impressive outcome was achieving numerically stable soft-EM document clustering from scratch using the log-sum-exp trick, and surpassing a KNN baseline with a tuned Ridge Regression model selected through nested cross-validation.
</p>

---

## 2. Problem Statement

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Off-the-shelf ML libraries abstract away the mechanics that determine whether a model generalises or overfits, clusters meaningfully, or collapses numerically. For a practitioner, that black-box dependence is a liability: you cannot diagnose failures you cannot see. These assignments address that gap directly — every algorithm is derived analytically and implemented from scratch, forcing a rigorous understanding of bias-variance trade-offs, probabilistic inference, and neural network architecture choices. The business payoff is a data scientist who can adapt any algorithm to a novel domain constraint rather than waiting for a library update.
</p>

---

## 3. Architecture / Data Flow

```mermaid
flowchart TD
    A[Raw Dataset\nTabular / Text / Image] --> B[Preprocessing\nNormalisation · Tokenisation · PCA]
    B --> C1[Assignment 1 Pipeline\nKNN · Ridge · Logistic · Bayes]
    B --> C2[Assignment 2 Pipeline\nEM Clustering · Perceptron · MLP · Autoencoder]
    C1 --> D1[Nested Cross-Validation\nHyperparameter Selection]
    D1 --> E1[Evaluation\nMSE · Accuracy vs Baseline]
    C2 --> D2[Representation Learning\nAutoencoder Features · PCA Projection]
    D2 --> E2[Evaluation\nLog-likelihood · Decision Boundary · Cluster Quality]
    E1 --> F[Results Report\nLearning Curves · Confusion Matrices · Visualisations]
    E2 --> F
```

---

## 4. Tech Stack

<div align="center">

| Tool | Role | Why Chosen |
|:---|:---|:---|
| Python 3.10+ | Core implementation language | Industry standard; rich ecosystem |
| NumPy | Linear algebra and vectorised ops | Efficient matrix maths without high-level ML APIs |
| SciPy | Statistical distributions and optimisation | Complementary scientific computing utilities |
| Matplotlib | Visualisation of learning curves and boundaries | Fine-grained plot control for academic reporting |
| PyTorch | Neural network layers (where permitted) | Dynamic computation graph; clear autograd semantics |
| scikit-learn | Convention reference and metric utilities | Followed API conventions; used only for evaluation metrics |
| Jupyter Notebook | Interactive development and submission format | Reproducible narrative combining code, maths, and output |

</div>

---

## 5. Key Features

- **From-scratch implementations:** KNN Regressor, L-Fold Cross-Validator, Ridge Regression (analytical gradient), Logistic Regression, Bayesian Classifier, Hard-EM, Soft-EM, Perceptron, MLP, and Autoencoder — none delegated to sklearn estimators.
- **Numerical stability via log-sum-exp:** Soft-EM for document clustering applies the log-sum-exp trick to prevent underflow on large vocabulary likelihood products.
- **Nested cross-validation for automatic model selection:** An outer loop estimates generalisation error while an inner loop tunes hyperparameters, producing an unbiased estimate of the selected model's performance.
- **Autoencoder-based self-taught learning:** Unsupervised autoencoder pre-training on unlabelled data augments features for a downstream classifier, demonstrating measurable accuracy gains over training on raw pixels alone.
- **Generative vs discriminative comparison:** A side-by-side study of Logistic Regression and Naive Bayes Gaussian classifiers quantifies how model assumptions affect decision boundaries and accuracy under varying dataset sizes.

---

## 6. Getting Started

**Prerequisites**

```bash
python >= 3.10
pip install numpy scipy matplotlib scikit-learn torch jupyter
```

**Clone the repository**

```bash
git clone https://github.com/huypa/Portfolio.git
cd Portfolio/machine-learning
```

**Run Assignment 1 notebooks**

```bash
cd 34140298_ANH_HUY_PHUNG_assignment1
jupyter notebook 34140298_ANH_HUY_PHUNG_a1_sec1.ipynb
# Repeat for a1_sec2 and a1_sec3
```

**Run Assignment 2 notebooks**

```bash
cd ../34140298_Anh_Huy_Phung_assignment2
jupyter notebook 34140298_Anh_Huy_Phung_a2_sec1.ipynb
# Repeat for a2_sec2 and a2_sec3
```

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
Each notebook is self-contained: datasets are loaded inline, all hyperparameters are defined at the top of each section, and all cells can be executed top-to-bottom without additional configuration. PDF exports of each notebook are included alongside the <code>.ipynb</code> files for offline review.
</p>

---

## 7. Results / Impact

<div align="center">

| Experiment | Metric | Baseline | Achieved | Improvement |
|:---|:---:|:---:|:---:|:---:|
| KNN Regression (optimal k via CV) | Test MSE | k=1 (overfit) | Nested-CV selected k | ~40% MSE reduction |
| Ridge Regression vs OLS | Test MSE | Unregularised OLS | Ridge (tuned λ) | Consistent lower generalisation error |
| Logistic vs Bayesian Classifier | Accuracy | Naive Bayes (generative) | Logistic Regression (discriminative) | +3–8% accuracy on larger datasets |
| Soft-EM Document Clustering | Log-likelihood convergence | Hard-EM | Soft-EM + log-sum-exp | Stable convergence; no underflow |
| Autoencoder Self-Taught Learning | Classification Accuracy | Raw pixel features | Autoencoder features | Measurable accuracy gain on labelled subset |
| MLP vs Perceptron | Decision boundary quality | Linear Perceptron | 2-layer MLP | Non-linear boundary; correct XOR separation |

</div>

---

## 8. Lessons Learned

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
<strong>1. Numerical stability is non-negotiable in probabilistic models.</strong> Implementing Soft-EM without the log-sum-exp trick produces silent underflow to zero on all-but-one cluster responsibilities, reducing it effectively to Hard-EM. The log-sum-exp reformulation is a small code change with a disproportionately large impact on correctness — a reminder that mathematical hygiene matters as much as algorithmic choice.
</p>

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
<strong>2. Nested cross-validation prevents optimistic bias at model selection time.</strong> Using a single cross-validation loop to both select a hyperparameter and estimate its generalisation error leaks information and inflates reported performance. The outer/inner nesting structure adds computational cost but produces a trustworthy metric — a distinction that is invisible when using sklearn's GridSearchCV without the outer loop.
</p>

<p style="font-family: 'Montserrat', sans-serif; text-align: justify;">
<strong>3. Representation learning amplifies limited labelled data.</strong> Pre-training an autoencoder on unlabelled examples and using its encoder output as features consistently outperformed training on raw inputs when labelled data was scarce. This formalised the intuition that unsupervised structure can be leveraged before supervision begins — a principle central to modern foundation model fine-tuning.
</p>

---

## 9. Author

<div align="center" style="font-family: 'Montserrat', sans-serif;">

**Anh Huy Phung**
Analytics Engineer & Data Scientist

🌐 [Portfolio](https://huyphungportfolio.vercel.app/#) · 🐙 [GitHub](https://github.com/huypa) · 💼 [LinkedIn](https://www.linkedin.com/in/anh-huy-phung-a16503212/?skipRedirect=true) · 📧 [Huyphung.work@gmail.com](mailto:Huyphung.work@gmail.com)

</div>
