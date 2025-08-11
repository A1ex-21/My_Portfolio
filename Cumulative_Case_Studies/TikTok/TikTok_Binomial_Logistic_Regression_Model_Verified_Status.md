# **TikTok Binomial Logistic Regression Model Verified Status**
**Course 5 - Regression Analysis: Simplify Complex Data Relationships**

## **Scenario**

You are a member of the TikTok data analytics team. The team is currently more than halfway through the claims classification project. Earlier, you completed a project proposal, used Python to explore and analyze the claims classification dataset, created data visualizations, and conducted a hypothesis  test. 

The TikTok team has reviewed the results of the hypothesis testing. TikTok’s Operations Lead, Maika Abadi, is interested in how different variables are associated with whether a user is verified. Earlier, the data team observed that if a user is verified, they are much more likely to post opinions. Now, the data team has decided to explore how to predict verified status to help them understand how video characteristics relate to verified users. Therefore, you have been asked to conduct a logistic regression using verified status as the outcome variable. The results may be used to inform the final model related to predicting whether a video is a claim vs an opinion.

You check your inbox and discover a new email from Maika Abadi asking the data team about the details of a regression model. You also notice two follow-up emails from Rosie Mae. The first lists the specific variables that should be analyzed in the logistic regression model. The second email asks you to help build the model and prepare an executive summary to share your results.

### **Email from Maika Abadi, Operations Lead**

**Subject:** Details on Regression Model

**From:** "Abadi, Maika," - maikaabadi@tiktok

**Cc:** "Jaffey, Willow" - willowjaffey@tiktok; "Rodgers, Mary Joanna" - maryjoannarodgers@tiktok; "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok; "Rainier, Orion" - orionrainier@tiktok

Hello Data Team,

I really appreciate your work, and thanks for the explanation of the next phase of the data analysis.

I’m curious to know more about how different variables are associated with whether a user is verified. I was hoping to get a bit more detail on the regression your team is planning to conduct. Will you be applying a linear regression model or a logistic regression model? It wasn’t clear in the meeting, and I wanted to be sure our teams are aligned on expectations. 

Thank you, 

Maika Abadi

Operations Lead

TikTok

