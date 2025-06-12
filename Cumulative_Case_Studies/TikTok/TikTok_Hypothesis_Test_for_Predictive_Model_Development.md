# <a id='toc1_'></a>[**Hypothesis Test for Predictive Model Development**](#toc0_)

**Course 4 - The Power of Statistics**

**Table of contents**<a id='toc0_'></a>    
- [**Hypothesis Test for Predictive Model Development**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Mary Joanna Rodgers, Project Management Officer**](#toc1_1_1_)    
    - [**Email from Rosie Mae Bradshaw, TikTok's Data Science Manager**](#toc1_1_2_)    
    - [**Email from Orion Rainier, Data Scientist**](#toc1_1_3_)    
    - [**Email from Willow Jaffey, Data Science Lead**](#toc1_1_4_)    
    - [**Email from Orion Rainier, Data Scientist**](#toc1_1_5_)    
    - [**Data Dictionary**](#toc1_1_6_)    
    - [**Objectives**](#toc1_1_7_)    
  - [**PACE Stages**](#toc1_2_)    
    - [**PACE: Plan**](#toc1_2_1_)    
      - [**Task 1. Imports and Data Loading**](#toc1_2_1_1_)    
    - [**PACE: Analyze and Construct**](#toc1_2_2_)    
      - [**Task 2. Data exploration**](#toc1_2_2_1_)    
      - [**Task 3. Hypothesis testing**](#toc1_2_2_2_)    
    - [**PACE: Execute**](#toc1_2_3_)    
      - [**Task 4. Communicate insights with stakeholders**](#toc1_2_3_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

The TikTok data analytics team has completed the first three milestones of the claims classification project and is nearing the halfway point. So far, the team has completed a
project proposal, and used Python to perform exploratory data analysis on the dataset for the claims classification project. The team also produced data visualizations in both
Python and Tableau to share with stakeholders. The next step is to use statistical methods to analyze and interpret the claims classification data.

You receive a new email from Mary Joanna Rodgers, one of TikTok's project management officers. Mary Joanna informs the data team about a new request: to determine
whether there is a statistically significant difference in the number of views for TikTok videos posted by verified accounts versus unverified accounts. You also receive follow-up
emails from Data Science Manager, Rosie Mae Bradshaw and Data Science Lead, Willow Jaffey. These emails share the details of the analysis. A final email from Data Scientist,
Orion Rainier, details your next assignment: to conduct a hypothesis test on verified versus unverified accounts in terms of video view count.

### <a id='toc1_1_1_'></a>[**Email from Mary Joanna Rodgers, Project Management Officer**](#toc0_)

**Subject:** New Request - Hypothesis Test: Verified/Unverified Accounts

**From:** "Rodgers, Mary Joanna" - maryjoannarodgers@tiktok

**Cc:** "Rainier, Orion" - orionrainier@tiktok; "Jaffey, Willow" - willowjaffey@tiktok; "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok

Hello Data Team!

Really excellent work so far. The leadership team is impressed with the results-especially the progress and insights shared on the last executive summary report! Thanks so
much for the hard work.

On that note, they have requested an additional item to be added to the initial project scope. We are interested in whether there is a statistical difference in the data between
verified and unverified accounts. Do you have any indication which variable would be most insightful to test in terms of verified and unverified accounts?

Many thanks!

Mary Joanna Rodgers

Project Management Officer

TikTok

*Network with TikTok employees from a variety of teams and locations. Participate in **TikTok Tuesdays**, every Tuesday@2pm EST*

### <a id='toc1_1_2_'></a>[**Email from Rosie Mae Bradshaw, TikTok's Data Science Manager**](#toc0_)

**Subject:** RE: New Request - Hypothesis Test: Verified/Unverified Accounts

**From:** "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok

**Cc:** "Jaffey, Willow" - willowjaffey@tiktok; "Rainier, Orion" - orionrainier@tiktok; "Rodgers, Mary Joanna" - maryjoannarodgers@tiktok

Thanks for the update, Mary Joanna.

It's great to hear that the leadership team is pleased with the data team's progress and the early insights we have been able to deliver. I never grow tired of being reminded of
what a great data team we have assembled here at TikTok!

If you would, please tell them we will be providing this analysis in two weeks time.

@Orion, my initial thought is for us to conduct a hypothesis test to analyze whether there is a significant difference in video views for verified versus unverified accounts. What
do you think?

In summary, I think we should do the following:
* Compute descriptive statistics on the claims classification data
* Conduct a two-sample hypothesis test of verified versus unverified accounts in terms of video view counts

Thanks,

Rosie Mae Bradshaw

Data Analysis Manager

TikTok

[Learn about TikTok's Trust & Safety team](https://newsroom.tiktok.com/en-us/safety)

### <a id='toc1_1_3_'></a>[**Email from Orion Rainier, Data Scientist**](#toc0_)

**Subject:** RE: New Request - Hypothesis Test: Verified/Unverified Accounts

**From:** "Rainier, Orion" - orionrainier@tiktok

**Cc:** "Jaffey, Willow" - willowjaffey@tiktok; "Rodgers, Mary Joanna" - maryjoannarodgers@tiktok; "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok

Hi all,

@Rosie Mae, I agree with you on statistical testing. We'll share a summary of the results before we present it to the client.

We'll get started right away.

Thank you,

Orion Rainier

Data Scientist

TikTok

*"Big data isn't about bits, it's about talent." — Douglas Merrill*

### <a id='toc1_1_4_'></a>[**Email from Willow Jaffey, Data Science Lead**](#toc0_)

**Subject:** RE: New Request - Hypothesis Test: Verified/Unverified Accounts

**From:** "Jaffey, Willow" —willowjaffey@tiktok

**Cc:** "Rodgers, Mary Joanna" —maryjoannarodgers@tiktok; "Bradshaw, Rosie Mae" —rosiemaebradshaw@tiktok; "Rainier, Orion"—orionrainier@tiktok

I agree with everyone's assessments on this project so far. I look forward to the team's progress in this milestone. Thank you all.

Willow Jaffey

Data Science Lead

TikTok

### <a id='toc1_1_5_'></a>[**Email from Orion Rainier, Data Scientist**](#toc0_)

**Subject:** RE: New Request - Hypothesis Test: Verified/Unverified Accounts

**From:** "Rainier, Orion" - orionrainier@tiktok

**Cc:**

Hi there, fellow data professional!

You've been handling all of this work really well, by the way. Excellent job.

I was wondering if you'd like to try the statistical testing yourself? Based on what you've shared with me, I have every confidence you already have all the skills and experience
needed for this task.

What do you think? Would you like to try?

Also, like I said in my email to Rosie Mae, you'll need to write an executive summary of the results so we can present it to Willow before sharing it with the client.

Thanks so much!

Orion Rainier

Data Scientist

TikTok

*"Big data isn't about bits, it's about talent." — Douglas Merrill*

### <a id='toc1_1_6_'></a>[**Data Dictionary**](#toc0_)

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


### <a id='toc1_1_7_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to demostrate knowledge of how to prepare, create, and analyze hypothesis tests.

**The goal** is to apply descriptive and inferential statistics, probability distributions, and hypothesis testing in Python.

<img src="Pace.png" width="100" height="100" align=left>

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

<img src="Plan.png" width="100" height="100" align=left>

### <a id='toc1_2_1_'></a>[**PACE: Plan**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response.

1. What is your research question for this data project? Later on, you will need to formulate the null and alternative hypotheses as the first step of your hypothesis test. Consider your research question now, at the start of this task.

Do videos from verified accounts and videos from unverified accounts have different average view counts?

Is there a relationship between the account being verified and the associated video's view counts?

Is there a statistically significant difference between verified and unverified accounts for the average video view counts?

#### <a id='toc1_2_1_1_'></a>[**Task 1. Imports and Data Loading**](#toc0_)

Import packages and libraries needed to compute descriptive statistics and conduct a hypothesis test.


```python
# Import packages for data manipulation
import numpy as np
import pandas as pd

# Import packages for data visualization
import seaborn as sns
import matplotlib.pyplot as plt

# Import packages for statistical analysis/hypothesis testing
from scipy import stats
```

Load the dataset.


```python
# Load dataset into dataframe
data = pd.read_csv("tiktok_dataset.csv")
```

<img src="Analyze.png" width="100" height="100" align=left>

<img src="Construct.png" width="100" height="100" align=left>

### <a id='toc1_2_2_'></a>[**PACE: Analyze and Construct**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:
1. Data professionals use descriptive statistics for Exploratory Data Analysis. How can computing descriptive statistics help you learn more about your data in this stage of your analysis?

Descriptive statistics are useful because they help summarize and organize large amounts of data in a clear and understandable way. They provide key insights such as the average, spread, and distribution of values, making it easier to identify trends, patterns, and outliers.

#### <a id='toc1_2_2_1_'></a>[**Task 2. Data exploration**](#toc0_)

Use descriptive statistics to conduct Exploratory Data Analysis (EDA).

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




```python
# Generate a table of descriptive statistics about the data
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
data.isna().sum()
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
data = data.dropna(axis=0)
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



You are interested in the relationship between `verified_status` and `video_view_count`. One approach is to examine the mean value of `video_view_count` for each group of `verified_status` in the sample data.


```python
# Compute the mean `video_view_count` for each group in `verified_status`

view_mean = data.groupby(['verified_status'])['video_view_count'].mean().reset_index()
view_mean

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
      <th>verified_status</th>
      <th>video_view_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>not verified</td>
      <td>265663.785339</td>
    </tr>
    <tr>
      <th>1</th>
      <td>verified</td>
      <td>91439.164167</td>
    </tr>
  </tbody>
</table>
</div>



#### <a id='toc1_2_2_2_'></a>[**Task 3. Hypothesis testing**](#toc0_)

Before you conduct your hypothesis test, consider the following questions where applicable to complete your code response:

1. Recall the difference between the null hypothesis and the alternative hypotheses. What are your hypotheses for this data project?

*   **Null hypothesis**: There is no difference in number of views between TikTok videos posted by verified accounts and TikTok videos posted by unverified accounts (any observed difference in the sample data is due to chance or sampling variability).
*    **Alternative hypothesis**: There is a difference in number of views between TikTok videos posted by verified accounts and TikTok videos posted by unverified accounts (any observed difference in the sample data is due to an actual difference in the corresponding population means).

Your goal in this step is to conduct a two-sample t-test. Recall the steps for conducting a hypothesis test:
1.   State the null hypothesis and the alternative hypothesis
2.   Choose a signficance level
3.   Find the p-value
4.   Reject or fail to reject the null hypothesis

$H_0$: There is no statistically significant difference in the number of views between TikTok videos posted by verified and unverified accounts.

$H_a$: There is a statistically significant difference in the number of views between TikTok videos posted by verified and unverified accounts.

You choose 5% as the significance level and proceed with a two-sample t-test.


```python
# Conduct a two-sample t-test to compare means

verified = data[data['verified_status'] == 'verified']
unverified = data[data['verified_status'] == 'not verified']

stats.ttest_ind(a=verified['video_view_count'], b=unverified['video_view_count'], equal_var=False)
```




    TtestResult(statistic=np.float64(-25.499441780633777), pvalue=np.float64(2.6088823687177823e-120), df=np.float64(1571.163074387424))



**Question:** Based on the p-value you got above, do you reject or fail to reject the null hypothesis?

The p-value is incredibly small (2.61 × 10<sup>-120</sup>) it is less than our significance level of 5% and so we **reject** the Null Hypothesis and therefore there is a statistically significant difference in the mean video view counts between verified and unverified accounts on TikTok.

<img src="Execute.png" width="100" height="100" align=left>

### <a id='toc1_2_3_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Documentto reflect on the Execute stage.

#### <a id='toc1_2_3_1_'></a>[**Task 4. Communicate insights with stakeholders**](#toc0_)

*Ask yourself the following questions:*

1. What business insight(s) can you draw from the result of your hypothesis test?

The analysis shows that there is a statistically significant difference in the average view counts between videos from verified accounts and videos from unverified accounts. This suggests there might be fundamental behavioral differences between these two groups of accounts.

It would be interesting to investigate the root cause of this behavioral difference. For example, do unverified accounts tend to post more clickbait-y videos? Or are unverified accounts associated with spam bots that help inflate view counts?

The next step will be to build a regression model on verified_status. A regression model is the natural next step because the end goal is to make predictions on claim status. A regression model for verified_status can help analyze user behavior in this group of verified users. Technical note to prepare regression model: because the data is skewed, and there is a significant difference in account types, it will be key to build a logistic regression model.
