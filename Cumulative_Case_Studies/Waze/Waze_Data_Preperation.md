# <a id='toc1_'></a>[**Waze_Data_Exploration**](#toc0_)
**Course 2 - Get Started with Python**

**Table of contents**<a id='toc0_'></a>    
- [**Waze_Data_Exploration**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from May Santer, Data Analysis Manager**](#toc1_1_1_)    
    - [**Email from Chidi Ga, Senior Data Analyst**](#toc1_1_2_)    
    - [**Data Dictionary**](#toc1_1_3_)    
    - [**Objectives**](#toc1_1_4_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE:Plan**](#toc1_3_)    
    - [**Task 1. Understand the situation**](#toc1_3_1_)    
  - [**PACE: Analyze**](#toc1_4_)    
    - [**Task 2a. Imports and data loading**](#toc1_4_1_)    
    - [**Task 2b. Summary information**](#toc1_4_2_)    
    - [**Task 2c. Null values and summary statistics**](#toc1_4_3_)    
    - [**Task 2d. Null values - device counts**](#toc1_4_4_)    
  - [**PACE: Construct**](#toc1_5_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Task 3. Conclusion**](#toc1_6_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

Your team is still in the early stages of their project to develop a machine learning model to predict user churn.

Previously, you were asked to complete a project proposal by your supervisor, May Santner. Now, you have received notice that your project proposal has been approved
and your team has been given access to Waze's user data. To get clear insights, the data must be inspected, organized, and prepared for analysis.

You discover two new emails in your inbox: one from May Santner, and one from your teammate, Chidi Ga. In the email, May asks for your help reviewing the data and
completing a code notebook, and Chidi shares the details of the notebook. Review the emails, then follow the provided instructions to complete the PACE strategy
document, the code notebook, and the executive summary.

### <a id='toc1_1_1_'></a>[**Email from May Santer, Data Analysis Manager**](#toc0_)

**Subject:** Help with coding notebook?

**From:** "May Santner," May@waze

**Cc:** "Chidi Ga," Chidi@waze

Good Morning!

I have a couple of updates on the user churn project. First off, the project proposal you completed has been approved. Thanks for all your great work so far. Second, I just
received an email from our Senior Project Manager, Sylvester Esperanza, that our team has been given access to the Waze user data.

Before we begin the process of exploratory data analysis (EDA), we could really use your help with coding and prepping the data. During your interview, you mentioned that
you worked with Python in your Google certificate program. You can draw on your Python skills for this task.

Chidi Ga (cc'd above) started a Jupyter notebook with the relevant dataset (imported). Right now, Chidi is busy finishing up a previous project. I'm sure he could use your
assistance in completing the coding and setting up the notebook for the user churn project.

Chidi, do you mind sharing the details?

Best,

May Santner

Data Analysis Manager

Waze

### <a id='toc1_1_2_'></a>[**Email from Chidi Ga, Senior Data Analyst**](#toc0_)

**Subject:** RE: Help with coding notebook?

**From:** "Chidi Ga," Chidi@waze

**Cc:** "May Santner," May@waze

Nice to meet you (virtually)!

Hope you've enjoyed your first few weeks at Waze!

The project proposal you helped prepare covered the major points of this project, so I'll get right to how you can assist the team. Right now, a number of us are busy making
adjustments to the machine learning model for another project, so your help is greatly appreciated!

Until we finish our previous project, there is no need to do a full EDA on our new user data. We'll get to that soon. Meanwhile, do you mind reviewing the imported data for
the team? It would be fantastic if you could include a summary of the data types for each variable, where missing values exist in the data, key descriptive statistics, and
anything else code-related you think is worth sharing in the notebook. I haven't had a chance to explore the data, so I really appreciate you getting an early start on this.

Thanks,

Chidi Ga

Senior Data Analyst

Waze

### <a id='toc1_1_3_'></a>[**Data Dictionary**](#toc0_)

**Waze dataset overview**

This project uses a dataset called `waze_dataset.csv`. It contains synthetic data created for this project in partnership with Waze. Examine each data variable gathered.

This dataset contains:

**14,999 rows** - each row represents one unique user

**13 columns**

| Column name                 | Type  | Description                                                                 |
|----------------------------|-------|-----------------------------------------------------------------------------|
| ID                         | int   | A sequential numbered index                                                 |
| label                      | obj   | Binary target variable (“retained” vs “churned”) indicating user churn status during the month |
| sessions                   | int   | Number of times a user opened the app during the month                      |
| drives                     | int   | Number of occurrences where a user drove at least 1 km during the month    |
| device                     | obj   | Type of device used to start a session (e.g., Android or iPhone)            |
| total_sessions             | float | Model-estimated total number of sessions since the user onboarded           |
| n_days_after_onboarding    | int   | Number of days since the user signed up for the app                          |
| total_navigations_fav1     | int   | Total navigations since onboarding to the user’s favorite location 1        |
| total_navigations_fav2     | int   | Total navigations since onboarding to the user’s favorite location 2        |
| driven_km_drives           | float | Total kilometers driven during the month                                    |
| duration_minutes_drives    | float | Total duration driven (in minutes) during the month                         |
| activity_days              | int   | Number of days the user opened the app during the month                     |
| driving_days               | int   | Number of days the user drove at least 1 km during the month                |


### <a id='toc1_1_4_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to investigate and understand the data provided.

**The goal** is to use a dataframe contructed within Python, perform a cursory inspection of the provided dataset, and inform team members of your findings.

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework, PACE. The following notebook components are labeled with the respective PACE stages: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE:Plan**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:

### <a id='toc1_3_1_'></a>[**Task 1. Understand the situation**](#toc0_)

*   How can you best prepare to understand and organize the provided driver data?


*Begin by exploring your dataset and consider reviewing the Data Dictionary.*

By exploring the data and preparing it for EDA.

## <a id='toc1_4_'></a>[**PACE: Analyze**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

### <a id='toc1_4_1_'></a>[**Task 2a. Imports and data loading**](#toc0_)

Start by importing the packages that you will need to load and explore the dataset. Make sure to use the following import statements:

*   `import pandas as pd`

*   `import numpy as np`



```python
# Import packages for data manipulation

import pandas as pd
import numpy as np
```

Then, load the dataset into a dataframe. Creating a dataframe will help you conduct data manipulation, exploratory data analysis (EDA), and statistical activities.

**Note:** As shown in this cell, the dataset has been automatically loaded in for you. You do not need to download the .csv file, or provide more code, in order to access the dataset and proceed with this lab. Please continue with this activity by completing the following instructions.


```python
# Load dataset into dataframe
df = pd.read_csv('waze_dataset.csv')
```

### <a id='toc1_4_2_'></a>[**Task 2b. Summary information**](#toc0_)

View and inspect summary information about the dataframe by **coding the following:**

1.   df.head(10)
2.   df.info()

*Consider the following questions:*

1. When reviewing the `df.head()` output, are there any variables that have missing values?

2. When reviewing the `df.info()` output, what are the data types? How many rows and columns do you have?

3. Does the dataset have any missing values?


```python
df.head(10)
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
      <th>ID</th>
      <th>label</th>
      <th>sessions</th>
      <th>drives</th>
      <th>total_sessions</th>
      <th>n_days_after_onboarding</th>
      <th>total_navigations_fav1</th>
      <th>total_navigations_fav2</th>
      <th>driven_km_drives</th>
      <th>duration_minutes_drives</th>
      <th>activity_days</th>
      <th>driving_days</th>
      <th>device</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>retained</td>
      <td>283</td>
      <td>226</td>
      <td>296.748273</td>
      <td>2276</td>
      <td>208</td>
      <td>0</td>
      <td>2628.845068</td>
      <td>1985.775061</td>
      <td>28</td>
      <td>19</td>
      <td>Android</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>retained</td>
      <td>133</td>
      <td>107</td>
      <td>326.896596</td>
      <td>1225</td>
      <td>19</td>
      <td>64</td>
      <td>13715.920550</td>
      <td>3160.472914</td>
      <td>13</td>
      <td>11</td>
      <td>iPhone</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>retained</td>
      <td>114</td>
      <td>95</td>
      <td>135.522926</td>
      <td>2651</td>
      <td>0</td>
      <td>0</td>
      <td>3059.148818</td>
      <td>1610.735904</td>
      <td>14</td>
      <td>8</td>
      <td>Android</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>retained</td>
      <td>49</td>
      <td>40</td>
      <td>67.589221</td>
      <td>15</td>
      <td>322</td>
      <td>7</td>
      <td>913.591123</td>
      <td>587.196542</td>
      <td>7</td>
      <td>3</td>
      <td>iPhone</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>retained</td>
      <td>84</td>
      <td>68</td>
      <td>168.247020</td>
      <td>1562</td>
      <td>166</td>
      <td>5</td>
      <td>3950.202008</td>
      <td>1219.555924</td>
      <td>27</td>
      <td>18</td>
      <td>Android</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>retained</td>
      <td>113</td>
      <td>103</td>
      <td>279.544437</td>
      <td>2637</td>
      <td>0</td>
      <td>0</td>
      <td>901.238699</td>
      <td>439.101397</td>
      <td>15</td>
      <td>11</td>
      <td>iPhone</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>retained</td>
      <td>3</td>
      <td>2</td>
      <td>236.725314</td>
      <td>360</td>
      <td>185</td>
      <td>18</td>
      <td>5249.172828</td>
      <td>726.577205</td>
      <td>28</td>
      <td>23</td>
      <td>iPhone</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>retained</td>
      <td>39</td>
      <td>35</td>
      <td>176.072845</td>
      <td>2999</td>
      <td>0</td>
      <td>0</td>
      <td>7892.052468</td>
      <td>2466.981741</td>
      <td>22</td>
      <td>20</td>
      <td>iPhone</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>retained</td>
      <td>57</td>
      <td>46</td>
      <td>183.532018</td>
      <td>424</td>
      <td>0</td>
      <td>26</td>
      <td>2651.709764</td>
      <td>1594.342984</td>
      <td>25</td>
      <td>20</td>
      <td>Android</td>
    </tr>
    <tr>
      <th>9</th>
      <td>9</td>
      <td>churned</td>
      <td>84</td>
      <td>68</td>
      <td>244.802115</td>
      <td>2997</td>
      <td>72</td>
      <td>0</td>
      <td>6043.460295</td>
      <td>2341.838528</td>
      <td>7</td>
      <td>3</td>
      <td>iPhone</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 14999 entries, 0 to 14998
    Data columns (total 13 columns):
     #   Column                   Non-Null Count  Dtype  
    ---  ------                   --------------  -----  
     0   ID                       14999 non-null  int64  
     1   label                    14299 non-null  object 
     2   sessions                 14999 non-null  int64  
     3   drives                   14999 non-null  int64  
     4   total_sessions           14999 non-null  float64
     5   n_days_after_onboarding  14999 non-null  int64  
     6   total_navigations_fav1   14999 non-null  int64  
     7   total_navigations_fav2   14999 non-null  int64  
     8   driven_km_drives         14999 non-null  float64
     9   duration_minutes_drives  14999 non-null  float64
     10  activity_days            14999 non-null  int64  
     11  driving_days             14999 non-null  int64  
     12  device                   14999 non-null  object 
    dtypes: float64(3), int64(8), object(2)
    memory usage: 1.5+ MB
    

**Answer**
1. When reviewing the output from the `.head(10)` there is no visible missing values.
2. When reviewing the output from the `.info()` the data types are integer, objects and floats, and there are 13 columns and 14,999 rows.
3. Yes, the `label` column is missing 700 values.

### <a id='toc1_4_3_'></a>[**Task 2c. Null values and summary statistics**](#toc0_)

Compare the summary statistics of the 700 rows that are missing labels with summary statistics of the rows that are not missing any values.

**Question:** Is there a discernible difference between the two populations?



```python
# Isolate rows with null values
df_null = df[df['label'].isnull()]

# Display summary stats of rows with null values
df_null.describe()

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
      <th>ID</th>
      <th>sessions</th>
      <th>drives</th>
      <th>total_sessions</th>
      <th>n_days_after_onboarding</th>
      <th>total_navigations_fav1</th>
      <th>total_navigations_fav2</th>
      <th>driven_km_drives</th>
      <th>duration_minutes_drives</th>
      <th>activity_days</th>
      <th>driving_days</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
      <td>700.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>7405.584286</td>
      <td>80.837143</td>
      <td>67.798571</td>
      <td>198.483348</td>
      <td>1709.295714</td>
      <td>118.717143</td>
      <td>30.371429</td>
      <td>3935.967029</td>
      <td>1795.123358</td>
      <td>15.382857</td>
      <td>12.125714</td>
    </tr>
    <tr>
      <th>std</th>
      <td>4306.900234</td>
      <td>79.987440</td>
      <td>65.271926</td>
      <td>140.561715</td>
      <td>1005.306562</td>
      <td>156.308140</td>
      <td>46.306984</td>
      <td>2443.107121</td>
      <td>1419.242246</td>
      <td>8.772714</td>
      <td>7.626373</td>
    </tr>
    <tr>
      <th>min</th>
      <td>77.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>5.582648</td>
      <td>16.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>290.119811</td>
      <td>66.588493</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>3744.500000</td>
      <td>23.000000</td>
      <td>20.000000</td>
      <td>94.056340</td>
      <td>869.000000</td>
      <td>4.000000</td>
      <td>0.000000</td>
      <td>2119.344818</td>
      <td>779.009271</td>
      <td>8.000000</td>
      <td>6.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>7443.000000</td>
      <td>56.000000</td>
      <td>47.500000</td>
      <td>177.255925</td>
      <td>1650.500000</td>
      <td>62.500000</td>
      <td>10.000000</td>
      <td>3421.156721</td>
      <td>1414.966279</td>
      <td>15.000000</td>
      <td>12.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>11007.000000</td>
      <td>112.250000</td>
      <td>94.000000</td>
      <td>266.058022</td>
      <td>2508.750000</td>
      <td>169.250000</td>
      <td>43.000000</td>
      <td>5166.097373</td>
      <td>2443.955404</td>
      <td>23.000000</td>
      <td>18.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>14993.000000</td>
      <td>556.000000</td>
      <td>445.000000</td>
      <td>1076.879741</td>
      <td>3498.000000</td>
      <td>1096.000000</td>
      <td>352.000000</td>
      <td>15135.391280</td>
      <td>9746.253023</td>
      <td>31.000000</td>
      <td>30.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Isolate rows without null values
df_1 = df[~df['label'].isnull()]

# Display summary stats of rows without null values
df_1.describe()
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
      <th>ID</th>
      <th>sessions</th>
      <th>drives</th>
      <th>total_sessions</th>
      <th>n_days_after_onboarding</th>
      <th>total_navigations_fav1</th>
      <th>total_navigations_fav2</th>
      <th>driven_km_drives</th>
      <th>duration_minutes_drives</th>
      <th>activity_days</th>
      <th>driving_days</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
      <td>14299.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>7503.573117</td>
      <td>80.623820</td>
      <td>67.255822</td>
      <td>189.547409</td>
      <td>1751.822505</td>
      <td>121.747395</td>
      <td>29.638296</td>
      <td>4044.401535</td>
      <td>1864.199794</td>
      <td>15.544653</td>
      <td>12.182530</td>
    </tr>
    <tr>
      <th>std</th>
      <td>4331.207621</td>
      <td>80.736502</td>
      <td>65.947295</td>
      <td>136.189764</td>
      <td>1008.663834</td>
      <td>147.713428</td>
      <td>45.350890</td>
      <td>2504.977970</td>
      <td>1448.005047</td>
      <td>9.016088</td>
      <td>7.833835</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.220211</td>
      <td>4.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>60.441250</td>
      <td>18.282082</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>3749.500000</td>
      <td>23.000000</td>
      <td>20.000000</td>
      <td>90.457733</td>
      <td>878.500000</td>
      <td>10.000000</td>
      <td>0.000000</td>
      <td>2217.319909</td>
      <td>840.181344</td>
      <td>8.000000</td>
      <td>5.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>7504.000000</td>
      <td>56.000000</td>
      <td>48.000000</td>
      <td>158.718571</td>
      <td>1749.000000</td>
      <td>71.000000</td>
      <td>9.000000</td>
      <td>3496.545617</td>
      <td>1479.394387</td>
      <td>16.000000</td>
      <td>12.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>11257.500000</td>
      <td>111.000000</td>
      <td>93.000000</td>
      <td>253.540450</td>
      <td>2627.500000</td>
      <td>178.000000</td>
      <td>43.000000</td>
      <td>5299.972162</td>
      <td>2466.928876</td>
      <td>23.000000</td>
      <td>19.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>14998.000000</td>
      <td>743.000000</td>
      <td>596.000000</td>
      <td>1216.154633</td>
      <td>3500.000000</td>
      <td>1236.000000</td>
      <td>415.000000</td>
      <td>21183.401890</td>
      <td>15851.727160</td>
      <td>31.000000</td>
      <td>30.000000</td>
    </tr>
  </tbody>
</table>
</div>



**Answer**

There is no discernible difference between rows with missing labels and those without missing values. Summary statistics across key numerical features are highly similar in terms of means, medians, and variability, indicating that the missing labels are likely missing at random and do not represent a distinct population.

### <a id='toc1_4_4_'></a>[**Task 2d. Null values - device counts**](#toc0_)

Next, check the two populations with respect to the `device` variable.

**Question:** How many iPhone users had null values and how many Android users had null values?


```python
# Get count of null values by device
df_null['device'].value_counts()
```




    device
    iPhone     447
    Android    253
    Name: count, dtype: int64



**Answer**

There are `447` iPhone users which had null values and `253` Android users that had null values.

Now, of the rows with null values, calculate the percentage with each device&mdash;Android and iPhone. You can do this directly with the [`value_counts()`](https://pandas.pydata.org/docs/reference/api/pandas.Series.value_counts.html) function.


```python
# Calculate % of iPhone nulls and Android nulls
df_null['device'].value_counts(normalize=True)
```




    device
    iPhone     0.638571
    Android    0.361429
    Name: proportion, dtype: float64



How does this compare to the device ratio in the full dataset?


```python
# Calculate % of iPhone users and Android users in full dataset
df['device'].value_counts(normalize=True)
```




    device
    iPhone     0.644843
    Android    0.355157
    Name: proportion, dtype: float64



The percentage of missing values by each device is consistent with their representation in the data overall.

There is nothing to suggest a non-random cause of the missing data.

Examine the counts and percentages of users who churned vs. those who were retained. How many of each group are represented in the data?


```python
# Calculate counts of churned vs. retained
df['label'].value_counts(normalize=True)
```




    label
    retained    0.822645
    churned     0.177355
    Name: proportion, dtype: float64



This dataset contains 82% retained users and 18% churned users.

Next, compare the medians of each variable for churned and retained users. The reason for calculating the median and not the mean is that you don't want outliers to unduly affect the portrayal of a typical user. Notice, for example, that the maximum value in the `driven_km_drives` column is 21,183 km. That's more than half the circumference of the earth!


```python
# Calculate median values of all columns for churned and retained users
df.groupby(df['label']).median(numeric_only=True)

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
      <th>ID</th>
      <th>sessions</th>
      <th>drives</th>
      <th>total_sessions</th>
      <th>n_days_after_onboarding</th>
      <th>total_navigations_fav1</th>
      <th>total_navigations_fav2</th>
      <th>driven_km_drives</th>
      <th>duration_minutes_drives</th>
      <th>activity_days</th>
      <th>driving_days</th>
    </tr>
    <tr>
      <th>label</th>
      <th></th>
      <th></th>
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
      <th>churned</th>
      <td>7477.5</td>
      <td>59.0</td>
      <td>50.0</td>
      <td>164.339042</td>
      <td>1321.0</td>
      <td>84.5</td>
      <td>11.0</td>
      <td>3652.655666</td>
      <td>1607.183785</td>
      <td>8.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>retained</th>
      <td>7509.0</td>
      <td>56.0</td>
      <td>47.0</td>
      <td>157.586756</td>
      <td>1843.0</td>
      <td>68.0</td>
      <td>9.0</td>
      <td>3464.684614</td>
      <td>1458.046141</td>
      <td>17.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>



This offers an interesting snapshot of the two groups, churned vs. retained:

Users who churned averaged ~3 more drives in the last month than retained users, but retained users used the app on over twice as many days as churned users in the same time period.

The median churned user drove ~200 more kilometers and 2.5 more hours during the last month than the median retained user.

It seems that churned users had more drives in fewer days, and their trips were farther and longer in duration. Perhaps this is suggestive of a user profile. Continue exploring!

Calculate the median kilometers per drive in the last month for both retained and churned users.

Begin by dividing the `driven_km_drives` column by the `drives` column. Then, group the results by churned/retained and calculate the median km/drive of each group.


```python
# Add a column to df called `km_per_drive`
df['km_per_drive'] = df['driven_km_drives'] / df['drives']

# Group by `label`, calculate the median, and isolate for km per drive
df.groupby(df['label'])[['km_per_drive']].median(numeric_only=True)
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
      <th>km_per_drive</th>
    </tr>
    <tr>
      <th>label</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>churned</th>
      <td>74.109416</td>
    </tr>
    <tr>
      <th>retained</th>
      <td>75.014702</td>
    </tr>
  </tbody>
</table>
</div>



The median retained user drove about one more kilometer per drive than the median churned user. How many kilometers per driving day was this?

To calculate this statistic, repeat the steps above using `driving_days` instead of `drives`.


```python
# Add a column to df called `km_per_driving_day`
df['km_per_driving_day'] = df['driven_km_drives'] / df['driving_days']

# Group by `label`, calculate the median, and isolate for km per driving day
df.groupby(df['label'])[['km_per_driving_day']].median(numeric_only=True)
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
      <th>km_per_driving_day</th>
    </tr>
    <tr>
      <th>label</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>churned</th>
      <td>697.541999</td>
    </tr>
    <tr>
      <th>retained</th>
      <td>289.549333</td>
    </tr>
  </tbody>
</table>
</div>



Now, calculate the median number of drives per driving day for each group.


```python
# Add a column to df called `drives_per_driving_day`
df['drives_per_driving_day'] = df['drives'] / df['driving_days']

# Group by `label`, calculate the median, and isolate for drives per driving day
df.groupby(df['label'])[['drives_per_driving_day']].median(numeric_only=True)
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
      <th>drives_per_driving_day</th>
    </tr>
    <tr>
      <th>label</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>churned</th>
      <td>10.0000</td>
    </tr>
    <tr>
      <th>retained</th>
      <td>4.0625</td>
    </tr>
  </tbody>
</table>
</div>



The median user who churned drove 698 kilometers each day they drove last month, which is almost ~240% the per-drive-day distance of retained users. The median churned user had a similarly disproporionate number of drives per drive day compared to retained users.

It is clear from these figures that, regardless of whether a user churned or not, the users represented in this data are serious drivers! It would probably be safe to assume that this data does not represent typical drivers at large. Perhaps the data&mdash;and in particular the sample of churned users&mdash;contains a high proportion of long-haul truckers.

In consideration of how much these users drive, it would be worthwhile to recommend to Waze that they gather more data on these super-drivers. It's possible that the reason for their driving so much is also the reason why the Waze app does not meet their specific set of needs, which may differ from the needs of a more typical driver, such as a commuter.

Finally, examine whether there is an imbalance in how many users churned by device type.

Begin by getting the overall counts of each device type for each group, churned and retained.


```python
# For each label, calculate the number of Android users and iPhone users
df.groupby(df['label'])[['device']].value_counts()
```




    label     device 
    churned   iPhone     1645
              Android     891
    retained  iPhone     7580
              Android    4183
    Name: count, dtype: int64



Now, within each group, churned and retained, calculate what percent was Android and what percent was iPhone.


```python
# For each label, calculate the percentage of Android users and iPhone users
df.groupby(df['label'])[['device']].value_counts(normalize=True)
```




    label     device 
    churned   iPhone     0.648659
              Android    0.351341
    retained  iPhone     0.644393
              Android    0.355607
    Name: proportion, dtype: float64



The ratio of iPhone users and Android users is consistent between the churned group and the retained group, and those ratios are both consistent with the ratio found in the overall dataset.


## <a id='toc1_5_'></a>[**PACE: Construct**](#toc0_)

**Note**: The Construct stage does not apply to this workflow. The PACE framework can be adapted to fit the specific requirements of any project.


## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:

### <a id='toc1_6_1_'></a>[**Task 3. Conclusion**](#toc0_)

Recall that your supervisor, May Santer, asked you to share your findings with the data team in an executive summary. Consider the following questions as you prepare to write your summary. Think about key points you may want to share with the team, and what information is most relevant to the user churn project.

**Questions:**

1. Did the data contain any missing values? How many, and which variables were affected? Was there a pattern to the missing data?

2. What is a benefit of using the median value of a sample instead of the mean?

3. Did your investigation give rise to further questions that you would like to explore or ask the Waze team about?

4. What percentage of the users in the dataset were Android users and what percentage were iPhone users?

5. What were some distinguishing characteristics of users who churned vs. users who were retained?

6. Was there an appreciable difference in churn rate between iPhone users vs. Android users?





**Answer**

1. Yes. The dataset contained 700 missing values, all of which occurred in the `label` variable (churned vs. retained). No other variables had missing data.
2. The median is more robust to extreme outliers, which are present in the dataset. Therefore, using medians provides a more accurate representation of a typical user's behaviour, whereas means would be disproportionately influenced by a small number of very high-usage users.
3. Yes, the analysis suggested that many churned users appear to be high intensity or "super-drivers" with fewer driving days but much longer distances and more drives per day. This thereby raises several follow up questions for the Waze team:
    * Are these users professional or long-haul drivers?
    * Does Waze adequately support the needs of high intensity users?
    * Would segmenting users by driving intensity improve churn prediction and retention strategies?
4. In the full dataset
    * 64% of users were **iPhone**
    * 36% of users were **Android**
5. The key differences are:
    * **Churned Users:**
      * Drove more kilometers per month
      * Had more drivers, but across fewer driving days
      * Drove much farther per driving day
      * Had significantly more drives per driving day
    * **Retained Users:**
      * Used the app on more days
      * Had shorter, less intense trips
      * Drove slightly more kilometers per drive, but far less per driving day
  
    This therefore suggests that churned users tend to exhibit high intensity, concentrated usage patterns while the retained users show more regular, distributed engagement.

6. There was no difference in the churn rate with the device mix being nearly identical between churned and retained users:
   * Churned Users: **65% iPhone**, **35% Android**
   * Retained Users: **64% iPhone**, **36% Android**
  
    This therefore indicates that the device type is not a meaningful driver of user churn in this dataset.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.