*Learn about using [TikTok to do good](https://www.tiktok.com/forgood)*

### **Email from Rosie Mae Bradshaw, TikTok's Data Science Manager**

**Subject:** RE: Deatils on Regression Phase

**From:** "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok

**Cc:** "Jaffey, Willow" - willowjaffey@tiktok; "Rodgers, Mary Joanna" - maryjoannarodgers@tiktok; "Rainier, Orion" - orionrainier@tiktok; "Abadi, Maika," - maikaabadi@tiktok

Thank you for your email. 

Apologies that it was not clear in the meeting. 

To answer your question, we’ve decided to look into how to predict ‘verified_status’, which we believe will help us understand how video characteristics relate to verified users. To achieve this, the data team will build a logistic regression model using ‘verified_status’ as the outcome variable. The results of this milestone will inform us as we approach constructing the final claims prediction model.

Feel free to reach out with additional questions. 

Many thanks,

Rosie Mae Bradshaw

Data Analysis Manager

TikTok

[Learn about TikTok's Trust & Safety team](https://newsroom.tiktok.com/en-us/safety)

### **Email from Rosie Mae Bradshaw, TikTok's Data Science Manager**

**Subject:** RE: Deatils on Regression Phase

**From:** "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok

**Cc:** "Rainier, Orion" - orionrainier@tiktok

Hello my Data team! 

Would you two mind completing the following using the fictional test data set:: 

* Logistic regression model in a Python notebook based ‘verified_status’ variable in the claims classification dataset
  * Be sure to include a confusion matrix of the results and the accuracy score of the model
* Draft an executive summary of your results

I’d appreciate a chance to look it over before you send it over to Mary Joanna. Please write the summary as if you’re addressing the leadership team. 

Best regards,

Rosie Mae Bradshaw

Data Analysis Manager

TikTok

[Learn about TikTok's Trust & Safety team](https://newsroom.tiktok.com/en-us/safety)

### **Data Dictionary**

**TikTok Dataset Overview**

This project uses a dataset called `tiktok_dataset.csv`. It contains synthetic data created for this project in partnership with TikTok. Examine each data variable gathered.

**19,383 rows** – Each row represents a different published TikTok video in which a claim/opinion has been made.

**12 columns**

| Column name                | Type  | Description |
|---------------------------|-------|-------------|
| `#`                       | int   | TikTok assigned number for video with claim/opinion. |
| `claim_status`            | obj   | Whether the published video has been identified as an “opinion” or a “claim.” In this dataset, an “opinion” refers to an individual’s or group’s personal beliefs or thoughts. A “claim” refers to information that is either unsourced or from an unverified source. |
| `video_id`                | int   | Random identifying number assigned to a video upon publication on TikTok. |
| `video_duration_sec`      | int   | How long the published video is measured in seconds. |
| `video_transcription_text`| obj   | Transcribed text of the words spoken in the published video. |
| `verified_status`         | obj   | Indicates the status of the TikTok user who published the video in terms of their verification, either “verified” or “not verified.” |
| `author_ban_status`       | obj   | Indicates the status of the TikTok user who published the video in terms of their permissions: “active,” “under scrutiny,” or “banned.” |
| `video_view_count`        | float | The total number of times the published video has been viewed. |
| `video_like_count`        | float | The total number of times the published video has been liked by other users. |
| `video_share_count`       | float | The total number of times the published video has been shared by other users. |
| `video_download_count`    | float | The total number of times the published video has been downloaded by other users. |
| `video_comment_count`     | float | The total number of comments on the published video. |


### **Objectives**

**The purpose** of this project is to demostrate knowledge of EDA and regression models.

**The goal** is to build a logistic regression model and evaluate the model.

In this activity, you will build a logistic regression model in Python. As you have learned, logistic regression helps you estimate the probability of an outcome. For data science professionals, this is a useful skill because it allows you to consider more than one variable against the variable you're measuring against. This opens the door for much more thorough and flexible analysis to be completed.


## **PACE Stages**

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## **PACE: Plan**

Consider the questions in your PACE Strategy Document to reflect on the Plan stage.

### **Task 1. Imports and loading**
Import the data and packages that you've learned are needed for building regression models.


```python
# Import packages for data manipulation

import pandas as pd
import numpy as np

# Import packages for data visualization

import seaborn as sns
import matplotlib.pyplot as plt

# Import packages for data preprocessing

from sklearn.preprocessing import OneHotEncoder
from sklearn.utils import resample

# Import packages for data modeling

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
```

Load the TikTok dataset.



```python
# Load dataset into dataframe
data = pd.read_csv("tiktok_dataset.csv")
```

## **PACE: Analyze**

## **PACE: Analyze**

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

In this stage, consider the following question where applicable to complete your code response:

* What are some purposes of EDA before constructing a logistic regression model?


Exploratory Data Analysis (EDA) is important before constructing a logistic regression model because it helps understand data distribution, detect missing or inconsistent values, identify correlations between variables, select relevant features, check for outliers, and ensure that key model assumptions—such as linearity between continuous predictors and the logit function—are reasonably met.

### **Task 2a. Explore data with EDA**

Analyze the data and check for and handle missing values and duplicates.

Inspect the first five rows of the dataframe.


```python
# Display first few rows
data.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>#</th>
      <th>claim_status</th>
      <th>video_id</th>
      <th>video_duration_sec</th>
      <th>video_transcription_text</th>
      <th>verified_status</th>
      <th>author_ban_status</th>
      <th>video_view_count</th>
      <th>video_like_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>claim</td>
      <td>7017666017</td>
      <td>59</td>
      <td>someone shared with me that drone deliveries a...</td>
      <td>not verified</td>
      <td>under review</td>
      <td>343296.0</td>
      <td>19425.0</td>
      <td>241.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>claim</td>
      <td>4014381136</td>
      <td>32</td>
      <td>someone shared with me that there are more mic...</td>
      <td>not verified</td>
      <td>active</td>
      <td>140877.0</td>
      <td>77355.0</td>
      <td>19034.0</td>
      <td>1161.0</td>
      <td>684.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>claim</td>
      <td>9859838091</td>
      <td>31</td>
      <td>someone shared with me that american industria...</td>
      <td>not verified</td>
      <td>active</td>
      <td>902185.0</td>
      <td>97690.0</td>
      <td>2858.0</td>
      <td>833.0</td>
      <td>329.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>claim</td>
      <td>1866847991</td>
      <td>25</td>
      <td>someone shared with me that the metro of st. p...</td>
      <td>not verified</td>
      <td>active</td>
      <td>437506.0</td>
      <td>239954.0</td>
      <td>34812.0</td>
      <td>1234.0</td>
      <td>584.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>claim</td>
      <td>7105231098</td>
      <td>19</td>
      <td>someone shared with me that the number of busi...</td>
      <td>not verified</td>
      <td>active</td>
      <td>56167.0</td>
      <td>34987.0</td>
      <td>4110.0</td>
      <td>547.0</td>
      <td>152.0</td>
    </tr>
  </tbody>
</table>
</div>



Get the number of rows and columns in the dataset.


```python
# Get number of rows and columns
data.shape
```




    (19382, 12)



Get the data types of the columns.


```python
# Get data types of columns
data.dtypes
```




    #                             int64
    claim_status                 object
    video_id                      int64
    video_duration_sec            int64
    video_transcription_text     object
    verified_status              object
    author_ban_status            object
    video_view_count            float64
    video_like_count            float64
    video_share_count           float64
    video_download_count        float64
    video_comment_count         float64
    dtype: object



Get basic information about the dataset.


```python
# Get basic information
data.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 19382 entries, 0 to 19381
    Data columns (total 12 columns):
     #   Column                    Non-Null Count  Dtype  
    ---  ------                    --------------  -----  
     0   #                         19382 non-null  int64  
     1   claim_status              19084 non-null  object 
     2   video_id                  19382 non-null  int64  
     3   video_duration_sec        19382 non-null  int64  
     4   video_transcription_text  19084 non-null  object 
     5   verified_status           19382 non-null  object 
     6   author_ban_status         19382 non-null  object 
     7   video_view_count          19084 non-null  float64
     8   video_like_count          19084 non-null  float64
     9   video_share_count         19084 non-null  float64
     10  video_download_count      19084 non-null  float64
     11  video_comment_count       19084 non-null  float64
    dtypes: float64(5), int64(3), object(4)
    memory usage: 1.8+ MB
    

Generate basic descriptive statistics about the dataset.


```python
# Generate basic descriptive stats
data.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>#</th>
      <th>video_id</th>
      <th>video_duration_sec</th>
      <th>video_view_count</th>
      <th>video_like_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>19382.000000</td>
      <td>1.938200e+04</td>
      <td>19382.000000</td>
      <td>19084.000000</td>
      <td>19084.000000</td>
      <td>19084.000000</td>
      <td>19084.000000</td>
      <td>19084.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>9691.500000</td>
      <td>5.627454e+09</td>
      <td>32.421732</td>
      <td>254708.558688</td>
      <td>84304.636030</td>
      <td>16735.248323</td>
      <td>1049.429627</td>
      <td>349.312146</td>
    </tr>
    <tr>
      <th>std</th>
      <td>5595.245794</td>
      <td>2.536440e+09</td>
      <td>16.229967</td>
      <td>322893.280814</td>
      <td>133420.546814</td>
      <td>32036.174350</td>
      <td>2004.299894</td>
      <td>799.638865</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.000000</td>
      <td>1.234959e+09</td>
      <td>5.000000</td>
      <td>20.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>4846.250000</td>
      <td>3.430417e+09</td>
      <td>18.000000</td>
      <td>4942.500000</td>
      <td>810.750000</td>
      <td>115.000000</td>
      <td>7.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>9691.500000</td>
      <td>5.618664e+09</td>
      <td>32.000000</td>
      <td>9954.500000</td>
      <td>3403.500000</td>
      <td>717.000000</td>
      <td>46.000000</td>
      <td>9.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>14536.750000</td>
      <td>7.843960e+09</td>
      <td>47.000000</td>
      <td>504327.000000</td>
      <td>125020.000000</td>
      <td>18222.000000</td>
      <td>1156.250000</td>
      <td>292.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>19382.000000</td>
      <td>9.999873e+09</td>
      <td>60.000000</td>
      <td>999817.000000</td>
      <td>657830.000000</td>
      <td>256130.000000</td>
      <td>14994.000000</td>
      <td>9599.000000</td>
    </tr>
  </tbody>
</table>
</div>



Check for and handle missing values.


```python
# Check for missing values
data.isnull().sum()
```




    #                             0
    claim_status                298
    video_id                      0
    video_duration_sec            0
    video_transcription_text    298
    verified_status               0
    author_ban_status             0
    video_view_count            298
    video_like_count            298
    video_share_count           298
    video_download_count        298
    video_comment_count         298
    dtype: int64




```python
# Drop rows with missing values
data.dropna(axis=0, inplace = True)
```


```python
# Display first few rows after handling missing values
data.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>#</th>
      <th>claim_status</th>
      <th>video_id</th>
      <th>video_duration_sec</th>
      <th>video_transcription_text</th>
      <th>verified_status</th>
      <th>author_ban_status</th>
      <th>video_view_count</th>
      <th>video_like_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>claim</td>
      <td>7017666017</td>
      <td>59</td>
      <td>someone shared with me that drone deliveries a...</td>
      <td>not verified</td>
      <td>under review</td>
      <td>343296.0</td>
      <td>19425.0</td>
      <td>241.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>claim</td>
      <td>4014381136</td>
      <td>32</td>
      <td>someone shared with me that there are more mic...</td>
      <td>not verified</td>
      <td>active</td>
      <td>140877.0</td>
      <td>77355.0</td>
      <td>19034.0</td>
      <td>1161.0</td>
      <td>684.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>claim</td>
      <td>9859838091</td>
      <td>31</td>
      <td>someone shared with me that american industria...</td>
      <td>not verified</td>
      <td>active</td>
      <td>902185.0</td>
      <td>97690.0</td>
      <td>2858.0</td>
      <td>833.0</td>
      <td>329.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>claim</td>
      <td>1866847991</td>
      <td>25</td>
      <td>someone shared with me that the metro of st. p...</td>
      <td>not verified</td>
      <td>active</td>
      <td>437506.0</td>
      <td>239954.0</td>
      <td>34812.0</td>
      <td>1234.0</td>
      <td>584.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>claim</td>
      <td>7105231098</td>
      <td>19</td>
      <td>someone shared with me that the number of busi...</td>
      <td>not verified</td>
      <td>active</td>
      <td>56167.0</td>
      <td>34987.0</td>
      <td>4110.0</td>
      <td>547.0</td>
      <td>152.0</td>
    </tr>
  </tbody>
</table>
</div>



Check for and handle duplicates.


```python
# Check for and handle duplicates.
data.isnull().sum()
```




    #                           0
    claim_status                0
    video_id                    0
    video_duration_sec          0
    video_transcription_text    0
    verified_status             0
    author_ban_status           0
    video_view_count            0
    video_like_count            0
    video_share_count           0
    video_download_count        0
    video_comment_count         0
    dtype: int64



Check for and handle outliers.


```python
# Create a boxplot to visualize distribution of `video_duration_sec`
plt.figure(figsize=(6,2))
plt.title('Boxplot to detect outliers for video_duration_sec', fontsize=12)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
sns.boxplot(x=data['video_duration_sec'])
plt.show()
```


    
<img width="489" height="238" alt="TikTok_Binomial_Logistic_Regression_Model_Verified_Status_42_0" src="https://github.com/user-attachments/assets/289015a7-b4e9-416b-aecb-9c22d1c08ece" />

    



```python
# Create a boxplot to visualize distribution of `video_view_count`
plt.figure(figsize=(6,2))
plt.title('Boxplot to detect outliers for video_view_count', fontsize=12)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
sns.boxplot(x=data['video_view_count'])
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_43_0.png)
    



```python
# Create a boxplot to visualize distribution of `video_like_count`
plt.figure(figsize=(6,2))
plt.title('Boxplot to detect outliers for video_like_count', fontsize=12)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
sns.boxplot(x=data['video_like_count'])
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_44_0.png)
    



```python
# Create a boxplot to visualize distribution of `video_comment_count`
plt.figure(figsize=(6,2))
plt.title('Boxplot to detect outliers for video_comment_count', fontsize=12)
plt.xticks(fontsize=12)
plt.yticks(fontsize=12)
sns.boxplot(x=data['video_comment_count'])
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_45_0.png)
    



```python
# Check for and handle outliers for video_like_count
# IQR method

percentile25 = data['video_like_count'].quantile(0.25)
percentile75 = data['video_like_count'].quantile(0.75)
iqr = percentile75 - percentile25
upper_limit = percentile75 + 1.5 * iqr
lower_limit = percentile25 - 1.5 * iqr

data.loc[data["video_like_count"] > upper_limit, "video_like_count"] = upper_limit
```


```python
# Check for and handle outliers

percentile25 = data['video_comment_count'].quantile(0.25)
percentile75 = data['video_comment_count'].quantile(0.75)
iqr = percentile75 - percentile25
upper_limit = percentile75 + 1.5 * iqr
lower_limit = percentile25 - 1.5 * iqr

data.loc[data["video_comment_count"] > upper_limit, "video_comment_count"] = upper_limit
```

Check class balance of the target variable. Remember, the goal is to predict whether the user of a given post is verified or unverified.


```python
# Check class balance
data['verified_status'].value_counts(normalize=True)
```




    verified_status
    not verified    0.93712
    verified        0.06288
    Name: proportion, dtype: float64



Approximately 93.7% of the dataset represents videos posted by unverified accounts and 6.3% represents videos posted by verified accounts. So the outcome variable is not very balanced.

Use resampling to create class balance in the outcome variable, if needed.


```python
# Use resampling to create class balance in the outcome variable, if needed

# Identify data points from majority and minority classes

majority_class = data[data['verified_status'] == 'not verified']
minority_class = data[data['verified_status'] == 'verified']

# Upsample the minority class (which is "verified")

minority_upsampled = resample(minority_class,
                             replace = True, # Sample with replacement
                             n_samples = len(majority_class), # match the Majority Class size
                             random_state = 42) # Reprodouceable resutls

# Combine majority class with upsampled minority class

balanced_data = pd.concat([majority_class, minority_upsampled]).reset_index(drop=True)

# Display new class counts

balanced_data['verified_status'].value_counts()

```




    verified_status
    not verified    17884
    verified        17884
    Name: count, dtype: int64



Get the average `video_transcription_text` length for videos posted by verified accounts and the average `video_transcription_text` length for videos posted by unverified accounts.



```python
# Get the average `video_transcription_text` length for claims and the average `video_transcription_text` length for opinions
balanced_data[["verified_status", "video_transcription_text"]].groupby(by="verified_status")[["video_transcription_text"]].agg(func=lambda array: np.mean([len(text) for text in array]))
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>video_transcription_text</th>
    </tr>
    <tr>
      <th>verified_status</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>not verified</th>
      <td>89.401141</td>
    </tr>
    <tr>
      <th>verified</th>
      <td>84.563017</td>
    </tr>
  </tbody>
</table>
</div>



Extract the length of each `video_transcription_text` and add this as a column to the dataframe, so that it can be used as a potential feature in the model.


```python
# Extract the length of each `video_transcription_text` and add this as a column to the dataframe

balanced_data["text_length"] = balanced_data["video_transcription_text"].apply(func=lambda text: len(text))
```


```python
# Display first few rows of dataframe after adding new column
balanced_data.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>#</th>
      <th>claim_status</th>
      <th>video_id</th>
      <th>video_duration_sec</th>
      <th>video_transcription_text</th>
      <th>verified_status</th>
      <th>author_ban_status</th>
      <th>video_view_count</th>
      <th>video_like_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
      <th>text_length</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>claim</td>
      <td>7017666017</td>
      <td>59</td>
      <td>someone shared with me that drone deliveries a...</td>
      <td>not verified</td>
      <td>under review</td>
      <td>343296.0</td>
      <td>19425.0</td>
      <td>241.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>97</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>claim</td>
      <td>4014381136</td>
      <td>32</td>
      <td>someone shared with me that there are more mic...</td>
      <td>not verified</td>
      <td>active</td>
      <td>140877.0</td>
      <td>77355.0</td>
      <td>19034.0</td>
      <td>1161.0</td>
      <td>684.0</td>
      <td>107</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>claim</td>
      <td>9859838091</td>
      <td>31</td>
      <td>someone shared with me that american industria...</td>
      <td>not verified</td>
      <td>active</td>
      <td>902185.0</td>
      <td>97690.0</td>
      <td>2858.0</td>
      <td>833.0</td>
      <td>329.0</td>
      <td>137</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>claim</td>
      <td>1866847991</td>
      <td>25</td>
      <td>someone shared with me that the metro of st. p...</td>
      <td>not verified</td>
      <td>active</td>
      <td>437506.0</td>
      <td>239954.0</td>
      <td>34812.0</td>
      <td>1234.0</td>
      <td>584.0</td>
      <td>131</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>claim</td>
      <td>7105231098</td>
      <td>19</td>
      <td>someone shared with me that the number of busi...</td>
      <td>not verified</td>
      <td>active</td>
      <td>56167.0</td>
      <td>34987.0</td>
      <td>4110.0</td>
      <td>547.0</td>
      <td>152.0</td>
      <td>128</td>
    </tr>
  </tbody>
</table>
</div>



Visualize the distribution of `video_transcription_text` length for videos posted by verified accounts and videos posted by unverified accounts.


```python
# Visualize the distribution of `video_transcription_text` length for videos posted by verified accounts and videos posted by unverified accounts
# Create two histograms in one plot
sns.histplot(data=balanced_data, stat="count", multiple="stack", x="text_length", kde=False, palette="pastel", 
             hue="verified_status", element="bars", legend=True)
plt.title("Seaborn Stacked Histogram")
plt.xlabel("video_transcription_text length (number of characters)")
plt.ylabel("Count")
plt.title("Distribution of video_transcription_text length for videos posted by verified accounts and videos posted by unverified accounts")
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_59_0.png)
    


### **Task 2b. Examine correlations**
Next, code a correlation matrix to help determine most correlated variables.


```python
# Code a correlation matrix to help determine most correlated variables
balanced_data.corr(numeric_only=True)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>#</th>
      <th>video_id</th>
      <th>video_duration_sec</th>
      <th>video_view_count</th>
      <th>video_like_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
      <th>text_length</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>#</th>
      <td>1.000000</td>
      <td>-0.001369</td>
      <td>-0.011800</td>
      <td>-0.698969</td>
      <td>-0.626105</td>
      <td>-0.503634</td>
      <td>-0.489758</td>
      <td>-0.610763</td>
      <td>-0.196817</td>
    </tr>
    <tr>
      <th>video_id</th>
      <td>-0.001369</td>
      <td>1.000000</td>
      <td>0.013938</td>
      <td>0.001607</td>
      <td>0.004534</td>
      <td>0.009136</td>
      <td>0.006814</td>
      <td>0.010564</td>
      <td>-0.007634</td>
    </tr>
    <tr>
      <th>video_duration_sec</th>
      <td>-0.011800</td>
      <td>0.013938</td>
      <td>1.000000</td>
      <td>0.013892</td>
      <td>0.004028</td>
      <td>0.001944</td>
      <td>0.006930</td>
      <td>-0.000080</td>
      <td>-0.005043</td>
    </tr>
    <tr>
      <th>video_view_count</th>
      <td>-0.698969</td>
      <td>0.001607</td>
      <td>0.013892</td>
      <td>1.000000</td>
      <td>0.855343</td>
      <td>0.710466</td>
      <td>0.691557</td>
      <td>0.747564</td>
      <td>0.246867</td>
    </tr>
    <tr>
      <th>video_like_count</th>
      <td>-0.626105</td>
      <td>0.004534</td>
      <td>0.004028</td>
      <td>0.855343</td>
      <td>1.000000</td>
      <td>0.832361</td>
      <td>0.806369</td>
      <td>0.816416</td>
      <td>0.217852</td>
    </tr>
    <tr>
      <th>video_share_count</th>
      <td>-0.503634</td>
      <td>0.009136</td>
      <td>0.001944</td>
      <td>0.710466</td>
      <td>0.832361</td>
      <td>1.000000</td>
      <td>0.709738</td>
      <td>0.671601</td>
      <td>0.176362</td>
    </tr>
    <tr>
      <th>video_download_count</th>
      <td>-0.489758</td>
      <td>0.006814</td>
      <td>0.006930</td>
      <td>0.691557</td>
      <td>0.806369</td>
      <td>0.709738</td>
      <td>1.000000</td>
      <td>0.794524</td>
      <td>0.175287</td>
    </tr>
    <tr>
      <th>video_comment_count</th>
      <td>-0.610763</td>
      <td>0.010564</td>
      <td>-0.000080</td>
      <td>0.747564</td>
      <td>0.816416</td>
      <td>0.671601</td>
      <td>0.794524</td>
      <td>1.000000</td>
      <td>0.217179</td>
    </tr>
    <tr>
      <th>text_length</th>
      <td>-0.196817</td>
      <td>-0.007634</td>
      <td>-0.005043</td>
      <td>0.246867</td>
      <td>0.217852</td>
      <td>0.176362</td>
      <td>0.175287</td>
      <td>0.217179</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



Visualize a correlation heatmap of the data.


```python
# Create a heatmap to visualize how correlated variables are
plt.figure(figsize=(8, 6))
sns.heatmap(
    balanced_data[["video_duration_sec", "claim_status", "author_ban_status", "video_view_count", 
                    "video_like_count", "video_share_count", "video_download_count", "video_comment_count", "text_length"]]
    .corr(numeric_only=True), 
    annot=True, 
    cmap="crest")
plt.title("Heatmap of the dataset")
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_63_0.png)
    


