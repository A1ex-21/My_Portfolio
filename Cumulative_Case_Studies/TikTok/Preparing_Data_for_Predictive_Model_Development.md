# <a id='toc1_'></a>[Course_2_TikTok_Project](#toc0_)

**Get started with Python**

**Table of contents**<a id='toc0_'></a>    
- [Course_2_TikTok_Project](#toc1_)    
  - [Scenario](#toc1_1_)    
    - [Email from Rosie Mae Bradshaw, Data Science Manager](#toc1_1_1_)    
    - [Email from Orion Rainier, Data Scientist](#toc1_1_2_)    
    - [Data Dictionary](#toc1_1_3_)    
    - [Course 2 End-of-course project: Inspect and analyze data](#toc1_1_4_)    
  - [PACE Stages](#toc1_2_)    
    - [PACE: Plan](#toc1_2_1_)    
      - [Task 1. Understand the Situation](#toc1_2_1_1_)    
    - [PACE: Analyze](#toc1_2_2_)    
      - [Task 2a. Imports and Data Loading](#toc1_2_2_1_)    
      - [Task 2.b Understand the data - Inpsect the data](#toc1_2_2_2_)    
      - [Task 2c. Understand the data - Investigate the variables](#toc1_2_2_3_)    
    - [PACE: Construct](#toc1_2_3_)    
    - [PACE: Execute](#toc1_2_4_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[Scenario](#toc0_)

The team's latest project is in its early stages of developing a machine learning model to classify claims in videos.

Previously, you were asked to complete a project proposal by your supervisor, Rosie Mae Bradshaw. You have received notice that the project proposal submitted by the
team has been approved and your team has been given access to TikTok's user data. To get clear insights, the data must be inspected, organized, and prepared for analysis.

You discover two new emails in your inbox: one from your supervisor, Rosie Mae Bradshaw, and one from Willow Jaffey, the data team's Data Science Lead. Review the
emails, then follow the provided instructions to complete the PACE strategy document, the code notebook, and the executive summary.

**Note:** Team member names used in this workplace scenario are fictional and are not representative of TikTok.

### <a id='toc1_1_1_'></a>[Email from Rosie Mae Bradshaw, Data Science Manager](#toc0_)

**Subject:** Help with coding notebook?

**From:** "Bradshaw, Rosie Mae" —rosiemaebradshaw@tiktok

**Cc:** "Rainier, Orion"—orionrainier@tiktok

Good morning,

I have a couple of updates on our latest project. The leadership team has approved the project proposal that we completed previously. Thanks for all of your great work so
far. Additionally, I just received an email from our Project Management Officer, Mary Joanna Rodgers that the data team is clear to proceed.

Before we begin the process of Exploratory Data Analysis (EDA), we could really use your help with coding and prepping the data. During your interview you mentioned that
you worked with Python specifically in the Google certificate program you completed. That experience sounds applicable here.

Orion Rainier (Cc'd above) started a Jupyter notebook with the relevant dataset (attached). Orion is very involved in the final stages of another project. I'm sure your
assistance in completing the coding and setting up the notebook for the project would be greatly appreciated.

Orion, do you mind sharing the details?

Humblest regards,

Rosie Mae Bradshaw

Data Science Manager

TikTok

[Learn about TikTok's Trust & Safety team](https://newsroom.tiktok.com/en-us/safety)

### <a id='toc1_1_2_'></a>[Email from Orion Rainier, Data Scientist](#toc0_)

**Subject:** RE: Help with coding notebook?

**From:** "Rainier, Orion"—orionrainier@tiktok

**Cc:** "Bradshaw, Rosie Mae" —rosiemaebradshaw@tiktok

Nice to meet you (virtually)!

Hope you have enjoyed your first few weeks!

With the project proposal approved, we are ready to begin the process of preparing the claim classification data. The goal of this project is to ultimately build a machine
learning model that can streamline the claims process by identifying whether statements made in videos are claims or opinions.

A claim refers to information that is either unsourced or from an unverified source. For example, "The news reported that someone revealed that around 50% of the mined
gold on Earth comes from one source."

Opinions refer to the personal beliefs or thoughts of a group or an individual. Here's an example, "In my opinion the most productive work day of the week is Tuesday."

There are a number of data team members committed to adjusting the machine learning developed for the last project, so your help is greatly appreciated!

Until we finish the prior project, there is no need to do a full EDA on this data. We will get to that soon. Do you mind importing the data (attached) and reviewing it for the
team? It would be fantastic if you could include a summary of the column Data types, data value nonnull counts, relevant and irrelevant columns, along with anything else
code related you think is worth sharing/showing in the notebook? You'll need to select a couple ofvariables to focus on. Include their minimum and maximum values. I
haven't looked closely at the data yet, but it would be really helpful if you can create meaningful variables by combining or modifying the structures given.

Thanks,

Orion Rainier

Data Scientist

TikTok

*"Big data isn't about bits, it's about talent." — Douglas Merrill*

### <a id='toc1_1_3_'></a>[Data Dictionary](#toc0_)

This project uses a dataset called tiktok_dataset.csv. It contains synthetic data created for this project in partnership with TikTok. Examine each data variable gathered.

**19,383 rows** - Each row represents a different published TikTok video in which a claim/opinion has been made.
**12 columns**
| Column name               | Type | Description                                                                                                              |
|---------------------------|------|--------------------------------------------------------------------------------------------------------------------------|
| #                         | int  | TikTok assigned number for video with claim/opinion.                                                                    |
| claim_status              | obj  | Whether the published video has been identified as an “opinion” or a “claim.” In this dataset, an “opinion” refers to an individual’s or group’s personal belief or thought. A “claim” refers to information that is either unsourced or from an unverified source. |
| video_id                  | int  | Random identifying number assigned to video upon publication on TikTok.                                                 |
| video_duration_sec        | int  | How long the published video is measured in seconds.                                                                    |
| video_transcription_text | obj  | Transcribed text of the words spoken in the published video.                                                            |
| verified_status           | obj  | Indicates the status of the TikTok user who published the video in terms of their verification, either “verified” or “not verified.” |
| author_ban_status         | obj  | Indicates the status of the TikTok user who published the video in terms of their permissions: “active,” “under scrutiny,” or “banned.” |
| video_view_count          | float | The total number of times the published video has been viewed. |
| video_like_count          | float | The total number of times the published video has been liked by other users. |
| video_share_count         | float | The total number of times the published video has been shared by other users. |
| video_download_count      | float | The total number of times the published video has been downloaded by other users. |
| video_comment_count       | float | The total number of comments on the published video

### <a id='toc1_1_4_'></a>[Course 2 End-of-course project: Inspect and analyze data](#toc0_)

In this activity, you will examine data provided and prepare it for analysis.


**The purpose** of this project is to investigate and understand the data provided. This activity will:

1.   Acquaint you with the data

2.   Compile summary information about the data

3.   Begin the process of EDA and reveal insights contained in the data

4.   Prepare you for more in-depth EDA, hypothesis testing, and statistical analysis

**The goal** is to construct a dataframe in Python, perform a cursory inspection of the provided dataset, and inform TikTok data team members of your findings.

*This activity has three parts:*

**Part 1:** Understand the situation
* How can you best prepare to understand and organize the provided TikTok information?

**Part 2:** Understand the data

* Create a pandas dataframe for data learning and future exploratory data analysis (EDA) and statistical activities

* Compile summary information about the data to inform next steps

**Part 3:** Understand the variables

* Use insights from your examination of the summary data to guide deeper investigation into variables


To complete the activity, follow the instructions and answer the questions below. Then, you will us your responses to these questions and the questions included in the Course 2 PACE Strategy Document to create an executive summary.

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_2_'></a>[PACE Stages](#toc0_)

### <a id='toc1_2_1_'></a>[PACE: Plan](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:

#### <a id='toc1_2_1_1_'></a>[Task 1. Understand the Situation](#toc0_)
*   How can you best prepare to understand and organize the provided information?


*Begin by exploring your dataset and consider reviewing the Data Dictionary.*

**Answer:**

Prepare by reading in the data, viewing the data dictionary, and exploring the dataset to identify key variables for the stakeholder.

### <a id='toc1_2_2_'></a>[PACE: Analyze](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

#### <a id='toc1_2_2_1_'></a>[Task 2a. Imports and Data Loading](#toc0_)

Start by importing the packages that you will need to load and explore the dataset.


```python
import numpy as np
import pandas as pd
```

Then, load the dataset into a dataframe. Creating a dataframe will help you conduct data manipulation, exploratory data analysis (EDA), and statistical activities.


```python
data = pd.read_csv("tiktok_dataset.csv")
data
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
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>19377</th>
      <td>19378</td>
      <td>NaN</td>
      <td>7578226840</td>
      <td>21</td>
      <td>NaN</td>
      <td>not verified</td>
      <td>active</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19378</th>
      <td>19379</td>
      <td>NaN</td>
      <td>6079236179</td>
      <td>53</td>
      <td>NaN</td>
      <td>not verified</td>
      <td>active</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19379</th>
      <td>19380</td>
      <td>NaN</td>
      <td>2565539685</td>
      <td>10</td>
      <td>NaN</td>
      <td>verified</td>
      <td>under review</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19380</th>
      <td>19381</td>
      <td>NaN</td>
      <td>2969178540</td>
      <td>24</td>
      <td>NaN</td>
      <td>not verified</td>
      <td>active</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19381</th>
      <td>19382</td>
      <td>NaN</td>
      <td>8132759688</td>
      <td>13</td>
      <td>NaN</td>
      <td>not verified</td>
      <td>active</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>19382 rows × 12 columns</p>
</div>



#### <a id='toc1_2_2_2_'></a>[Task 2.b Understand the data - Inpsect the data](#toc0_)

View and inspect summary information about the dataframe

*Consider the following questions:*

**Question 1:** When reviewing the first few rows of the dataframe, what do you observe about the data? What does each row represent?

**Question 2:** When reviewing the `data.info()` output, what do you notice about the different variables? Are there any null values? Are all of the variables numeric? Does anything else stand out?

**Question 3:** When reviewing the `data.describe()` output, what do you notice about the distributions of each variable? Are there any questionable values? Does it seem that there are outlier values?


```python
data.head(10)
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
    <tr>
      <th>5</th>
      <td>6</td>
      <td>claim</td>
      <td>8972200955</td>
      <td>35</td>
      <td>someone shared with me that gross domestic pro...</td>
      <td>not verified</td>
      <td>under review</td>
      <td>336647.0</td>
      <td>175546.0</td>
      <td>62303.0</td>
      <td>4293.0</td>
      <td>1857.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>claim</td>
      <td>4958886992</td>
      <td>16</td>
      <td>someone shared with me that elvis presley has ...</td>
      <td>not verified</td>
      <td>active</td>
      <td>750345.0</td>
      <td>486192.0</td>
      <td>193911.0</td>
      <td>8616.0</td>
      <td>5446.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>claim</td>
      <td>2270982263</td>
      <td>41</td>
      <td>someone shared with me that the best selling s...</td>
      <td>not verified</td>
      <td>active</td>
      <td>547532.0</td>
      <td>1072.0</td>
      <td>50.0</td>
      <td>22.0</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>claim</td>
      <td>5235769692</td>
      <td>50</td>
      <td>someone shared with me that about half of the ...</td>
      <td>not verified</td>
      <td>active</td>
      <td>24819.0</td>
      <td>10160.0</td>
      <td>1050.0</td>
      <td>53.0</td>
      <td>27.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>claim</td>
      <td>4660861094</td>
      <td>45</td>
      <td>someone shared with me that it would take a 50...</td>
      <td>verified</td>
      <td>active</td>
      <td>931587.0</td>
      <td>171051.0</td>
      <td>67739.0</td>
      <td>4104.0</td>
      <td>2540.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
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
    


```python
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



**Answer:**

**Question 1:** The dataframe contains a collection of categorical, text, and numerical data. Each row represents a distinct TikTok video that presents either a claim or an opinion and the accompanying metadata about that video.

**Question 2:** I notice that there are different data types in each column, and there are 298 null values particually in the variables: `claim_status`, `video_transcription_text`, `video_view_count`, `video_like_count`, `video_share_count`, `video_download_count`, `video_comment_count`. There are five float64s, three int64s, four objects and 19,382 observations and 12 columns.

**Question 3:** The summary statistics reveal that many variables, especially the engagement metrics like `video_view_count`, `video_like_count`, and `video_comment_count`, are highly right-skewed with large maximum and standard deviation values, compared to their means and quartiles, indicating the presence of outliers and possibly questionable values such as zeros that may represent missing or suppressed data. 

#### <a id='toc1_2_2_3_'></a>[Task 2c. Understand the data - Investigate the variables](#toc0_)
In this phase, you will begin to investigate the variables more closely to better understand them.

You know from the project proposal that the ultimate objective is to use machine learning to classify videos as either claims or opinions. A good first step towards understanding the data might therefore be examining the `claim_status` variable. Begin by determining how many videos there are for each different claim status.


```python
# What are the different values for claim status and how many of each are in the data?
data['claim_status'].value_counts()
```




    claim_status
    claim      9608
    opinion    9476
    Name: count, dtype: int64



**Question:** What do you notice about the values shown?

**Answer:** I notice that there are more claims then there are opinions in the dataframe, but overall the counts of each `claim_status` are quite balanced.

Next, examine the engagement trends associated with each different claim status.

Start by using Boolean masking to filter the data according to claim status, then calculate the mean and median view counts for each claim status.


```python
# What is the average view count of videos with "claim" status?

mask = data['claim_status'] == 'claim'
claim_data = data[mask]
print('Mean view count claims:', claim_data['video_view_count'].mean())
print('Median view count claims:', claim_data['video_view_count'].median())
```

    Mean view count claims: 501029.4527477102
    Median view count claims: 501555.0
    


```python
# What is the average view count of videos with "opinion" status?

mask2 = data['claim_status'] == 'opinion'
opinion_data = data[mask2]
print('Mean view count opinions:', opinion_data['video_view_count'].mean())
print('Median view count opinions:', opinion_data['video_view_count'].median())
```

    Mean view count opinions: 4956.43224989447
    Median view count opinions: 4953.0
    

**Question:** What do you notice about the mean and media within each claim category?

**Answer:** The mean and the median within each claim category are close to one another, but there is a vast discrepancy between view counts for videos labeled as claims and videos labeled as opinions.

Now, examine trends associated with the ban status of the author.

Use `groupby()` to calculate how many videos there are for each combination of categories of claim status and author ban status.


```python
# Get counts for each group combination of claim status and author ban status
data.groupby(['claim_status','author_ban_status']).count()[['#']]
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
      <th></th>
      <th>#</th>
    </tr>
    <tr>
      <th>claim_status</th>
      <th>author_ban_status</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" valign="top">claim</th>
      <th>active</th>
      <td>6566</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>1439</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>1603</td>
    </tr>
    <tr>
      <th rowspan="3" valign="top">opinion</th>
      <th>active</th>
      <td>8817</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>196</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>463</td>
    </tr>
  </tbody>
</table>
</div>



**Question:** What do you notice about the number of claims videos with banned authors? Why might this relationship occur?

**Answer:**

There are many more claim videos with banned authors than there are opinion videos with banned authors.

This could mean a number of things, including the possibilities that:

* Claim videos are more strictly policed than opinion videos
* Authors must comply with a stricter set of rules if they post a claim than if they post an opinion

Also, it should be noted that there's no way of knowing if claim videos are inherently more likely than opinion videos to result in author bans, or if authors who post claim videos are more likely to post videos that violate terms of service.

Finally, while you can use this data to draw conclusions about banned/active authors, you cannot draw conclusions about banned videos. There's no way of determining whether a particular video _caused_ the ban, and banned authors could have posted videos that complied with the terms of service.

Continue investigating engagement levels, now focusing on `author_ban_status`.

Calculate the median video share count of each author ban status.


```python
data.groupby(['author_ban_status']).agg(
    {'video_view_count': ['mean', 'median'],
    'video_like_count': ['mean', 'median'],
    'video_share_count': ['mean', 'median']}
)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="2" halign="left">video_view_count</th>
      <th colspan="2" halign="left">video_like_count</th>
      <th colspan="2" halign="left">video_share_count</th>
    </tr>
    <tr>
      <th></th>
      <th>mean</th>
      <th>median</th>
      <th>mean</th>
      <th>median</th>
      <th>mean</th>
      <th>median</th>
    </tr>
    <tr>
      <th>author_ban_status</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>active</th>
      <td>215927.039524</td>
      <td>8616.0</td>
      <td>71036.533836</td>
      <td>2222.0</td>
      <td>14111.466164</td>
      <td>437.0</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>445845.439144</td>
      <td>448201.0</td>
      <td>153017.236697</td>
      <td>105573.0</td>
      <td>29998.942508</td>
      <td>14468.0</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>392204.836399</td>
      <td>365245.5</td>
      <td>128718.050339</td>
      <td>71204.5</td>
      <td>25774.696999</td>
      <td>9444.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# What's the median video share count of each author ban status?

data.groupby(['author_ban_status']).median(numeric_only=True)[['video_share_count']]
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
      <th>video_share_count</th>
    </tr>
    <tr>
      <th>author_ban_status</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>active</th>
      <td>437.0</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>14468.0</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>9444.0</td>
    </tr>
  </tbody>
</table>
</div>



**Question:** What do you notice about the share count of banned authors, compared to that of active authors? Explore this in more depth.

**Answer:** I notice that the `video_share_count` for banned authors median share count is 33 times the median share count of active authors.

Use `groupby()` to group the data by `author_ban_status`, then use `agg()` to get the count, mean, and median of each of the following columns:
* `video_view_count`
* `video_like_count`
* `video_share_count`

Remember, the argument for the `agg()` function is a dictionary whose keys are columns. The values for each column are a list of the calculations you want to perform.


```python
data.groupby(['author_ban_status']).agg(
    {'video_view_count': ['count', 'mean', 'median'],
    'video_like_count': ['count', 'mean', 'median'],
    'video_share_count': ['count', 'mean', 'median']
    })
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="3" halign="left">video_view_count</th>
      <th colspan="3" halign="left">video_like_count</th>
      <th colspan="3" halign="left">video_share_count</th>
    </tr>
    <tr>
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
    </tr>
    <tr>
      <th>author_ban_status</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>active</th>
      <td>15383</td>
      <td>215927.039524</td>
      <td>8616.0</td>
      <td>15383</td>
      <td>71036.533836</td>
      <td>2222.0</td>
      <td>15383</td>
      <td>14111.466164</td>
      <td>437.0</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>1635</td>
      <td>445845.439144</td>
      <td>448201.0</td>
      <td>1635</td>
      <td>153017.236697</td>
      <td>105573.0</td>
      <td>1635</td>
      <td>29998.942508</td>
      <td>14468.0</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>2066</td>
      <td>392204.836399</td>
      <td>365245.5</td>
      <td>2066</td>
      <td>128718.050339</td>
      <td>71204.5</td>
      <td>2066</td>
      <td>25774.696999</td>
      <td>9444.0</td>
    </tr>
  </tbody>
</table>
</div>



**Question:** What do you notice about the number of views, likes, and shares for banned authors compared to active authors?

**Answer:** Banned authors and under review authors get significantly more views, likes and shares than active authors. In most groups, the mean is much greater than the median, which indicates that there are some videos with very high engagement counts.

Now, create three new columns to help better understand engagement rates:
* `likes_per_view`: represents the number of likes divided by the number of views for each video
* `comments_per_view`: represents the number of comments divided by the number of views for each video
* `shares_per_view`: represents the number of shares divided by the number of views for each video


```python
# Create a likes_per_view column
data['likes_per_view'] = data['video_like_count'] / data['video_view_count']

# Create a comments_per_view column
data['comments_per_view'] = data['video_comment_count'] / data['video_view_count']

# Create a shares_per_view column
data['shares_per_view'] = data['video_share_count'] / data['video_view_count']
```

Use `groupby()` to compile the information in each of the three newly created columns for each combination of categories of claim status and author ban status, then use `agg()` to calculate the count, the mean, and the median of each group.


```python
data.groupby(['claim_status', 'author_ban_status']).agg(
    {'likes_per_view': ['count', 'mean', 'median'],
    'comments_per_view': ['count', 'mean', 'median'],
    'shares_per_view': ['count', 'mean', 'median']
    })
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th colspan="3" halign="left">likes_per_view</th>
      <th colspan="3" halign="left">comments_per_view</th>
      <th colspan="3" halign="left">shares_per_view</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
      <th>count</th>
      <th>mean</th>
      <th>median</th>
    </tr>
    <tr>
      <th>claim_status</th>
      <th>author_ban_status</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" valign="top">claim</th>
      <th>active</th>
      <td>6566</td>
      <td>0.329542</td>
      <td>0.326538</td>
      <td>6566</td>
      <td>0.001393</td>
      <td>0.000776</td>
      <td>6566</td>
      <td>0.065456</td>
      <td>0.049279</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>1439</td>
      <td>0.345071</td>
      <td>0.358909</td>
      <td>1439</td>
      <td>0.001377</td>
      <td>0.000746</td>
      <td>1439</td>
      <td>0.067893</td>
      <td>0.051606</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>1603</td>
      <td>0.327997</td>
      <td>0.320867</td>
      <td>1603</td>
      <td>0.001367</td>
      <td>0.000789</td>
      <td>1603</td>
      <td>0.065733</td>
      <td>0.049967</td>
    </tr>
    <tr>
      <th rowspan="3" valign="top">opinion</th>
      <th>active</th>
      <td>8817</td>
      <td>0.219744</td>
      <td>0.218330</td>
      <td>8817</td>
      <td>0.000517</td>
      <td>0.000252</td>
      <td>8817</td>
      <td>0.043729</td>
      <td>0.032405</td>
    </tr>
    <tr>
      <th>banned</th>
      <td>196</td>
      <td>0.206868</td>
      <td>0.198483</td>
      <td>196</td>
      <td>0.000434</td>
      <td>0.000193</td>
      <td>196</td>
      <td>0.040531</td>
      <td>0.030728</td>
    </tr>
    <tr>
      <th>under review</th>
      <td>463</td>
      <td>0.226394</td>
      <td>0.228051</td>
      <td>463</td>
      <td>0.000536</td>
      <td>0.000293</td>
      <td>463</td>
      <td>0.044472</td>
      <td>0.035027</td>
    </tr>
  </tbody>
</table>
</div>



**Question:**

How does the data for claim videos and opinion videos compare or differ? Consider views, comments, likes, and shares.

**Answer:**

We know that videos by banned authors and those under review tend to get far more views, likes, and shares than videos by non-banned authors. However, *when a video does get viewed*, its engagement rate is less related to author ban status and more related to its claim status.

Also, we know that claim videos have a higher view rate than opinion videos, but this tells us that claim videos also have a higher rate of likes on average, so they are more favorably received as well. Furthermore, they receive more engagement via comments and shares than opinion videos.

Note that for claim videos, banned authors have slightly higher likes/view and shares/view rates than active authors or those under review. However, for opinion videos, active authors and those under review both get higher engagement rates than banned authors in all categories.

### <a id='toc1_2_3_'></a>[PACE: Construct](#toc0_)

**Note**: The Construct stage does not apply to this workflow. The PACE framework can be adapted to fit the specific requirements of any project.

### <a id='toc1_2_4_'></a>[PACE: Execute](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response.

**Given your efforts, what can you summarize for Rosie Mae Bradshaw and the TikTok data team?**

*Note for Learners: Your answer should address TikTok's request for a summary that covers the following points:*

*   What percentage of the data is comprised of claims and what percentage is comprised of opinions?
*   What factors correlate with a video's claim status?
*   What factors correlate with a video's engagement level?

**Answer:**

Of the 19,382 samples in this dataset, just under 50% are claims&mdash;9,608 of them.

Engagement level is strongly correlated with claim status. This should be a focus of further inquiry.

Videos with banned authors have significantly higher engagement than videos with active authors. Videos with authors under review fall between these two categories in terms of engagement levels.
