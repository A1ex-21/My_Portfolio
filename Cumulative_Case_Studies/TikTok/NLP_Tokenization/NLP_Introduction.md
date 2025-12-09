# Natural Language Processing (NLP) Introduction

This is for the final Notebook from Course 6's TikTok End-of-Course Portfolio Project ["TikTok_Predictive_Model_Development"](/TikTok/Course%206/Portfolio/Tiktok_Predictive_Model_Development.ipynb). In the Notebook, the feature `video_transcription_text` was only Feature Engineered to make the variable `text_length`. But this variable produced low feature importance for the champion Model, and so another way to Feature Engineer `video_transcription_text` is with Natural Language Processing (NLP) via Tokenization.

## NLP

**Natural Language Processing (NLP):** Is a branch of Computer Science and Artificial Intelligence (AI) that applies Machine Learning techniques in order to help computers interpret, understand and interact using Human Language. [IBM](https://www.ibm.com/think/topics/natural-language-processing)

NLP allows Computers and Digital Systems to interpret, comprehend and produce text and speech by integrating Computational Linguistics and rule-based Language Models with Statistical Techniques, Machine Learning and Deep Learning methods. [IBM](https://www.ibm.com/think/topics/natural-language-processing)

## Benefits of NLP [IBM](https://www.ibm.com/think/topics/natural-language-processing):
* Improved Human-Computer Interactions
* Automation of Repetitive Tasks
* Enhanced Data Analysis
* Better Customer Experience
* Multilingual Capabilities
* Information Retrieval and Search Optimization
* Accessibility Support
* Enhanced Decision Making

## Examples of Industries with a Practical Application of NLP [Oracle](https://www.oracle.com/uk/artificial-intelligence/natural-language-processing/):
* **Healthcare:** As Healthcare Systems transition to Electronic Health Records (EHRs), there are massive amounts of unstructured data generated. NLP helps analyse and uncover insights from these records while allowing for clinicians to efficiently update or add information, such as post-visit summaries without manually typing.
  
* **Finance:** In the Financial Sector, Traders leverage NLP Tools in order to automatically extract valuable information from corporate reports and news articles, thereby supporting better Portfolio Management and Investment decisions.
  
* **Customer Service:** Many organisations deploy chatbots and virtual assistants that are powered by NLP in order to manage routine customer inquiries and direct complex issues to human agents when necessary. With advancements like LLMs and RAG architechures, it means thatthese systems can now handle more sophisticated interactions.
  
* **Insurance:** Major Insurance firms use NLP to rapidly process and analyse documents and claims reports, therefore allowing them to deliver coverage details and decisions more efficiently.

## Implementation of NLP [Oracle](https://www.oracle.com/uk/artificial-intelligence/natural-language-processing/):
1. **Collect and Preprocess Text Data:** Gather Textual information from multiple sources such as documents, websites and social media and then clean/format it so it can be effectively analysed by machines.
   
2. **Extract Features and Representations:** Transform the cleaned text into numerical data that Machine Learning Algorithms can interpret. Advanced approaches include creating vector embeddings for words and text segments.
   
3. **Choose and Train a Model:** Select an NLP Model that is suitable for the specific task (e.g. Text Classification or Sentiment Analysis) and train it using the prepared dataset, then carry out hyperparameter tuning in order to improve accuracy and performance.
   
4. **Evaluate and Deploy the Model:** Assess the Model's Accuracy, Precision, Recall and ability to generalise to new data. Once the results are satisfactory, deploy the Model into a Production Environment to process and analyse real-world text data.

## Tokenization

**Tokenization:** Is the process of breaking text into smaller units to derive meaning from the resulting tokens.

### Implementation

The feature `video_transcription_text` is text-based and so is not a Categorical variable since it doesn't have a fixed number of possible values. One way to extract numerical features from it is through the implementation of Scikit-Learn's [`CountVectorizer`](https://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.CountVectorizer.html) Function.

`CountVectorizer` is a bag-of-words algorithm that works by splitting the text into n-grams, which are groups of n consecutive words.

#### Example of CountVectorizer

Here is an example of how it works:

"a dime for a cup of coffee" (Phrase A)

Phase A broken into 2-grams would result in six two-word combinations:

`a dime` | `dime for` |`for a`| `a cup` | `cup of` | `of coffee` |

"ask for a cup for a child" (Phrase B)

Then the next sample's text would be parsed into 2-grams:

`ask for` |`for a`| `a cup` | `cup for` | `for a` | `a child` |

This process would repeat for each observation in the dataset, and each n-gram would be treated like a distinct feature. Then, the text of each observation is compared to the full array of n-grams, and the numbers of occurrences are tallied:

|  | `a dime` |`dime for`  |`for a`| `a cup` | `cup of` | `of coffee` | `ask for` | `cup for` | `a child` |
|--: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|phrase A |1|1|1|1|1|1|0|0|0|
|phrase B |0|0|2|1|1|0|1|1|1|
|**TOTAL**|1|1|3|2|2|1|1|1|1|

This would happen for the text of each observation in the data, and the text of each observation is parsed to get tallies for all the 2-word phrases from the entire data set for each observation, creating a large matrix.

If text is broken into 1-grams, then each feature in the matrix is an individual word.

After the count matrix has been created, `CountVectorizer` lets you choose to keep only the most frequently occurring n-grams with its hyperparameter `max_features` during fitting. You specifiy how many and the n-grams you select can then be used as features in a Model.

## Notebooks

There will be 2 NLP Pipelines produced with NLP via Tokenization, these are:

* [Tiktok_Predictive_Model_Development_NLP_1.ipynb](/TikTok/Course%206/Portfolio/NLP/Tiktok_Predictive_Model_Development_NLP_1.ipynb)
* [TikTok_Predictive_Model_Development-NLP-2.ipynb](/TikTok/Course%206/Portfolio/NLP/Tiktok_Predictive_Model_Development_NLP_2.ipynb)

**NLP_1** will be where the `CountVectorizer` is fitted to the whole data before splitting the data into training, validation and testing sets.

**NLP_2** (Industry Standard) will be where the `CountVectorizer` is fitted to the training set only and then transformed on the validation and test set with the same fitted vectorizer.

In both Notebooks, the champion Model produced slightly better, with NLP_2 performing the ever so slightly best.

### Confusion Matrix Results:

**Before NLP was introduced (Original)**
* True Positives (**1910**)
* False Positives (**0**)
* True Negatives (**1889**)
* False Negatives (**18**)

**NLP_1**
* True Positives (**1918**)
* False Positives (**1**)
* True Negatives (**1888**)
* False Negatives (**10**)

**NLP_2**
* True Positives (**1918**)
* False Positives (**0**)
* True Negatives (**1889**)
* False Negatives (**10**)

## Conclusion

With the NLP preprocessing Pipelines, NLP_2 was chosen as the final, industry standard approach due to it following the correct Machine Learning workflow and prevents data leakage. In NLP_2, the `CountVectorizer` is fitted only on the training data, and then applied to the validation and test sets using `transform()` rather than `fit_transform()`. This therefore ensures that the information from the unseen data does not influence the vocabulary or feature space learned during training. By keeping the validation and test sets completely unseen during preprocessing, NLP_2 provides more accurate model evaluation, realistic generalisation performance and mirrors how production systems operate. This makes NLP_2 the correct and reliable choice for building robust NLP Models.

**Correct NLP Pipeline = NLP_2**