One of the model assumptions for logistic regression is no severe multicollinearity among the features. Take this into consideration as you examine the heatmap and choose which features to proceed with.

**Question:** What variables are shown to be correlated in the heatmap?

The heatmap shows that several variables are strongly positively correlated: `video_like_count` is highly correlated with `video_share_count`, `video_download_count`, and `video_comment_count`; additionally, `video_download_count` is also strongly correlated with both `video_share_count` and `video_comment_count`.

One of the model assumptions for logistic regression is no severe multicollinearity among the features. To build a logistic regression model that meets this assumption, you could exclude `video_like_count`. And among the variables that quantify video metrics, you could keep `video_view_count`, `video_share_count`, `video_download_count`, and `video_comment_count` as features.


## **PACE: Construct**
After analysis and deriving variables with close relationships, it is time to begin constructing the model. Consider the questions in your PACE Strategy Document to reflect on the Construct stage.


### **Task 3a. Select variables**

Set your Y and X variables.

Select the outcome variable.


```python
# Select outcome variable
Y = balanced_data["verified_status"]
```

Select the features.


```python
# Select features
X = balanced_data[['video_duration_sec', 'claim_status', 'author_ban_status', 'video_view_count', 'video_share_count', 'video_download_count', 'video_comment_count']]


# Display first few rows of features dataframe

X.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>video_duration_sec</th>
      <th>claim_status</th>
      <th>author_ban_status</th>
      <th>video_view_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>59</td>
      <td>claim</td>
      <td>under review</td>
      <td>343296.0</td>
      <td>241.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>32</td>
      <td>claim</td>
      <td>active</td>
      <td>140877.0</td>
      <td>19034.0</td>
      <td>1161.0</td>
      <td>684.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>31</td>
      <td>claim</td>
      <td>active</td>
      <td>902185.0</td>
      <td>2858.0</td>
      <td>833.0</td>
      <td>329.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25</td>
      <td>claim</td>
      <td>active</td>
      <td>437506.0</td>
      <td>34812.0</td>
      <td>1234.0</td>
      <td>584.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>19</td>
      <td>claim</td>
      <td>active</td>
      <td>56167.0</td>
      <td>4110.0</td>
      <td>547.0</td>
      <td>152.0</td>
    </tr>
  </tbody>
</table>
</div>



The `#` and `video_id` columns are not selected as features here, because they do not seem to be helpful for predicting whether a video presents a claim or an opinion. Also, `video_like_count` is not selected as a feature here, because it is strongly correlated with other features, as discussed earlier. And logistic regression has a no multicollinearity model assumption that needs to be met

