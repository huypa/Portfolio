# Text Data Wrangling & Pre-processing Project
In project, me and my groupmate focused on extracting, cleaning, and transforming semi-structured text data into structured formats suitable for database design and downstream NLP tasks. It involved multiple stages of data wrangling, regular expression–based parsing, and text pre-processing for feature engineering.
## Key Contributions

### Parsing raw XML text file (Task 1):

- Extracted trademark assignment records from semi-structured text files (XML) named ***Group021.txt*** using Python (re, json, pandas).

- Designed and applied regular expressions to capture complex attributes (e.g., reel/frame numbers, assignors/assignees, legal entity descriptions).

- Normalised date formats (YYYY-MM-DD) and handled missing/ambiguous values through systematic assumptions.

- Converted the processed data into structured JSON output following strict schema requirements.

*Complete task progress report: [Link Here](https://github.com/huypa/Portfolio-Data-Wrangling/blob/main/021_ass1/task1_021.pdf)*
<img width="820" height="311" alt="Screenshot 2025-09-30 at 11 05 53" src="https://github.com/user-attachments/assets/48d1e7cd-7e44-4cd3-ae60-5d6ecf9742a2" />


### Text pre-processing from Youtube comments(Task 2):

- Imported and combined YouTube comments across multiple worksheets in Excel named ***Group021_task2.xlxs***, ensuring removal of duplicates.

- Extracted and cleaned the comment data (textOriginal field) includes: handled emoji removal, lower-casing, and language detection (using langdetect).

- Constructed a vocabulary of unigrams and bigrams via tokenisation, stemming (Porter Stemmer) with careful orders consideration.

- Generated sparse numerical representations (count vectors) for each channel to prepare for NLP and machine learning applications.

- Produced deliverables including channel comment statistics (.csv), meaningful vocabulary lists (.txt), and sparse representations (.txt).

*Complete task progress report: [Link Here](https://github.com/huypa/Portfolio-Data-Wrangling/blob/main/021_ass1/task2_021.pdf)*
<img width="480" height="462" alt="Screenshot 2025-09-30 at 11 23 36" src="https://github.com/user-attachments/assets/ba2ddb14-1a01-44b6-a711-34bec4121391" />

### Skills & tools used:

- Python (Regex, Pandas, JSON, NLTK, Langdetect)

- Text Wrangling & Cleaning (emoji removal, stemming, stopword filtering)

- Feature Engineering (unigrams, bigrams, count vectors)

- Data Transformation (JSON structuring, CSV exports)

- Collaborative Workflow (Colab, Git version history, documentation)

## Outcome
Achieved a total score of 99/100 by marker for transforming raw semi-structured text into clean datasets ready for database integration and NLP modelling, strengthening my skills in end-to-end text preprocessing pipelines.

<img width="329" height="144" alt="Screenshot 2025-09-30 at 11 53 11" src="https://github.com/user-attachments/assets/487eb3de-fb13-4838-a35f-c17e86bced17" />

