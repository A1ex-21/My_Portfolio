# <a id='toc1_'></a>[**Exploratory Data Analysis (EDA) for Predictive Model Development**](#toc0_)

**Course 3 - Go Beyond the Numbers: Translate Data into Insights**

**TikTok Project**

**Table of contents**<a id='toc0_'></a>    
- [**Exploratory Data Analysis (EDA) for Predictive Model Development**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Orion Rainier, Data Scientist**](#toc1_1_1_)    
    - [**Email from Willow Jaffey, Data Sicentist Lead**](#toc1_1_2_)    
    - [**Data Dictionary**](#toc1_1_3_)    
    - [**Objectives**](#toc1_1_4_)    
  - [**PACE Stages**](#toc1_2_)    
    - [**PACE: Plan**](#toc1_2_1_)    
      - [**Task 1. Imports, links and loading**](#toc1_2_1_1_)    
    - [**PACE: Analyse**](#toc1_2_2_)    
      - [**Task 2a. Data Exploration and cleaning**](#toc1_2_2_1_)    
      - [**Task 2b. Assess Data Types**](#toc1_2_2_2_)    
      - [**Task 2c. Select Visualisation Type(s)**](#toc1_2_2_3_)    
    - [**PACE:Contstruct**](#toc1_2_3_)    
      - [**Task 3. Build Visualisations**](#toc1_2_3_1_)    
        - [**video_duration_sec**](#toc1_2_3_1_1_)    
        - [**video_view_count**](#toc1_2_3_1_2_)    
        - [**video_like_count**](#toc1_2_3_1_3_)    
        - [**video_comment_count**](#toc1_2_3_1_4_)    
        - [**video_share_count**](#toc1_2_3_1_5_)    
        - [**video_download_count**](#toc1_2_3_1_6_)    
        - [**Claim Status by Verification Status**](#toc1_2_3_1_7_)    
        - [**Claim Status by Author Ban Status**](#toc1_2_3_1_8_)    
        - [**Median View Counts by Ban Status**](#toc1_2_3_1_9_)    
        - [**Total Views by Claim Status**](#toc1_2_3_1_10_)    
      - [**Task 4. Determine Outliers**](#toc1_2_3_2_)    
        - [**Scatterplot**](#toc1_2_3_2_1_)    
    - [**PACE:Execute**](#toc1_2_4_)    
      - [**Task 5a. Results and Evaluation**](#toc1_2_4_1_)    
      - [**Task 5b. Conclusion**](#toc1_2_4_2_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

Your team is still in the early stages of their latest project. So far, you've completed a project proposal and used Python to inspect and organize the TikTok dataset.

You check your inbox and notice a new message from Orion Rainier, a Data Scientist at TikTok. Orion is pleased with the work you have already completed and is requesting your
assistance with some Exploratory Data Analysis (EDA) and data visualization. You also notice a follow-up email from the Data Science Lead, Willow Jaffey. Willow suggests
including an executive summary of your analysis to share with teammates.

***Note:** Team member names used in this workplace scenario project are fictional and are not representative of TikTok.*

Your TikTok data team is still in the early stages of their latest project. So far, you’ve completed a project proposal and used Python to inspect and organize the TikTok dataset.

Orion Rainier, a Data Scientist at TikTok, is pleased with the work you have already completed and is requesting your assistance with some Exploratory Data Analysis (EDA) and data visualization. The management team asked to see a Python notebook showing data structuring and cleaning, as well as any matplotlib/seaborn visualizations plotted to help us understand the data. At the very least, include a graph comparing claim counts to opinion counts, as well as boxplots of the most important variables (like “video duration,” “video like count,” “video comment count,” and “video view count”) to check for outliers. Also, include a breakdown of “author ban status” counts.

Additionally, the management team has recently asked all EDA to include Tableau visualizations. Tableau visualizations are particularly helpful in status reports to the client and board members. For this data, create a Tableau dashboard showing a simple claims versus opinions count, as well as stacked bar charts of claims versus opinions for variables like video view counts, video like counts, video share counts, and video download counts. Make sure it is easy to understand to someone who isn’t data savvy, and remember that the assistant director is a person with visual impairments.

You also notice a follow-up email from the Data Science Lead, Willow Jaffey. Willow suggests including an executive summary of your analysis to share with teammates.

A notebook was structured and prepared to help you in this project. Please complete the following questions.

### <a id='toc1_1_1_'></a>[**Email from Orion Rainier, Data Scientist**](#toc0_)

**Subject:** Tik Tok Claims Classification EDA & Vizzes

**From:** "Rainier, Orion" - orionrainier@tiktok

**CC:** "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok; "Jaffey, Willow" - willowjaffey@tiktok

Hi there,

Thanks for the amazing work you've done so far.

We're ready to perform EDA on the data. Has Rosie Mae told you what the management team expects when it comes to EDA? If not, think of it as a "show your work" kind of
report. They will want to see a Python notebook showing the structuring and cleaning you did, as well as any matplotlib/seaborn visualizations you plotted to help us
understand the data. I would suggest at the very least a graph comparing claim counts to opinion counts, as well as boxplots of the most important variables (like "video
duration," "video like count," "video comment count," and "video view count") to check for outliers. Also a breakdown of "author ban status" counts. But whatever you think
makes most sense works for us.

Additionally, the management team has recently asked all EDA to include Tableau visualizations. We've found these to be particularly helpful in status reports to the client and
board members. For this data, I suggest a Tableau dashboard showing a simple claims versus opinions count, as well as stacked bar charts of claims versus opinions for
variables like video view counts, video like counts, video share counts, and video download counts. Make sure it is easy to understand to someone who isn't data savvy, and
remember that the assistant director is a person with visual impairments. I understand you have some Tableau experience? Let me know if you need help with this.

By the way, I CC'd our Data Science Lead, Willow Jaffey, who is on the senior management team and will be reviewing and approving our analysis before the project manager
reports it back to the client. @Willow, I just want to keep you informed on the progress!

Thanks!

Orion Rainier

Data Scientist

TikTok

-

*"Big data isn't about bits, it's about talent." - Douglas Merrill*

### <a id='toc1_1_2_'></a>[**Email from Willow Jaffey, Data Sicentist Lead**](#toc0_)

**Subject:** RE: Tik Tok Claims Classification EDA & Vizzes

**From:** "Jaffey, Willow" - willowjaffey@tiktok

**CC:** "Bradshaw, Rosie Mae" - rosiemaebradshaw@tiktok; "Rainier, Orion" - orionrainier@tiktok

Thank you, Orion!

Welcome to the team, so glad to have you.

Along with the Tableau dashboard and notebook, it would be really helpful if you included an executive summary of your analysis attached via email.

Appreciate your help!

Willow Jaffey

Data Science Lead

TikTok

### <a id='toc1_1_3_'></a>[**Data Dictionary**](#toc0_)

This project uses a dataset called tiktok_dataset.csv. It contains synthetic data created for this project in partnership with TikTok. Examine each data variable gathered.

**19,383 rows** - Each row represents a different published TikTok video in which a claim/opinion has been made.

**12 columns**

| Column Name              | Type  | Description |
|--------------------------|-------|-------------|
| `#`                      | int   | TikTok assigned number for video with claim/opinion. |
| `claim_status`           | obj   | Whether the published video has been identified as an “opinion” or a “claim.” An “opinion” refers to an individual’s or group’s personal belief or thought. A “claim” refers to information that is either unsourced or from an unverified source. |
| `video_id`               | int   | Random identifying number assigned to video upon publication on TikTok. |
| `video_duration_sec`     | int   | How long the published video is measured in seconds. |
| `video_transcription_text` | obj | Transcribed text of the words spoken in the published video. |
| `verified_status`        | obj   | Indicates the status of the TikTok user who published the video in terms of their verification, either “verified” or “not verified.” |
| `author_ban_status`      | obj   | Indicates the status of the TikTok user who published the video in terms of their permissions: “active,” “under scrutiny,” or “banned.” |
| `video_view_count`       | float | The total number of times the published video has been viewed. |
| `video_like_count`       | float | The total number of times the published video has been liked by other users. |
| `video_share_count`      | float | The total number of times the published video has been shared by other users. |
| `video_download_count`   | float | The total number of times the published video has been downloaded by other users. |
| `video_comment_count`    | float | The total number of comments on the published video. |


### <a id='toc1_1_4_'></a>[**Objectives**](#toc0_)

**The Purpose:** of this project is to conduct exploratory data analysis on a provided data set. Your mission is to continue the investigation you began in C2 and perform further EDA on this data with the aim of learning more about the variables. Of particular interest is information related to what distinguishes claim videos from opinion videos.

**The Goal:** is to explore the dataset and create visualizations.


<img src="Pace.png" width="100" height="100" align=left>

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

<img src="Plan.png" width="100" height="100" align=left>

### <a id='toc1_2_1_'></a>[**PACE: Plan**](#toc0_)

Consider the questions in your PACE Strategy Document and those below where applicable to craft your response:

1. Identify any outliers:

* What methods are best for identifying outliers?

Using NumPy function to investigate the `mean()` and `median()` of the data and so understand the range of data values. Can also use a boxplot to visualise the distribution of the data.

* How do you make the decision to keep or exclude outliers from any future models?

There are three main options for dealing with outliers which are keeping them as they are, deleting them or reassigning them. These decisions are made on a dataset-by-dataset basis, based on what the goals are for the model that you are planning to construct.

* **Delete them:** If you are certian that the outliers are mistakes, typos or errors and the dataset will be used for modelling or machine learning, then it is most likely going to be decided to delete the outliers. This is the option that would be used the least.
* **Reassign them:** If the dataset is small and the data will be used for modelling or machine learning, then it is most likely that new values would be derived to replace outliers.
* **Leave them:** For a dataset that is just going to be used for EDA/analysis and nothing else or for preparing for a model that is resistant to outliers, it is most likely that the outliers would be left in.


#### <a id='toc1_2_1_1_'></a>[**Task 1. Imports, links and loading**](#toc0_)

Go to Tableau Public
The following link will help you complete this activity. Keep Tableau Public open as you proceed to the next steps.

Link to supporting materials:
Public Tableau: https://public.tableau.com/s/

For EDA of the data, import the packages that would be most helpful, such as `pandas`, `numpy`, `matplotlib.pyplot`, and `seaborn`.


```python
# Import packages for data manipulation
import pandas as pd
import numpy as np

# Import packages for data visualisation
from matplotlib import pyplot as plt
import seaborn as sns
```

Then, load the dataset into a dataframe. Read in the data and store it as a dataframe object.


```python
# Load dataset into dataframe
data = pd.read_csv("tiktok_dataset (1).csv")
```

<img src="Analyze.png" width="100" height="100" align=left>

### <a id='toc1_2_2_'></a>[**PACE: Analyse**](#toc0_)

Consider the questions in your PACE Strategy Document and those below where applicable to complete your code.

#### <a id='toc1_2_2_1_'></a>[**Task 2a. Data Exploration and cleaning**](#toc0_)

The first step is to assess your data. Check the Data Source page on Tableau Public to get a sense of the size, shape and makeup of the data set.

Consider functions that help you understand and structure the data.

*    `.head()`
*    `.info()`
*    `.describe()`
*    `.groupby()`
*    `.sort_values()`

Consider the following questions as you work:

What do you do about missing data (if any)?

Are there data outliers?

Find these answers later in the notebook.

Start by discovering, using `.head()`, `.size`, and `.shape`.


```python
# Display and examine the first few rows of the dataframe
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
# Get the size of the data
data.size
```




    232584




```python
# Get the shape of the data
data.shape
```




    (19382, 12)



Get basic information about the data, using `.info()`.


```python
# Get basic information about the data
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
    

Generate a table of descriptive statistics, using `.describe()`.


```python
# Generate a table of descriptive statistics
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



#### <a id='toc1_2_2_2_'></a>[**Task 2b. Assess Data Types**](#toc0_)

In Tableau, staying on the data source page, double check the data types of the columns in the dataset. Refer to the dimensions and measures in Tableau.

#### <a id='toc1_2_2_3_'></a>[**Task 2c. Select Visualisation Type(s)**](#toc0_)

Select data visualization types that will help you understand and explain the data.

Now that you know which data columns you’ll use, it is time to decide which data visualization makes the most sense for EDA of the TikTok dataset. What type of data visualization(s) would be most helpful? Consider the distribution of the data.

* Line graph
* Bar chart
* Box plot
* Histogram
* Heat map
* Scatter plot
* A geographic map


The visualisations that will be most helpful for considering the distribution of the data are Boxplots and Histograms. Visualising the distribution of the data can inform the next steps and considerations in data analysis.

<img src="Construct.png" width="100" height="100" align=left>

### <a id='toc1_2_3_'></a>[**PACE:Contstruct**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Construct stage.

#### <a id='toc1_2_3_1_'></a>[**Task 3. Build Visualisations**](#toc0_)

Now that you have assessed your data, it’s time to plot your visualization(s).

##### <a id='toc1_2_3_1_1_'></a>[**video_duration_sec**](#toc0_)

Create a box plot to examine the spread of values in the `video_duration_sec` column.


```python
# Create a boxplot to visualize distribution of `video_duration_sec`
plt.figure(figsize=(5,1))
sns.boxplot(x=data['video_duration_sec'])
plt.title('video_duration_sec')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_45_0.png)
    


Create a histogram of the values in the `video_duration_sec` column to further explore the distribution of this variable.


```python
# Create a histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_duration_sec'], binrange=(5, 60), binwidth=5, color='#4285F4', alpha=1)
ax.set_xticks(range(0, 61, 5))
plt.title('Video duration histogram')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_47_0.png)
    


**Question:** What do you notice about the duration and distribution of the videos?

That all the videos are 5-60 seconds in length and that the histogram is uniform with a flat distribution, thereby indicating that all the data points are evenly distributed.

##### <a id='toc1_2_3_1_2_'></a>[**video_view_count**](#toc0_)

Create a box plot to examine the spread of values in the `video_view_count` column.


```python
# Create a boxplot to visualize distribution of `video_view_count`
plt.figure(figsize=(5, 1))
sns.boxplot(x=data['video_view_count'])
plt.title('video_view_count')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_52_0.png)
    


Create a histogram of the values in the `video_view_count` column to further explore the distribution of this variable.


```python
# Create a histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_view_count'], bins=range(0,(10**6+1),10**5), color='#4285F4', alpha=1)
plt.title('Video view count histogram')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_54_0.png)
    


**Question:** What do you notice about the distribution of this variable?

From what I can tell about the right sweked histogram, it inidcates that there are more data points on the left side of the histogram. Thereby indicating that few videos have significantly more views than most of the videos, with more than half of the videos recieving fewer than 100,000 views.

##### <a id='toc1_2_3_1_3_'></a>[**video_like_count**](#toc0_)

Create a box plot to examine the spread of values in the `video_like_count` column.


```python
# Create a boxplot to visualize distribution of `video_like_count`
plt.figure(figsize=(10, 1))
box = sns.boxplot(x = data['video_like_count'])
plt.title('video_like_count')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_59_0.png)
    


Create a histogram of the values in the `video_like_count` column to further explore the distribution of this variable.


```python
# Create a Histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_like_count'], bins=range(0,(7*10**5+1),10**5), color = '#4285F4', alpha = 1)
labels = [0] + [str(i) + 'k' for i in range(100, 701, 100)]
ax.set_xticks(range(0,7*10**5+1,10**5), labels=labels)
plt.title('Video like count histogram');
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_61_0.png)
    


**Question:** What do you notice about the distribution of this variable?

The right skewed Histogram shows that there are more data points on the left side of the histogram. Therefore indicating that the only a few of the videos have a lot of likes compared to the majority of videos in the dataset, due to the vast amount of data points in the smaller `video_like_count` bin.

##### <a id='toc1_2_3_1_4_'></a>[**video_comment_count**](#toc0_)

Create a box plot to examine the spread of values in the `video_comment_count` column.


```python
# Create a boxplot to visualize distribution of `video_comment_count`
plt.figure(figsize=(5,1))
sns.boxplot(x=data['video_comment_count'])
plt.title('video_comment_count')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_66_0.png)
    


Create a histogram of the values in the `video_comment_count` column to further explore the distribution of this variable.


```python
# Create a histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_comment_count'], binrange = (0, 3001), binwidth = 100, color = '#4285F4', alpha = 1)
plt.title('Video comment count histogram');
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_68_0.png)
    


**Question:** What do you notice about the distribution of this variable?

This right skewed histogram shows that there more data points on the left side of the histogram. This indicates that the majority of the videos in the dataset have very fewer than 100 comments on them, and that only a few amount of videos in comparion have a huge amount of comments on them.

##### <a id='toc1_2_3_1_5_'></a>[**video_share_count**](#toc0_)

Create a box plot to examine the spread of values in the `video_share_count` column.


```python
# Create a boxplot to visualize distribution of `video_share_count`
plt.figure(figsize=(5,1))
sns.boxplot(x=data['video_share_count'])
plt.title('video_share_count')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_73_0.png)
    


Create a histogram of the values in the `video_share_count` column to further explore the distribution of this variable.


```python
# Create a histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_share_count'], binrange = (0, 256130), binwidth = 10000, color = '#4285F4', alpha = 1)
plt.title('Video share count Histogram')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_75_0.png)
    


**Question:** What do you notice about the distribution of this variable?

That this histogram is a right-skewed histogram therefore indicating that it has more data points on the left side of the histogram. This also indicates that there is very few videos with a high video share count in comparison to the majority of videos in the dataset which had fewer than 10,000 shares.

##### <a id='toc1_2_3_1_6_'></a>[**video_download_count**](#toc0_)

Create a box plot to examine the spread of values in the `video_download_count` column.


```python
# Create a boxplot to visualize distribution of `video_download_count`
plt.figure(figsize=(5,1))
sns.boxplot(x=data['video_download_count'])
plt.title('video_download_count')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_80_0.png)
    


Create a histogram of the values in the `video_download_count` column to further explore the distribution of this variable.


```python
# Create a histogram
plt.figure(figsize=(5,3))
ax = sns.histplot(data['video_download_count'], binrange = (0, 14994), binwidth = 500, color = '#4285F4', alpha = 1)
plt.title('Video download count Histogram')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_82_0.png)
    


**Question:** What do you notice about the distribution of this variable?

That this histogram is right-skewed and that the majority of the videos in the dataset have very few downloads and that only a few videos in the dataset have a high number of downloads. The majority of videos were downloaded fewer than 500 times but some were downloaded over 12,000 times.

##### <a id='toc1_2_3_1_7_'></a>[**Claim Status by Verification Status**](#toc0_)

Now, create a histogram with four bars: one for each combination of claim status and verification status.


```python
plt.figure(figsize=(7,4))
ax = sns.histplot(data=data,
             x='claim_status',
             hue='verified_status',
             multiple='dodge',
             shrink=0.9)
plt.xlabel('Claim Status')
plt.ylabel('Count')
plt.title('Claims by verification status histogram')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_87_0.png)
    


**Question:** What do you notice about the number of verified users compared to unverified? And how does that affect their likelihood to post opinions?

That there is a small amount of verified users for both claims and opinions and there is a huge amount of claims and opinions for unverified users and if a user is verified they are much more likely to post opinions.

##### <a id='toc1_2_3_1_8_'></a>[**Claim Status by Author Ban Status**](#toc0_)

The previous course used a `groupby()` statement to examine the count of each claim status for each author ban status. Now, use a histogram to communicate the same information.


```python
# Create a histogram
fig = plt.figure(figsize=(7,4))
ax = sns.histplot(data, x='claim_status', hue='author_ban_status',
             multiple='dodge',
             hue_order=['active', 'under review', 'banned'],
             shrink=0.9,
             palette={'active':'green', 'under review':'orange', 'banned':'red'},
             alpha=0.5)
plt.xlabel('Claim Status')
plt.ylabel('Count')
plt.title('Claim status by author ban status - counts')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_92_0.png)
    


**Question:** What do you notice about the number of active authors compared to banned authors for both claims and opinions?

For both claims and opinions, there are many more active authors than banned authors or authors under review, however the proportion of active authors is far greater for opinion videos than for claim videos. Again, it seems that authors who post claim videos are more likely to come under review and/or get banned.

##### <a id='toc1_2_3_1_9_'></a>[**Median View Counts by Ban Status**](#toc0_)

Create a bar plot with three bars: one for each author ban status. The height of each bar should correspond with the median number of views for all videos with that author ban status.


```python
# Create a bar plot
ban_status_counts = data.groupby(['author_ban_status']).median(
    numeric_only=True).reset_index()

fig = plt.figure(figsize=(5,3))
sns.barplot(data=ban_status_counts,
            x='author_ban_status',
            y='video_view_count',
            order=['active', 'under review', 'banned'],
            palette={'active':'green', 'under review':'orange', 'banned':'red'},
            alpha=0.5)
plt.xlabel('Author Ban Status')
plt.ylabel('Video View Count')
plt.title('Median View Count by Ban Status')
plt.show();
```

    C:\Users\alexa\AppData\Local\Temp\ipykernel_34160\2777352134.py:6: FutureWarning: 
    
    Passing `palette` without assigning `hue` is deprecated and will be removed in v0.14.0. Assign the `x` variable to `hue` and set `legend=False` for the same effect.
    
      sns.barplot(data=ban_status_counts,
    


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_97_1.png)
    


**Question:** What do you notice about the median view counts for non-active authors compared to that of active authors? Based on that insight, what variable might be a good indicator of claim status?

The median view counts for non-active authors are many times greater than the median view count for active authors. Since we know that non-active authors are more likely to post claims, and that videos by non-active authors get far more views on aggregate than videos by active authors, then `video_view_count` might be a good indicator of claim status. Indeed, a quick check of the median view count by claim status bears out this assessment


```python
median_view_by_claim_status = data.groupby(['claim_status'])[['video_view_count']].median().reset_index()
```


```python
median_view_by_claim_status
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
      <th>video_view_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>claim</td>
      <td>501555.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>opinion</td>
      <td>4953.0</td>
    </tr>
  </tbody>
</table>
</div>



##### <a id='toc1_2_3_1_10_'></a>[**Total Views by Claim Status**](#toc0_)

Create a pie graph that depicts the proportions of total views for claim videos and total views for opinion videos.


```python
fig = plt.figure(figsize=(3,3))
plt.pie(data.groupby('claim_status')['video_view_count'].sum(), labels=['claim', 'opinion'])
plt.title('Total views by video claim status')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_104_0.png)
    


**Question:** What do you notice about the overall view count for claim status?

The overall view count is overwhelmingly higher for claim videos compared to opinion videos. Claim videos account for 99% of total views, while opinion videos make up only about 1%.

This therefore suggests that claim videos tend to attract significantly more attention and engagement from viewers. It may indicate that content percieved as factual or controversial (even if unverified) is more widely shared and viewd than personal opinions.

#### <a id='toc1_2_3_2_'></a>[**Task 4. Determine Outliers**](#toc0_)

When building predictive models, the presence of outliers can be problematic. For example, if you were trying to predict the view count of a particular video, videos with extremely high view counts might introduce bias to a model. Also, some outliers might indicate problems with how data was captured or recorded.

The ultimate objective of the TikTok project is to build a model that predicts whether a video is a claim or opinion. The analysis you've performed indicates that a video's engagement level is strongly correlated with its claim status. There's no reason to believe that any of the values in the TikTok data are erroneously captured, and they align with expectation of how social media works: a very small proportion of videos get super high engagement levels. That's the nature of viral content.

Nonetheless, it's good practice to get a sense of just how many of your data points could be considered outliers. The definition of an outlier can change based on the details of your project, and it helps to have domain expertise to decide a threshold. You've learned that a common way to determine outliers in a normal distribution is to calculate the interquartile range (IQR) and set a threshold that is 1.5 * IQR above the 3rd quartile.

In this TikTok dataset, the values for the count variables are not normally distributed. They are heavily skewed to the right. One way of modifying the outlier threshold is by calculating the **median** value for each variable and then adding 1.5 * IQR. This results in a threshold that is, in this case, much lower than it would be if you used the 3rd quartile.

Write a for loop that iterates over the column names of each count variable. For each iteration:
1. Calculate the IQR of the column
2. Calculate the median of the column
3. Calculate the outlier threshold (median + 1.5 * IQR)
4. Calculate the numer of videos with a count in that column that exceeds the outlier threshold
5. Print "Number of outliers, {column name}: {outlier count}"

```
Example:
Number of outliers, video_view_count: ___
Number of outliers, video_like_count: ___
Number of outliers, video_share_count: ___
Number of outliers, video_download_count: ___
Number of outliers, video_comment_count: ___
```


```python
columns = [
    'video_view_count',
    'video_like_count',
    'video_share_count',
    'video_download_count',
    'video_comment_count'
]
for col in columns:
    percentile25 = data[col].quantile(0.25)
    percentile75 = data[col].quantile(0.75)
    iqr = percentile75 - percentile25
    median = data[col].median()
    outlier_threshold = median + 1.5*iqr
    count = (data[col] > outlier_threshold).sum()
    print(f"Number of outliers, {col}: {count}")
```

    Number of outliers, video_view_count: 2343
    Number of outliers, video_like_count: 3468
    Number of outliers, video_share_count: 3732
    Number of outliers, video_download_count: 3733
    Number of outliers, video_comment_count: 3882
    

##### <a id='toc1_2_3_2_1_'></a>[**Scatterplot**](#toc0_)


```python
# Create a scatterplot of `video_view_count` versus `video_like_count` according to 'claim_status'
sns.scatterplot(data = data,
               x = 'video_view_count',
               y = 'video_like_count',
               hue = 'claim_status',
               s = 10,
               alpha = 0.6)
plt.xlabel('Video View Count')
plt.ylabel('Video Like Count')
plt.legend(title = 'Claim Status')
plt.title('Video View Count vs Video Like Count by Claim Status')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_111_0.png)
    



```python
# Create a scatterplot of `video_view_count` versus `video_like_count` for opinions only
mask = data['claim_status'] == 'opinion'
opinion_data = data[mask]

sns.scatterplot(data = opinion_data,
               x = 'video_view_count',
               y = 'video_like_count',
               s = 10,
               alpha = 0.3)
plt.xlabel('Video View Count')
plt.ylabel('Video Like Count')
plt.title('Video View Count vs Video Like Count for opinions only')
plt.show();
```


    
![png](TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_files/TikTok_Exploratory_Data_Analysis_for_Predictive_Model_Development_112_0.png)
    


<img src="Execute.png" width="100" height="100" align=left>

### <a id='toc1_2_4_'></a>[**PACE:Execute**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

#### <a id='toc1_2_4_1_'></a>[**Task 5a. Results and Evaluation**](#toc0_)

Having built visualizations in Tableau and in Python, what have you learned about the dataset? What other questions have your visualizations uncovered that you should pursue?

***Pro tip:*** Put yourself in your client's perspective, what would they want to know?

Use the following code cells to pursue any additional EDA. Also use the space to make sure your visualizations are clean, easily understandable, and accessible.

***Ask yourself:*** Did you consider color, contrast, emphasis, and labeling?

==> ENTER YOUR RESPONSE HERE
I have learned ....

Through EDA using Python and Tableau, I found that the vast majority of video views come from content labeled as "claims" rather than "opinions", even though both are present in the dataset. The median view counts are significatnly higher for authors who are either "under-review" or "banned", suggesting that controversial or rule-breaking content tends to gain more traction. Visualisations like scatter plots and box plots revealed a strong positive correlation between video views and likes, and the distribution of those variables is highly right-skewed, requiring special outlier handling using the median + 1.5 * IQR method.

My other questions are ....

* Why do claim videos generate more views? Are they inherently more engaging or are they promoted more by the algorithm?
* Are banned or under-review accounts more likely to post claims than opinions?
* Could we use features like video duration or engagement ratios (likes/views, comments/views) to predict claim status?
* What distincitve characteristics that apply only to claims or only to opinions?
* What other variables will be helpful in understanding the data?

My client would likely want to know ...

* What makes a video more likely to go viral (e.g. certain claim characteristics)?
* How early can we detect content that might result in a ban or high view count based on trends in the data?
* What content types should be monitored more closely based on view spikes and engagement behaviour?
* What are the assumptions regarding what data might be predictive of claim_status?

#### <a id='toc1_2_4_2_'></a>[**Task 5b. Conclusion**](#toc0_)

*Make it professional and presentable*

You have visualized the data you need to share with the director now. Remember, the goal of a data visualization is for an audience member to glean the information on the chart in mere seconds.

*Questions to ask yourself for reflection:*
Why is it important to conduct Exploratory Data Analysis? What other visuals could you create?

EDA is important because ...

It helps a Data Professional to get to know the data, understand its outliers, uncover patterns, clean its missing values, prepare it for future modelling and identify relationships in the data that inform business decisions.

Visualizations helped me understand ..

That we wil need to make decisions on certain considerations prior to designing a model. (for example, what to do with outliers, duplicate values or missing data)

Visualisations also helped me understand that claim videos recieve far more views and likes than opinion videos, and that banned or reviewed accounts often show unusually high engagement. They also recieve strong correlations and skewed distributions that required adjusted outlier detection.

You’ve now completed a professional data visualization according to a business need. Well done! Be sure to save your work as a reference for later work in Tableau.