### **Task 3b. Train-test split**

Split the data into training and testing sets.


```python
# Split the data into training and testing sets

x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size = 0.25, random_state = 42)
```

Confirm that the dimensions of the training and testing sets are in alignment.


```python
# Get shape of each training and testing set
x_train.shape, x_test.shape, y_train.shape, y_test.shape
```




    ((26826, 7), (8942, 7), (26826,), (8942,))



* The number of features (`7`) aligns between the training and testing sets.
* The number of rows aligns between the features and the outcome variable for training (`26826`) and testing (`8942`).

### **Task 3c. Encode variables**

Check the data types of the features.


```python
# Check data types
x_train.dtypes
```




    video_duration_sec        int64
    claim_status             object
    author_ban_status        object
    video_view_count        float64
    video_share_count       float64
    video_download_count    float64
    video_comment_count     float64
    dtype: object




```python
# Get unique values in `claim_status`
x_train['claim_status'].unique()
```




    array(['opinion', 'claim'], dtype=object)




```python
# Get unique values in `author_ban_status`
x_train['author_ban_status'].unique()
```




    array(['under review', 'active', 'banned'], dtype=object)



As shown above, the `claim_status` and `author_ban_status` features are each of data type `object` currently. In order to work with the implementations of models through `sklearn`, these categorical features will need to be made numeric. One way to do this is through one-hot encoding.

Encode categorical features in the training set using an appropriate method.


```python
# Select the training features that needs to be encoded
x_train_to_encode = x_train[['claim_status', 'author_ban_status']]
# Display first few rows
x_train_to_encode.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>claim_status</th>
      <th>author_ban_status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>28075</th>
      <td>opinion</td>
      <td>under review</td>
    </tr>
    <tr>
      <th>28358</th>
      <td>opinion</td>
      <td>active</td>
    </tr>
    <tr>
      <th>27086</th>
      <td>opinion</td>
      <td>active</td>
    </tr>
    <tr>
      <th>7104</th>
      <td>claim</td>
      <td>active</td>
    </tr>
    <tr>
      <th>25784</th>
      <td>opinion</td>
      <td>active</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Set up an encoder for one-hot encoding the categorical features
x_encoder = OneHotEncoder(sparse_output = False, drop = 'first')
```


```python
# Fit and transform the training features using the encoder
x_train_encoded = x_encoder.fit_transform(x_train_to_encode)
```


```python
# Get feature names from encoder
x_encoder.get_feature_names_out()
```




    array(['claim_status_opinion', 'author_ban_status_banned',
           'author_ban_status_under review'], dtype=object)




```python
# Display first few rows of encoded training features
x_train_encoded
```




    array([[1., 0., 1.],
           [1., 0., 0.],
           [1., 0., 0.],
           ...,
           [1., 0., 0.],
           [0., 1., 0.],
           [1., 0., 0.]], shape=(26826, 3))




```python
# Place encoded training features (which is currently an array) into a dataframe
x_train_encoded_df = pd.DataFrame(x_train_encoded, columns = x_encoder.get_feature_names_out())

# Display first few rows
x_train_encoded_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>claim_status_opinion</th>
      <th>author_ban_status_banned</th>
      <th>author_ban_status_under review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Display first few rows of `X_train` with `claim_status` and `author_ban_status` columns dropped (since these features are being transformed to numeric)
x_train_dropped = x_train.drop(columns = ['claim_status', 'author_ban_status']).reset_index(drop = True)
```


```python
# Concatenate `X_train` and `X_train_encoded_df` to form the final dataframe for training data (`X_train_final`)
# Note: Using `.reset_index(drop=True)` to reset the index in X_train after dropping `claim_status` and `author_ban_status`,
# so that the indices align with those in `X_train_encoded_df` and `count_df`
x_train_final = pd.concat([x_train_dropped, x_train_encoded_df], axis = 1)

# Display first few rows

x_train_final.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>video_duration_sec</th>
      <th>video_view_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
      <th>claim_status_opinion</th>
      <th>author_ban_status_banned</th>
      <th>author_ban_status_under review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>24</td>
      <td>4320.0</td>
      <td>194.0</td>
      <td>23.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>8</td>
      <td>7899.0</td>
      <td>143.0</td>
      <td>6.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>53</td>
      <td>8796.0</td>
      <td>863.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>43</td>
      <td>176311.0</td>
      <td>22270.0</td>
      <td>1546.0</td>
      <td>557.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>27</td>
      <td>519.0</td>
      <td>65.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Check the data type of the outcome variable.


```python
# Check data type of outcome variable
y_train.dtypes
```




    dtype('O')




```python
# Get unique values of outcome variable
y_train.unique()
```




    array(['verified', 'not verified'], dtype=object)



A shown above, the outcome variable is of data type `object` currently. One-hot encoding can be used to make this variable numeric.

Encode categorical values of the outcome variable the training set using an appropriate method.


```python
# Set up an encoder for one-hot encoding the categorical outcome variable
y_encoder = OneHotEncoder(sparse_output = False, drop = 'first')
```


```python
# Encode the training outcome variable
# Notes:
#   - Adjusting the shape of `y_train` before passing into `.fit_transform()`, since it takes in 2D array
#   - Using `.ravel()` to flatten the array returned by `.fit_transform()`, so that it can be used later to train the model

y_train_final = y_encoder.fit_transform(y_train.values.reshape(-1, 1)).ravel()

# Display the encoded training outcome variable

y_train_final

```




    array([1., 1., 1., ..., 0., 0., 0.], shape=(26826,))



### **Task 3d. Model building**

Construct a model and fit it to the training set.


```python
# Construct a logistic regression model and fit it to the training set
clf = LogisticRegression(random_state = 42, max_iter = 800).fit(x_train_final, y_train_final)

```

## **PACE: Execute**
Consider the questions in the your PACE Strategy Document to reflect on the Execute stage.

### **Taks 4a. Results and evaluation**

Evaluate your model.

Encode categorical features in the testing set using an appropriate method.


```python
# Select the testing features that needs to be encoded
x_test_to_encode = x_test[['claim_status', 'author_ban_status']]

# Display first few rows
x_test_to_encode.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>claim_status</th>
      <th>author_ban_status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>26849</th>
      <td>opinion</td>
      <td>active</td>
    </tr>
    <tr>
      <th>1227</th>
      <td>claim</td>
      <td>under review</td>
    </tr>
    <tr>
      <th>25467</th>
      <td>opinion</td>
      <td>under review</td>
    </tr>
    <tr>
      <th>27310</th>
      <td>opinion</td>
      <td>banned</td>
    </tr>
    <tr>
      <th>27560</th>
      <td>opinion</td>
      <td>banned</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Transform the testing features using the encoder
x_test_encoded = x_encoder.transform(x_test_to_encode)

# Display first few rows of encoded testing features
x_test_encoded
```




    array([[1., 0., 0.],
           [0., 0., 1.],
           [1., 0., 1.],
           ...,
           [1., 0., 0.],
           [1., 0., 0.],
           [1., 0., 0.]], shape=(8942, 3))




```python
# Place encoded testing features (which is currently an array) into a dataframe
x_test_encoded_df = pd.DataFrame(x_test_encoded, columns = x_encoder.get_feature_names_out())

# Display first few rows
x_test_encoded_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>claim_status_opinion</th>
      <th>author_ban_status_banned</th>
      <th>author_ban_status_under review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Display first few rows of `X_test` with `claim_status` and `author_ban_status` columns dropped (since these features are being transformed to numeric)
x_test_dropped = x_test.drop(columns = ['claim_status', 'author_ban_status'])
x_test_dropped.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>video_duration_sec</th>
      <th>video_view_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>26849</th>
      <td>14</td>
      <td>1580.0</td>
      <td>49.0</td>
      <td>12.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1227</th>
      <td>43</td>
      <td>862507.0</td>
      <td>86137.0</td>
      <td>3206.0</td>
      <td>265.0</td>
    </tr>
    <tr>
      <th>25467</th>
      <td>52</td>
      <td>449.0</td>
      <td>20.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>27310</th>
      <td>17</td>
      <td>4458.0</td>
      <td>111.0</td>
      <td>6.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>27560</th>
      <td>8</td>
      <td>9877.0</td>
      <td>65.0</td>
      <td>5.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Concatenate `X_test` and `X_test_encoded_df` to form the final dataframe for training data (`X_test_final`)
# Note: Using `.reset_index(drop=True)` to reset the index in X_test after dropping `claim_status`, and `author_ban_status`,
# so that the indices align with those in `X_test_encoded_df` and `test_count_df`

x_test_final = pd.concat([x_test_dropped.reset_index(drop = True), x_test_encoded_df], axis = 1)

# Display first few rows

x_test_final.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>video_duration_sec</th>
      <th>video_view_count</th>
      <th>video_share_count</th>
      <th>video_download_count</th>
      <th>video_comment_count</th>
      <th>claim_status_opinion</th>
      <th>author_ban_status_banned</th>
      <th>author_ban_status_under review</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>14</td>
      <td>1580.0</td>
      <td>49.0</td>
      <td>12.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>43</td>
      <td>862507.0</td>
      <td>86137.0</td>
      <td>3206.0</td>
      <td>265.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>52</td>
      <td>449.0</td>
      <td>20.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>17</td>
      <td>4458.0</td>
      <td>111.0</td>
      <td>6.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>8</td>
      <td>9877.0</td>
      <td>65.0</td>
      <td>5.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Test the logistic regression model. Use the model to make predictions on the encoded testing set.


```python
# Use the logistic regression model to get predictions on the encoded testing set
y_pred = clf.predict(x_test_final)
```

Display the predictions on the encoded testing set.


```python
y_pred
```




    array([1., 0., 1., ..., 1., 1., 1.], shape=(8942,))



Display the true labels of the testing set.


```python
# Display the true labels of the testing set
y_test
```




    26849        verified
    1227     not verified
    25467        verified
    27310        verified
    27560        verified
                 ...     
    16315    not verified
    19045        verified
    30024        verified
    17501    not verified
    29483        verified
    Name: verified_status, Length: 8942, dtype: object



Encode the true labels of the testing set so it can be compared to the predictions.


```python
# Encode the testing outcome variable
# Notes:
#   - Adjusting the shape of `y_test` before passing into `.transform()`, since it takes in 2D array
#   - Using `.ravel()` to flatten the array returned by `.transform()`, so that it can be used later to compare with predictions

y_test_final = y_encoder.transform(y_test.values.reshape(-1, 1)).ravel()

# Display the encoded testing outcome variable

y_test_final
```




    array([1., 0., 1., ..., 1., 0., 1.], shape=(8942,))



Confirm again that the dimensions of the training and testing sets are in alignment since additional features were added.


```python
# Get shape of each training and testing set
x_train_final.shape, y_train_final.shape, x_test_final.shape, y_test_final.shape
```




    ((26826, 8), (26826,), (8942, 8), (8942,))



* The number of features (`8`) aligns between the training and testing sets.
* The number of rows aligns between the features and the outcome variable for training (`26826`) and testing (`8942`).

### **Task 4b. Visualize model results**

Create a confusion matrix to visualize the results of the logistic regression model.


```python
# Compute values for confusion matrix

cm = confusion_matrix(y_test_final, y_pred, labels = clf.classes_)

# Create display of confusion matrix

disp = ConfusionMatrixDisplay(confusion_matrix = cm, display_labels = clf.classes_)

# Plot confusion matrix

disp.plot()

# Display plot
plt.show()
```


    
![png](TikTok_Binomial_Logistic_Regression_Model_Verified_Status_files/TikTok_Binomial_Logistic_Regression_Model_Verified_Status_123_0.png)
    



```python
(3770+2363) / (3770 + 735 + 2074 + 2363)
```




    0.685864459852382



The upper-left quadrant displays the number of true negatives: the number of videos posted by unverified accounts that the model accurately classified as so.

The upper-right quadrant displays the number of false positives: the number of videos posted by unverified accounts that the model misclassified as posted by verified accounts.

The lower-left quadrant displays the number of false negatives: the number of videos posted by verified accounts that the model misclassified as posted by unverified accounts.

The lower-right quadrant displays the number of true positives: the number of videos posted by verified accounts that the model accurately classified as so.

A perfect model would yield all true negatives and true positives, and no false negatives or false positives.

Create a classification report that includes precision, recall, f1-score, and accuracy metrics to evaluate the performance of the logistic regression model.


```python
# Create a classification report
target_labels = ["verified", "not verified"]
print(classification_report(y_test_final, y_pred, target_names=target_labels))
```

                  precision    recall  f1-score   support
    
        verified       0.76      0.53      0.63      4437
    not verified       0.65      0.84      0.73      4505
    
        accuracy                           0.69      8942
       macro avg       0.70      0.68      0.68      8942
    weighted avg       0.70      0.69      0.68      8942
    
    

The classification report above shows that the logistic regression model achieved a precision of 65% and a recall of 84%, and it achieved an accuracy of 69%. Note that the precision and recall scores are taken from the "not verified" row of the output because that is the target class that we are most interested in predicting. The "verified" class has its own precision/recall metrics, and the weighted average represents the combined metrics for both classes of the target variable.

### **Task 4c. Interpret model coefficients**


```python
# Get the feature names from the model and the model coefficients (which represent log-odds ratios)
# Place into a DataFrame for readability

coef_df = pd.DataFrame(data = {'Feature Name': clf.feature_names_in_, 'Model Coefficient': clf.coef_[0]})
coef_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Feature Name</th>
      <th>Model Coefficient</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>video_duration_sec</td>
      <td>-8.611924e-04</td>
    </tr>
    <tr>
      <th>1</th>
      <td>video_view_count</td>
      <td>-1.807499e-07</td>
    </tr>
    <tr>
      <th>2</th>
      <td>video_share_count</td>
      <td>5.098064e-06</td>
    </tr>
    <tr>
      <th>3</th>
      <td>video_download_count</td>
      <td>-1.080247e-04</td>
    </tr>
    <tr>
      <th>4</th>
      <td>video_comment_count</td>
      <td>5.235502e-04</td>
    </tr>
    <tr>
      <th>5</th>
      <td>claim_status_opinion</td>
      <td>1.682384e+00</td>
    </tr>
    <tr>
      <th>6</th>
      <td>author_ban_status_banned</td>
      <td>-3.795328e-01</td>
    </tr>
    <tr>
      <th>7</th>
      <td>author_ban_status_under review</td>
      <td>-1.259566e-01</td>
    </tr>
  </tbody>
</table>
</div>



### **Task 4d. Conclusion**

1. What are the key takeaways from this project?

2. What results can be presented from this project?

1. **Key Takeaways from this project:**
   * Verified status is strongly influenced by **video share count** and whether the content is labeled as an **opinion** rather than a claim.
   * Engagement metrics, such as **comment count**, play a smaller but still positive role in predicting verification likelihood.
   * Negative associations were found with **view count, author banned status**, and **under review status**, indicating potential red flags for verification.
   * The logistic regression model achieved **69% accuracy**, with stronger recall for non-verified users (0.84) than verified users (0.53), revealing an imbalance in predictive power.
   * The dataset has a **few strongly correlated variables**, which might lead to **multicollinearity** issues when fitting a logistic regression model. We decided to drop `video_like_count` from the model building.
   * Based on the logistic regression model, each **additional second of the video** is associated with 0.009 increase in the **log-odds of the user having a verified status.**

2. **Results that can be presented from this project:**
   * A logistic regression model was developed to predict whether a user is verified, based on video characteristics and account status.
   * The model shows that **higher shares and opinion content** increase the probability of verification, while **ban/under review statuses** decrease it.
   * Classification performance: **Precision** for verified = 0.76, **Recall** for verified = 0.53; **Precision** for not verified = 0.65, **Recall** for not verified = 0.84.
   * Confusion matrix indicates that the model correctly identifies most non-verified users but misses some verified users.

