# <a id='toc1_'></a>[**Waze_Logistic_Regression**](#toc0_)

**Course 5 - Regression analysis: Simplify complex data relationships**

**Table of contents**<a id='toc0_'></a>    
- [**Waze_Logistic_Regression**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Ursula Sayo, Operations Manager**](#toc1_1_1_)    
    - [**Email from May Santner, Data Analysis Manager**](#toc1_1_2_)    
    - [**Email from May Santner, Data Analysis Manager**](#toc1_1_3_)    
    - [**Data Dictionary**](#toc1_1_4_)    
    - [**Objectives**](#toc1_1_5_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE:Plan**](#toc1_3_)    
    - [**Task 1. Imports and data loading**](#toc1_3_1_)    
  - [**PACE: Analyze**](#toc1_4_)    
    - [**Task 2a. Explore data with EDA**](#toc1_4_1_)    
    - [**Task 2b. Create features**](#toc1_4_2_)    
      - [**`km_per_driving_day`**](#toc1_4_2_1_)    
      - [**`professional_driver`**](#toc1_4_2_2_)    
  - [**PACE: Construct**](#toc1_5_)    
    - [**Task 3a. Preparing variables**](#toc1_5_1_)    
      - [**Impute outliers**](#toc1_5_1_1_)    
      - [**Encode categorical variables**](#toc1_5_1_2_)    
    - [**Task 3b. Determine whether assumptions have been met**](#toc1_5_2_)    
      - [**Collinearity**](#toc1_5_2_1_)    
    - [**Task 3c. Create dummies (if necessary)**](#toc1_5_3_)    
    - [**Task 3d. Model building**](#toc1_5_4_)    
      - [**Assign predictor variables and target**](#toc1_5_4_1_)    
      - [**Split the data**](#toc1_5_4_2_)    
      - [**Check final assumption**](#toc1_5_4_3_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Task 4a. Results and evaluation**](#toc1_6_1_)    
    - [**Task 4b. Show results with a confusion matrix**](#toc1_6_2_)    
    - [**BONUS**](#toc1_6_3_)    
    - [**Task 4c. Conclusion**](#toc1_6_4_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

The data team at Waze is more than halfway through their project for developing a machine learning model to predict user churn. Earlier, you completed a project proposal, used Python to explore and analyze Waze’s user data, created data visualizations, and conducted a hypothesis test. Now, leadership wants your team to build a regression model to predict user churn based on a variety of variables.

You check your inbox and discover a new email from Ursula Sayo, the Operations Manager at Waze. Ursula asks your team about the details of the regression model. You also notice two follow-up emails from your supervisor, May Santner. The first email is a response to Ursula, and says that the team will build a binomial logistic regression model. In her second email, May asks you to help build the model and prepare an executive summary to share your results.

### <a id='toc1_1_1_'></a>[**Email from Ursula Sayo, Operations Manager**](#toc0_)

**Subject:** Details on Regression Model

**From:** "Ursula Sayo," Ursula@Waze

**Cc:** "Harriet Hadzic," Harriet@waze, "Chidi Ga," Chidi@waze, "Sylvester Esperanza," Sylvester@Waze, "May Santner," May@Waze

Hello data team,

I really appreciate your work, and thanks for the explanation of the next phase of the algorithm creation.

I was hoping to get a bit more detail on regression. Will you be applying a linear or logistic regression model? It wasn’t clear in the meeting, and I want to align on expectations. 

Thank you, 

Ursula Sayo

Operations Manager

Waze

### <a id='toc1_1_2_'></a>[**Email from May Santner, Data Analysis Manager**](#toc0_)

**Subject:** RE: Details on Regression Model

**From:** "May Santner," May@Waze

**Cc:** "Harriet Hadzic," Harriet@waze, "Chidi Ga," Chidi@waze, "Sylvester Esperanza," Sylvester@Waze, "Ursula Sayo," Ursula@Waze

Thank you for your email. 

Apologies that the details were not made clear in our meeting.

To answer your question, we will build a binomial logistic regression model. Because we want to predict user churn, the binomial logistic regression model will be our confirmation for how best to proceed with the ML algorithm in the final phase of the project. 

Our team will be working on getting you the results of our analysis this week.

Feel free to reach out with additional questions. 

Many thanks,

May Santner

Data Analysis Manager

Waze

### <a id='toc1_1_3_'></a>[**Email from May Santner, Data Analysis Manager**](#toc0_)

**Subject:** RE: Details on Regression Model

**From:** "May Santner," May@Waze

**Cc:** "Chidi Ga," Chidi@Waze

Hello team! 

Would you two mind completing the following? 

* Build a binomial logistic regression model in a code notebook

* Write an executive summary of your results

I’d appreciate a chance to review your work before you send it over to Ursula, but write the summary as if you’re addressing the leadership team. 

Best regards,

May Santner

Data Analysis Manager

Waze

### <a id='toc1_1_4_'></a>[**Data Dictionary**](#toc0_)

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


### <a id='toc1_1_5_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to demostrate knowledge of exploratory data analysis (EDA) and a binomial logistic regression model.

**The goal** is to build a binomial logistic regression model and evaluate the model's performance.

*This activity has three parts:*

**Part 1:** EDA & Checking Model Assumptions
* What are some purposes of EDA before constructing a binomial logistic regression model?

**Part 2:** Model Building and Evaluation
* What resources do you find yourself using as you complete this stage?

**Part 3:** Interpreting Model Results

* What key insights emerged from your model(s)?

* What business recommendations do you propose based on the models built?

Follow the instructions and answer the question below to complete the activity. Then, you will complete an executive summary using the questions listed on the PACE Strategy Document.

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE:Plan**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Plan stage.

### <a id='toc1_3_1_'></a>[**Task 1. Imports and data loading**](#toc0_)
Import the data and packages that you've learned are needed for building logistic regression models.


```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay, classification_report
```

Import the dataset


```python
df = pd.read_csv('waze_dataset.csv')
```

## <a id='toc1_4_'></a>[**PACE: Analyze**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

In this stage, consider the following question:

* What are some purposes of EDA before constructing a binomial logistic regression model?

**Answer**

Some of the purposes of EDA before constructing a logisitc regression model are to check for outliers and extreme data values as this can significantly impact logistic regression models. After visualising the data, a plan is made for addressing the outliers such as by dropping the rows, substituting extreme data values with average data or removing data values greater than 3 standard deviations. Another purpose of EDA before model construction is to help the analyst identify missing data which in turn helps to make the decisions of their exclusion or inclusion by substituting values with dataset means, medians and other similar methods. Additionally, it can be useful to engineer more variables via multiplying the variables together or by calculating the ratio between two variables.

### <a id='toc1_4_1_'></a>[**Task 2a. Explore data with EDA**](#toc0_)

Analyze and discover data, looking for correlations, missing data, potential outliers, and/or duplicates.



Start with `.shape` and `info()`


```python
df.shape
```




    (14999, 13)




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
    

**Question:** Are there any missing values in your data?

**Answer**

Yes, there is 700 missing values in the `label` column which is our target variable.

Use `.head()`.


```python
df.head()
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
  </tbody>
</table>
</div>



Use `.drop()` to remove the ID column since we don't need this information for your analysis.


```python
df = df.drop('ID', axis=1)
```

Now, check the class balance of the dependent (target) variable, `label`.


```python
df['label'].value_counts(normalize=True)
```




    label
    retained    0.822645
    churned     0.177355
    Name: proportion, dtype: float64



Call `.describe()` on the data.


```python
df.describe()
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
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
      <td>14999.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>80.633776</td>
      <td>67.281152</td>
      <td>189.964447</td>
      <td>1749.837789</td>
      <td>121.605974</td>
      <td>29.672512</td>
      <td>4039.340921</td>
      <td>1860.976012</td>
      <td>15.537102</td>
      <td>12.179879</td>
    </tr>
    <tr>
      <th>std</th>
      <td>80.699065</td>
      <td>65.913872</td>
      <td>136.405128</td>
      <td>1008.513876</td>
      <td>148.121544</td>
      <td>45.394651</td>
      <td>2502.149334</td>
      <td>1446.702288</td>
      <td>9.004655</td>
      <td>7.824036</td>
    </tr>
    <tr>
      <th>min</th>
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
      <td>23.000000</td>
      <td>20.000000</td>
      <td>90.661156</td>
      <td>878.000000</td>
      <td>9.000000</td>
      <td>0.000000</td>
      <td>2212.600607</td>
      <td>835.996260</td>
      <td>8.000000</td>
      <td>5.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>56.000000</td>
      <td>48.000000</td>
      <td>159.568115</td>
      <td>1741.000000</td>
      <td>71.000000</td>
      <td>9.000000</td>
      <td>3493.858085</td>
      <td>1478.249859</td>
      <td>16.000000</td>
      <td>12.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>112.000000</td>
      <td>93.000000</td>
      <td>254.192341</td>
      <td>2623.500000</td>
      <td>178.000000</td>
      <td>43.000000</td>
      <td>5289.861262</td>
      <td>2464.362632</td>
      <td>23.000000</td>
      <td>19.000000</td>
    </tr>
    <tr>
      <th>max</th>
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



**Question:** Are there any variables that could potentially have outliers just by assessing at the quartile values, standard deviation, and max values?

**Answer**

Yes, several of the variables show signs of having outliers, as their maximum values are multiple standard deviations above their 75th percentile.

This is evident in particular for:

* `sessions`
* `drives`
* `total_sessions`
* `total_navigations_fav1`
* `total_navigations_fav2`
* `driven_km_drives`
* `duration_minutes_drives`

Thereby showing a possible indication of outliers in these variables, which could be due to a small number of highly active or long-tenured users.

### <a id='toc1_4_2_'></a>[**Task 2b. Create features**](#toc0_)

Create features that may be of interest to the stakeholder and/or that are needed to address the business scenario/problem.

#### <a id='toc1_4_2_1_'></a>[**`km_per_driving_day`**](#toc0_)

You know from earlier EDA that churn rate correlates with distance driven per driving day in the last month. It might be helpful to engineer a feature that captures this information.

1. Create a new column in `df` called `km_per_driving_day`, which represents the mean distance driven per driving day for each user.

2. Call the `describe()` method on the new column.


```python
df['km_per_driving_day'] = df['driven_km_drives'] / df['driving_days']

df['km_per_driving_day'].describe()
```




    count    1.499900e+04
    mean              inf
    std               NaN
    min      3.022063e+00
    25%      1.672804e+02
    50%      3.231459e+02
    75%      7.579257e+02
    max               inf
    Name: km_per_driving_day, dtype: float64



Note that some values are infinite. This is the result of there being values of zero in the `driving_days` column. Pandas imputes a value of infinity in the corresponding rows of the new column because division by zero is undefined.

1. Convert these values from infinity to zero. You can use `np.inf` to refer to a value of infinity.

2. Call `describe()` on the `km_per_driving_day` column to verify that it worked.


```python
df['km_per_driving_day'] = df['km_per_driving_day'].replace(np.inf, 0)

df['km_per_driving_day'].describe()
```




    count    14999.000000
    mean       578.963113
    std       1030.094384
    min          0.000000
    25%        136.238895
    50%        272.889272
    75%        558.686918
    max      15420.234110
    Name: km_per_driving_day, dtype: float64



#### <a id='toc1_4_2_2_'></a>[**`professional_driver`**](#toc0_)

Create a new, binary feature called `professional_driver` that is a 1 for users who had 60 or more drives <u>**and**</u> drove on 15+ days in the last month.

**Note:** The objective is to create a new feature that separates professional drivers from other drivers. In this scenario, domain knowledge and intuition are used to determine these deciding thresholds, but ultimately they are arbitrary.

To create this column, use the [`np.where()`](https://numpy.org/doc/stable/reference/generated/numpy.where.html) function. This function accepts as arguments:
1. A condition
2. What to return when the condition is true
3. What to return when the condition is false

```
Example:
x = [1, 2, 3]
x = np.where(x > 2, 100, 0)
x
array([  0,   0, 100])
```


```python
df['professional_driver'] = np.where((df['drives'] >= 60) & (df['driving_days'] >= 15), 1, 0)
```

Perform a quick inspection of the new variable.

1. Check the count of professional drivers and non-professionals

2. Within each class (professional and non-professional) calculate the churn rate


```python
print(df['professional_driver'].value_counts())

df.groupby(['professional_driver'])['label'].value_counts(normalize=True)
```

    professional_driver
    0    12405
    1     2594
    Name: count, dtype: int64
    




    professional_driver  label   
    0                    retained    0.801202
                         churned     0.198798
    1                    retained    0.924437
                         churned     0.075563
    Name: proportion, dtype: float64



The churn rate for professional drivers is 7.6%, while the churn rate for non-professionals is 19.9%. This seems like it could add predictive signal to the model.

## <a id='toc1_5_'></a>[**PACE: Construct**](#toc0_)

After analysis and deriving variables with close relationships, it is time to begin constructing the model.

Consider the questions in your PACE Strategy Document to reflect on the Construct stage.

In this stage, consider the following question:

* Why did you select the X variables you did?

**Answer**

I chose the X variables I did initially based on the business objective and insights from the EDA, as well as some variables having high multicollinearity. In the future, with the rerunning and fine-tuning of models, other variables can be selected or deselected based on their relevance and affect on the models metrics such as accuracy, precision and recall. 

### <a id='toc1_5_1_'></a>[**Task 3a. Preparing variables**](#toc0_)

Call `info()` on the dataframe to check the data type of the `label` variable and to verify if there are any missing values.


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 14999 entries, 0 to 14998
    Data columns (total 14 columns):
     #   Column                   Non-Null Count  Dtype  
    ---  ------                   --------------  -----  
     0   label                    14299 non-null  object 
     1   sessions                 14999 non-null  int64  
     2   drives                   14999 non-null  int64  
     3   total_sessions           14999 non-null  float64
     4   n_days_after_onboarding  14999 non-null  int64  
     5   total_navigations_fav1   14999 non-null  int64  
     6   total_navigations_fav2   14999 non-null  int64  
     7   driven_km_drives         14999 non-null  float64
     8   duration_minutes_drives  14999 non-null  float64
     9   activity_days            14999 non-null  int64  
     10  driving_days             14999 non-null  int64  
     11  device                   14999 non-null  object 
     12  km_per_driving_day       14999 non-null  float64
     13  professional_driver      14999 non-null  int64  
    dtypes: float64(4), int64(8), object(2)
    memory usage: 1.6+ MB
    

Because you know from previous EDA that there is no evidence of a non-random cause of the 700 missing values in the `label` column, and because these observations comprise less than 5% of the data, use the `dropna()` method to drop the rows that are missing this data.


```python
df = df.dropna(subset=['label'])
```

#### <a id='toc1_5_1_1_'></a>[**Impute outliers**](#toc0_)

You rarely want to drop outliers, and generally will not do so unless there is a clear reason for it (e.g., typographic errors).

At times outliers can be changed to the **median, mean, 95th percentile, etc.**

Previously, you determined that seven of the variables had clear signs of containing outliers:

* `sessions`
* `drives`
* `total_sessions`
* `total_navigations_fav1`
* `total_navigations_fav2`
* `driven_km_drives`
* `duration_minutes_drives`

For this analysis, impute the outlying values for these columns. Calculate the **95th percentile** of each column and change to this value any value in the column that exceeds it.


```python
# Impute outliers
def outlier(variable, percentile):
    threshold = df[variable].quantile(percentile)
    df.loc[df[variable] > threshold, variable] = threshold
    print(f'{variable} | percentile: {percentile} | threshold: {threshold}')

for variable in ['sessions', 'drives', 'total_sessions', 'total_navigations_fav1',
                 'total_navigations_fav2', 'driven_km_drives', 'duration_minutes_drives']:
    outlier(variable, 0.95)
```

    sessions | percentile: 0.95 | threshold: 243.0
    drives | percentile: 0.95 | threshold: 200.0
    total_sessions | percentile: 0.95 | threshold: 455.4394923899998
    total_navigations_fav1 | percentile: 0.95 | threshold: 422.0
    total_navigations_fav2 | percentile: 0.95 | threshold: 124.0
    driven_km_drives | percentile: 0.95 | threshold: 8898.716274999999
    duration_minutes_drives | percentile: 0.95 | threshold: 4668.180091799999
    

Call `describe()`.


```python
df.describe()
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
      <th>km_per_driving_day</th>
      <th>professional_driver</th>
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
      <td>14299.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>76.539688</td>
      <td>63.964683</td>
      <td>183.717304</td>
      <td>1751.822505</td>
      <td>114.562767</td>
      <td>27.187216</td>
      <td>3944.558631</td>
      <td>1792.911210</td>
      <td>15.544653</td>
      <td>12.182530</td>
      <td>581.942399</td>
      <td>0.173998</td>
    </tr>
    <tr>
      <th>std</th>
      <td>67.243178</td>
      <td>55.127927</td>
      <td>118.720520</td>
      <td>1008.663834</td>
      <td>124.378550</td>
      <td>36.715302</td>
      <td>2218.358258</td>
      <td>1224.329759</td>
      <td>9.016088</td>
      <td>7.833835</td>
      <td>1038.254509</td>
      <td>0.379121</td>
    </tr>
    <tr>
      <th>min</th>
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
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
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
      <td>136.168003</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>50%</th>
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
      <td>273.301012</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>75%</th>
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
      <td>558.018761</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>243.000000</td>
      <td>200.000000</td>
      <td>455.439492</td>
      <td>3500.000000</td>
      <td>422.000000</td>
      <td>124.000000</td>
      <td>8898.716275</td>
      <td>4668.180092</td>
      <td>31.000000</td>
      <td>30.000000</td>
      <td>15420.234110</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



#### <a id='toc1_5_1_2_'></a>[**Encode categorical variables**](#toc0_)

Change the data type of the `label` column to be binary. This change is needed to train a logistic regression model.

Assign a `0` for all `retained` users.

Assign a `1` for all `churned` users.

Save this variable as `label2` as to not overwrite the original `label` variable.

**Note:** There are many ways to do this. Consider using `np.where()` as you did earlier in this notebook.


```python
df['label2'] = df['label'].map({'retained': 0,
                                 'churned': 1})
```

### <a id='toc1_5_2_'></a>[**Task 3b. Determine whether assumptions have been met**](#toc0_)

The following are the assumptions for logistic regression:

* Independent observations (This refers to how the data was collected.)

* No extreme outliers

* Little to no multicollinearity among X predictors

* Linear relationship between X and the **logit** of y

For the first assumption, you can assume that observations are independent for this project.

The second assumption has already been addressed.

The last assumption will be verified after modeling.

**Note:** In practice, modeling assumptions are often violated, and depending on the specifics of your use case and the severity of the violation, it might not affect your model much at all or it will result in a failed model.

#### <a id='toc1_5_2_1_'></a>[**Collinearity**](#toc0_)

Check the correlation among predictor variables. First, generate a correlation matrix.


```python
df.corr(method='pearson', numeric_only=True)
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
      <th>km_per_driving_day</th>
      <th>professional_driver</th>
      <th>label2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>sessions</th>
      <td>1.000000</td>
      <td>0.996942</td>
      <td>0.597189</td>
      <td>0.007101</td>
      <td>0.001858</td>
      <td>0.008536</td>
      <td>0.002996</td>
      <td>-0.004545</td>
      <td>0.025113</td>
      <td>0.020294</td>
      <td>-0.011569</td>
      <td>0.443654</td>
      <td>0.034911</td>
    </tr>
    <tr>
      <th>drives</th>
      <td>0.996942</td>
      <td>1.000000</td>
      <td>0.595285</td>
      <td>0.006940</td>
      <td>0.001058</td>
      <td>0.009505</td>
      <td>0.003445</td>
      <td>-0.003889</td>
      <td>0.024357</td>
      <td>0.019608</td>
      <td>-0.010989</td>
      <td>0.444425</td>
      <td>0.035865</td>
    </tr>
    <tr>
      <th>total_sessions</th>
      <td>0.597189</td>
      <td>0.595285</td>
      <td>1.000000</td>
      <td>0.006596</td>
      <td>0.000187</td>
      <td>0.010371</td>
      <td>0.001016</td>
      <td>-0.000338</td>
      <td>0.015755</td>
      <td>0.012953</td>
      <td>-0.016167</td>
      <td>0.254433</td>
      <td>0.024568</td>
    </tr>
    <tr>
      <th>n_days_after_onboarding</th>
      <td>0.007101</td>
      <td>0.006940</td>
      <td>0.006596</td>
      <td>1.000000</td>
      <td>-0.002450</td>
      <td>-0.004968</td>
      <td>-0.004652</td>
      <td>-0.010167</td>
      <td>-0.009418</td>
      <td>-0.007321</td>
      <td>0.011764</td>
      <td>0.003770</td>
      <td>-0.129263</td>
    </tr>
    <tr>
      <th>total_navigations_fav1</th>
      <td>0.001858</td>
      <td>0.001058</td>
      <td>0.000187</td>
      <td>-0.002450</td>
      <td>1.000000</td>
      <td>0.002866</td>
      <td>-0.007368</td>
      <td>0.005646</td>
      <td>0.010902</td>
      <td>0.010419</td>
      <td>-0.000197</td>
      <td>-0.000224</td>
      <td>0.052322</td>
    </tr>
    <tr>
      <th>total_navigations_fav2</th>
      <td>0.008536</td>
      <td>0.009505</td>
      <td>0.010371</td>
      <td>-0.004968</td>
      <td>0.002866</td>
      <td>1.000000</td>
      <td>0.003559</td>
      <td>-0.003009</td>
      <td>-0.004425</td>
      <td>0.002000</td>
      <td>0.006751</td>
      <td>0.007126</td>
      <td>0.015032</td>
    </tr>
    <tr>
      <th>driven_km_drives</th>
      <td>0.002996</td>
      <td>0.003445</td>
      <td>0.001016</td>
      <td>-0.004652</td>
      <td>-0.007368</td>
      <td>0.003559</td>
      <td>1.000000</td>
      <td>0.690515</td>
      <td>-0.007441</td>
      <td>-0.009549</td>
      <td>0.344811</td>
      <td>-0.000904</td>
      <td>0.019767</td>
    </tr>
    <tr>
      <th>duration_minutes_drives</th>
      <td>-0.004545</td>
      <td>-0.003889</td>
      <td>-0.000338</td>
      <td>-0.010167</td>
      <td>0.005646</td>
      <td>-0.003009</td>
      <td>0.690515</td>
      <td>1.000000</td>
      <td>-0.007895</td>
      <td>-0.009425</td>
      <td>0.239627</td>
      <td>-0.012128</td>
      <td>0.040407</td>
    </tr>
    <tr>
      <th>activity_days</th>
      <td>0.025113</td>
      <td>0.024357</td>
      <td>0.015755</td>
      <td>-0.009418</td>
      <td>0.010902</td>
      <td>-0.004425</td>
      <td>-0.007441</td>
      <td>-0.007895</td>
      <td>1.000000</td>
      <td>0.947687</td>
      <td>-0.397433</td>
      <td>0.453825</td>
      <td>-0.303851</td>
    </tr>
    <tr>
      <th>driving_days</th>
      <td>0.020294</td>
      <td>0.019608</td>
      <td>0.012953</td>
      <td>-0.007321</td>
      <td>0.010419</td>
      <td>0.002000</td>
      <td>-0.009549</td>
      <td>-0.009425</td>
      <td>0.947687</td>
      <td>1.000000</td>
      <td>-0.407917</td>
      <td>0.469776</td>
      <td>-0.294259</td>
    </tr>
    <tr>
      <th>km_per_driving_day</th>
      <td>-0.011569</td>
      <td>-0.010989</td>
      <td>-0.016167</td>
      <td>0.011764</td>
      <td>-0.000197</td>
      <td>0.006751</td>
      <td>0.344811</td>
      <td>0.239627</td>
      <td>-0.397433</td>
      <td>-0.407917</td>
      <td>1.000000</td>
      <td>-0.165966</td>
      <td>0.148583</td>
    </tr>
    <tr>
      <th>professional_driver</th>
      <td>0.443654</td>
      <td>0.444425</td>
      <td>0.254433</td>
      <td>0.003770</td>
      <td>-0.000224</td>
      <td>0.007126</td>
      <td>-0.000904</td>
      <td>-0.012128</td>
      <td>0.453825</td>
      <td>0.469776</td>
      <td>-0.165966</td>
      <td>1.000000</td>
      <td>-0.122312</td>
    </tr>
    <tr>
      <th>label2</th>
      <td>0.034911</td>
      <td>0.035865</td>
      <td>0.024568</td>
      <td>-0.129263</td>
      <td>0.052322</td>
      <td>0.015032</td>
      <td>0.019767</td>
      <td>0.040407</td>
      <td>-0.303851</td>
      <td>-0.294259</td>
      <td>0.148583</td>
      <td>-0.122312</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



Now, plot a correlation heatmap.


```python
plt.figure(figsize=(15,10))
sns.heatmap(df.corr(method='pearson', numeric_only=True), vmin=-1, vmax=1, annot=True, cmap='coolwarm')
plt.title("Correlation Heatmap")
plt.show()
```


    
<img width="1283" height="994" alt="Waze_Logistic_Regression_74_0" src="https://github.com/user-attachments/assets/a64ff1de-f22f-4af6-bb0d-a636e39071a9" />


    


If there are predictor variables that have a Pearson correlation coefficient value greater than the **absolute value of 0.7**, these variables are strongly multicollinear. Therefore, only one of these variables should be used in your model.

**Note:** 0.7 is an arbitrary threshold. Some industries may use 0.6, 0.8, etc.

**Question:** Which variables are multicollinear with each other?

**Answer**

* `sessions` and `drives`: 1.0
* `activity_days` and `driving_days`: 0.95

### <a id='toc1_5_3_'></a>[**Task 3c. Create dummies (if necessary)**](#toc0_)

If you have selected `device` as an X variable, you will need to create dummy variables since this variable is categorical.

In cases with many categorical variables, you can use pandas built-in [`pd.get_dummies()`](https://pandas.pydata.org/docs/reference/api/pandas.get_dummies.html), or you can use scikit-learn's [`OneHotEncoder()`](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.OneHotEncoder.html) function.

**Note:** Variables with many categories should only be dummied if absolutely necessary. Each category will result in a coefficient for your model which can lead to overfitting.

Because this dataset only has one remaining categorical feature (`device`), it's not necessary to use one of these special functions. You can just implement the transformation directly.

Create a new, binary column called `device2` that encodes user devices as follows:

* `Android` -> `0`
* `iPhone` -> `1`


```python
df['device2'] = np.where(df['device'] == 'Android', 0, 1)
```

### <a id='toc1_5_4_'></a>[**Task 3d. Model building**](#toc0_)

#### <a id='toc1_5_4_1_'></a>[**Assign predictor variables and target**](#toc0_)

To build your model you need to determine what X variables you want to include in your model to predict your target&mdash;`label2`.

Drop the following variables and assign the results to `X`:

* `label` (this is the target)
* `label2` (this is the target)
* `device` (this is the non-binary-encoded categorical variable)
* `sessions` (this had high multicollinearity)
* `driving_days` (this had high multicollinearity)

**Note:** Notice that `sessions` and `driving_days` were selected to be dropped, rather than `drives` and `activity_days`. The reason for this is that the features that were kept for modeling had slightly stronger correlations with the target variable than the features that were dropped.


```python
X = df.copy()
X = X.drop(['label', 'label2', 'device', 'sessions', 'driving_days'], axis=1)
```

Now, isolate the dependent (target) variable. Assign it to a variable called `y`.


```python
y = df['label2']
```

#### <a id='toc1_5_4_2_'></a>[**Split the data**](#toc0_)

Use scikit-learn's [`train_test_split()`](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.train_test_split.html) function to perform a train/test split on your data using the X and y variables you assigned above.

**Note 1:** It is important to do a train test to obtain accurate predictions.  You always want to fit your model on your training set and evaluate your model on your test set to avoid data leakage.

**Note 2:** Because the target class is imbalanced (82% retained vs. 18% churned), you want to make sure that you don't get an unlucky split that over- or under-represents the frequency of the minority class. Set the function's `stratify` parameter to `y` to ensure that the minority class appears in both train and test sets in the same proportion that it does in the overall dataset.


```python
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)
```


```python
# Use .head()
X_train.head()
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
      <th>drives</th>
      <th>total_sessions</th>
      <th>n_days_after_onboarding</th>
      <th>total_navigations_fav1</th>
      <th>total_navigations_fav2</th>
      <th>driven_km_drives</th>
      <th>duration_minutes_drives</th>
      <th>activity_days</th>
      <th>km_per_driving_day</th>
      <th>professional_driver</th>
      <th>device2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1245</th>
      <td>200</td>
      <td>455.439492</td>
      <td>504</td>
      <td>0</td>
      <td>113</td>
      <td>2707.906201</td>
      <td>1090.476086</td>
      <td>30</td>
      <td>100.292822</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>7972</th>
      <td>137</td>
      <td>282.858310</td>
      <td>3382</td>
      <td>0</td>
      <td>124</td>
      <td>7113.176056</td>
      <td>2005.715481</td>
      <td>1</td>
      <td>0.000000</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4665</th>
      <td>2</td>
      <td>73.077779</td>
      <td>2133</td>
      <td>88</td>
      <td>13</td>
      <td>4089.069058</td>
      <td>2737.176219</td>
      <td>30</td>
      <td>170.377877</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>11921</th>
      <td>123</td>
      <td>325.427459</td>
      <td>3017</td>
      <td>167</td>
      <td>7</td>
      <td>1457.283362</td>
      <td>451.848000</td>
      <td>13</td>
      <td>132.480306</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>803</th>
      <td>39</td>
      <td>455.439492</td>
      <td>78</td>
      <td>126</td>
      <td>51</td>
      <td>4772.509343</td>
      <td>2837.036812</td>
      <td>28</td>
      <td>238.625467</td>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



Use scikit-learn to instantiate a logistic regression model. Add the argument `penalty = None`.

It is important to add `penalty = None` since your predictors are unscaled.

Refer to scikit-learn's [logistic regression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html) documentation for more information.

Fit the model on `X_train` and `y_train`.


```python
clf = LogisticRegression(penalty=None, max_iter=400)
clf.fit(X_train, y_train)
```

    c:\Users\alexa\anaconda3\envs\google_advanced_data_analytics\Lib\site-packages\sklearn\linear_model\_logistic.py:465: ConvergenceWarning: lbfgs failed to converge (status=1):
    STOP: TOTAL NO. OF ITERATIONS REACHED LIMIT.
    
    Increase the number of iterations (max_iter) or scale the data as shown in:
        https://scikit-learn.org/stable/modules/preprocessing.html
    Please also refer to the documentation for alternative solver options:
        https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression
      n_iter_i = _check_optimize_result(
    




<style>#sk-container-id-1 {
  /* Definition of color scheme common for light and dark mode */
  --sklearn-color-text: #000;
  --sklearn-color-text-muted: #666;
  --sklearn-color-line: gray;
  /* Definition of color scheme for unfitted estimators */
  --sklearn-color-unfitted-level-0: #fff5e6;
  --sklearn-color-unfitted-level-1: #f6e4d2;
  --sklearn-color-unfitted-level-2: #ffe0b3;
  --sklearn-color-unfitted-level-3: chocolate;
  /* Definition of color scheme for fitted estimators */
  --sklearn-color-fitted-level-0: #f0f8ff;
  --sklearn-color-fitted-level-1: #d4ebff;
  --sklearn-color-fitted-level-2: #b3dbfd;
  --sklearn-color-fitted-level-3: cornflowerblue;

  /* Specific color for light theme */
  --sklearn-color-text-on-default-background: var(--sg-text-color, var(--theme-code-foreground, var(--jp-content-font-color1, black)));
  --sklearn-color-background: var(--sg-background-color, var(--theme-background, var(--jp-layout-color0, white)));
  --sklearn-color-border-box: var(--sg-text-color, var(--theme-code-foreground, var(--jp-content-font-color1, black)));
  --sklearn-color-icon: #696969;

  @media (prefers-color-scheme: dark) {
    /* Redefinition of color scheme for dark theme */
    --sklearn-color-text-on-default-background: var(--sg-text-color, var(--theme-code-foreground, var(--jp-content-font-color1, white)));
    --sklearn-color-background: var(--sg-background-color, var(--theme-background, var(--jp-layout-color0, #111)));
    --sklearn-color-border-box: var(--sg-text-color, var(--theme-code-foreground, var(--jp-content-font-color1, white)));
    --sklearn-color-icon: #878787;
  }
}

#sk-container-id-1 {
  color: var(--sklearn-color-text);
}

#sk-container-id-1 pre {
  padding: 0;
}

#sk-container-id-1 input.sk-hidden--visually {
  border: 0;
  clip: rect(1px 1px 1px 1px);
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

#sk-container-id-1 div.sk-dashed-wrapped {
  border: 1px dashed var(--sklearn-color-line);
  margin: 0 0.4em 0.5em 0.4em;
  box-sizing: border-box;
  padding-bottom: 0.4em;
  background-color: var(--sklearn-color-background);
}

#sk-container-id-1 div.sk-container {
  /* jupyter's `normalize.less` sets `[hidden] { display: none; }`
     but bootstrap.min.css set `[hidden] { display: none !important; }`
     so we also need the `!important` here to be able to override the
     default hidden behavior on the sphinx rendered scikit-learn.org.
     See: https://github.com/scikit-learn/scikit-learn/issues/21755 */
  display: inline-block !important;
  position: relative;
}

#sk-container-id-1 div.sk-text-repr-fallback {
  display: none;
}

div.sk-parallel-item,
div.sk-serial,
div.sk-item {
  /* draw centered vertical line to link estimators */
  background-image: linear-gradient(var(--sklearn-color-text-on-default-background), var(--sklearn-color-text-on-default-background));
  background-size: 2px 100%;
  background-repeat: no-repeat;
  background-position: center center;
}

/* Parallel-specific style estimator block */

#sk-container-id-1 div.sk-parallel-item::after {
  content: "";
  width: 100%;
  border-bottom: 2px solid var(--sklearn-color-text-on-default-background);
  flex-grow: 1;
}

#sk-container-id-1 div.sk-parallel {
  display: flex;
  align-items: stretch;
  justify-content: center;
  background-color: var(--sklearn-color-background);
  position: relative;
}

#sk-container-id-1 div.sk-parallel-item {
  display: flex;
  flex-direction: column;
}

#sk-container-id-1 div.sk-parallel-item:first-child::after {
  align-self: flex-end;
  width: 50%;
}

#sk-container-id-1 div.sk-parallel-item:last-child::after {
  align-self: flex-start;
  width: 50%;
}

#sk-container-id-1 div.sk-parallel-item:only-child::after {
  width: 0;
}

/* Serial-specific style estimator block */

#sk-container-id-1 div.sk-serial {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: var(--sklearn-color-background);
  padding-right: 1em;
  padding-left: 1em;
}


/* Toggleable style: style used for estimator/Pipeline/ColumnTransformer box that is
clickable and can be expanded/collapsed.
- Pipeline and ColumnTransformer use this feature and define the default style
- Estimators will overwrite some part of the style using the `sk-estimator` class
*/

/* Pipeline and ColumnTransformer style (default) */

#sk-container-id-1 div.sk-toggleable {
  /* Default theme specific background. It is overwritten whether we have a
  specific estimator or a Pipeline/ColumnTransformer */
  background-color: var(--sklearn-color-background);
}

/* Toggleable label */
#sk-container-id-1 label.sk-toggleable__label {
  cursor: pointer;
  display: flex;
  width: 100%;
  margin-bottom: 0;
  padding: 0.5em;
  box-sizing: border-box;
  text-align: center;
  align-items: start;
  justify-content: space-between;
  gap: 0.5em;
}

#sk-container-id-1 label.sk-toggleable__label .caption {
  font-size: 0.6rem;
  font-weight: lighter;
  color: var(--sklearn-color-text-muted);
}

#sk-container-id-1 label.sk-toggleable__label-arrow:before {
  /* Arrow on the left of the label */
  content: "▸";
  float: left;
  margin-right: 0.25em;
  color: var(--sklearn-color-icon);
}

#sk-container-id-1 label.sk-toggleable__label-arrow:hover:before {
  color: var(--sklearn-color-text);
}

/* Toggleable content - dropdown */

#sk-container-id-1 div.sk-toggleable__content {
  max-height: 0;
  max-width: 0;
  overflow: hidden;
  text-align: left;
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-0);
}

#sk-container-id-1 div.sk-toggleable__content.fitted {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-0);
}

#sk-container-id-1 div.sk-toggleable__content pre {
  margin: 0.2em;
  border-radius: 0.25em;
  color: var(--sklearn-color-text);
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-0);
}

#sk-container-id-1 div.sk-toggleable__content.fitted pre {
  /* unfitted */
  background-color: var(--sklearn-color-fitted-level-0);
}

#sk-container-id-1 input.sk-toggleable__control:checked~div.sk-toggleable__content {
  /* Expand drop-down */
  max-height: 200px;
  max-width: 100%;
  overflow: auto;
}

#sk-container-id-1 input.sk-toggleable__control:checked~label.sk-toggleable__label-arrow:before {
  content: "▾";
}

/* Pipeline/ColumnTransformer-specific style */

#sk-container-id-1 div.sk-label input.sk-toggleable__control:checked~label.sk-toggleable__label {
  color: var(--sklearn-color-text);
  background-color: var(--sklearn-color-unfitted-level-2);
}

#sk-container-id-1 div.sk-label.fitted input.sk-toggleable__control:checked~label.sk-toggleable__label {
  background-color: var(--sklearn-color-fitted-level-2);
}

/* Estimator-specific style */

/* Colorize estimator box */
#sk-container-id-1 div.sk-estimator input.sk-toggleable__control:checked~label.sk-toggleable__label {
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-2);
}

#sk-container-id-1 div.sk-estimator.fitted input.sk-toggleable__control:checked~label.sk-toggleable__label {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-2);
}

#sk-container-id-1 div.sk-label label.sk-toggleable__label,
#sk-container-id-1 div.sk-label label {
  /* The background is the default theme color */
  color: var(--sklearn-color-text-on-default-background);
}

/* On hover, darken the color of the background */
#sk-container-id-1 div.sk-label:hover label.sk-toggleable__label {
  color: var(--sklearn-color-text);
  background-color: var(--sklearn-color-unfitted-level-2);
}

/* Label box, darken color on hover, fitted */
#sk-container-id-1 div.sk-label.fitted:hover label.sk-toggleable__label.fitted {
  color: var(--sklearn-color-text);
  background-color: var(--sklearn-color-fitted-level-2);
}

/* Estimator label */

#sk-container-id-1 div.sk-label label {
  font-family: monospace;
  font-weight: bold;
  display: inline-block;
  line-height: 1.2em;
}

#sk-container-id-1 div.sk-label-container {
  text-align: center;
}

/* Estimator-specific */
#sk-container-id-1 div.sk-estimator {
  font-family: monospace;
  border: 1px dotted var(--sklearn-color-border-box);
  border-radius: 0.25em;
  box-sizing: border-box;
  margin-bottom: 0.5em;
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-0);
}

#sk-container-id-1 div.sk-estimator.fitted {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-0);
}

/* on hover */
#sk-container-id-1 div.sk-estimator:hover {
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-2);
}

#sk-container-id-1 div.sk-estimator.fitted:hover {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-2);
}

/* Specification for estimator info (e.g. "i" and "?") */

/* Common style for "i" and "?" */

.sk-estimator-doc-link,
a:link.sk-estimator-doc-link,
a:visited.sk-estimator-doc-link {
  float: right;
  font-size: smaller;
  line-height: 1em;
  font-family: monospace;
  background-color: var(--sklearn-color-background);
  border-radius: 1em;
  height: 1em;
  width: 1em;
  text-decoration: none !important;
  margin-left: 0.5em;
  text-align: center;
  /* unfitted */
  border: var(--sklearn-color-unfitted-level-1) 1pt solid;
  color: var(--sklearn-color-unfitted-level-1);
}

.sk-estimator-doc-link.fitted,
a:link.sk-estimator-doc-link.fitted,
a:visited.sk-estimator-doc-link.fitted {
  /* fitted */
  border: var(--sklearn-color-fitted-level-1) 1pt solid;
  color: var(--sklearn-color-fitted-level-1);
}

/* On hover */
div.sk-estimator:hover .sk-estimator-doc-link:hover,
.sk-estimator-doc-link:hover,
div.sk-label-container:hover .sk-estimator-doc-link:hover,
.sk-estimator-doc-link:hover {
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-3);
  color: var(--sklearn-color-background);
  text-decoration: none;
}

div.sk-estimator.fitted:hover .sk-estimator-doc-link.fitted:hover,
.sk-estimator-doc-link.fitted:hover,
div.sk-label-container:hover .sk-estimator-doc-link.fitted:hover,
.sk-estimator-doc-link.fitted:hover {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-3);
  color: var(--sklearn-color-background);
  text-decoration: none;
}

/* Span, style for the box shown on hovering the info icon */
.sk-estimator-doc-link span {
  display: none;
  z-index: 9999;
  position: relative;
  font-weight: normal;
  right: .2ex;
  padding: .5ex;
  margin: .5ex;
  width: min-content;
  min-width: 20ex;
  max-width: 50ex;
  color: var(--sklearn-color-text);
  box-shadow: 2pt 2pt 4pt #999;
  /* unfitted */
  background: var(--sklearn-color-unfitted-level-0);
  border: .5pt solid var(--sklearn-color-unfitted-level-3);
}

.sk-estimator-doc-link.fitted span {
  /* fitted */
  background: var(--sklearn-color-fitted-level-0);
  border: var(--sklearn-color-fitted-level-3);
}

.sk-estimator-doc-link:hover span {
  display: block;
}

/* "?"-specific style due to the `<a>` HTML tag */

#sk-container-id-1 a.estimator_doc_link {
  float: right;
  font-size: 1rem;
  line-height: 1em;
  font-family: monospace;
  background-color: var(--sklearn-color-background);
  border-radius: 1rem;
  height: 1rem;
  width: 1rem;
  text-decoration: none;
  /* unfitted */
  color: var(--sklearn-color-unfitted-level-1);
  border: var(--sklearn-color-unfitted-level-1) 1pt solid;
}

#sk-container-id-1 a.estimator_doc_link.fitted {
  /* fitted */
  border: var(--sklearn-color-fitted-level-1) 1pt solid;
  color: var(--sklearn-color-fitted-level-1);
}

/* On hover */
#sk-container-id-1 a.estimator_doc_link:hover {
  /* unfitted */
  background-color: var(--sklearn-color-unfitted-level-3);
  color: var(--sklearn-color-background);
  text-decoration: none;
}

#sk-container-id-1 a.estimator_doc_link.fitted:hover {
  /* fitted */
  background-color: var(--sklearn-color-fitted-level-3);
}
</style><div id="sk-container-id-1" class="sk-top-container"><div class="sk-text-repr-fallback"><pre>LogisticRegression(max_iter=400, penalty=None)</pre><b>In a Jupyter environment, please rerun this cell to show the HTML representation or trust the notebook. <br />On GitHub, the HTML representation is unable to render, please try loading this page with nbviewer.org.</b></div><div class="sk-container" hidden><div class="sk-item"><div class="sk-estimator fitted sk-toggleable"><input class="sk-toggleable__control sk-hidden--visually" id="sk-estimator-id-1" type="checkbox" checked><label for="sk-estimator-id-1" class="sk-toggleable__label fitted sk-toggleable__label-arrow"><div><div>LogisticRegression</div></div><div><a class="sk-estimator-doc-link fitted" rel="noreferrer" target="_blank" href="https://scikit-learn.org/1.6/modules/generated/sklearn.linear_model.LogisticRegression.html">?<span>Documentation for LogisticRegression</span></a><span class="sk-estimator-doc-link fitted">i<span>Fitted</span></span></div></label><div class="sk-toggleable__content fitted"><pre>LogisticRegression(max_iter=400, penalty=None)</pre></div> </div></div></div></div>



Call the `.coef_` attribute on the model to get the coefficients of each variable.  The coefficients are in order of how the variables are listed in the dataset.  Remember that the coefficients represent the change in the **log odds** of the target variable for **every one unit increase in X**.

If you want, create a series whose index is the column names and whose values are the coefficients in `model.coef_`.


```python
clf.coef_
```




    array([[ 1.77539280e-03,  4.21897716e-04, -3.96405110e-04,
             1.32600757e-03,  7.22556637e-04, -1.90227715e-05,
             1.06794677e-04, -1.02885818e-01,  3.22953026e-05,
            -3.44871586e-02,  2.81182501e-02]])




```python
coef = pd.Series(clf.coef_[0],
                 index = X.columns)
coef
```




    drives                     0.001775
    total_sessions             0.000422
    n_days_after_onboarding   -0.000396
    total_navigations_fav1     0.001326
    total_navigations_fav2     0.000723
    driven_km_drives          -0.000019
    duration_minutes_drives    0.000107
    activity_days             -0.102886
    km_per_driving_day         0.000032
    professional_driver       -0.034487
    device2                    0.028118
    dtype: float64




```python
coef.to_csv('Waze Logistic Regression Variable Coefficients.csv')
```

Call the model's `intercept_` attribute to get the intercept of the model.


```python
clf.intercept_
```




    array([-0.07445633])



#### <a id='toc1_5_4_3_'></a>[**Check final assumption**](#toc0_)

Verify the linear relationship between X and the estimated log odds (known as logits) by making a regplot.

Call the model's `predict_proba()` method to generate the probability of response for each sample in the training data. (The training data is the argument to the method.) Assign the result to a variable called `training_probabilities`. This results in a 2-D array where each row represents a user in `X_train`. The first column is the probability of the user not churning, and the second column is the probability of the user churning.


```python
# Get the predicted probabilities of the training data
training_probabilities = clf.predict_proba(X_train)
training_probabilities
```




    array([[0.93524075, 0.06475925],
           [0.72288458, 0.27711542],
           [0.97334983, 0.02665017],
           ...,
           [0.91817316, 0.08182684],
           [0.8507479 , 0.1492521 ],
           [0.93631738, 0.06368262]], shape=(11439, 2))



In logistic regression, the relationship between a predictor variable and the dependent variable does not need to be linear, however, the log-odds (a.k.a., logit) of the dependent variable with respect to the predictor variable should be linear. Here is the formula for calculating log-odds, where _p_ is the probability of response:
<br>
$$
logit(p) = ln(\frac{p}{1-p})
$$
<br>

1. Create a dataframe called `logit_data` that is a copy of `df`.

2. Create a new column called `logit` in the `logit_data` dataframe. The data in this column should represent the logit for each user.



```python
# 1. Copy the `X_train` dataframe and assign to `logit_data`
logit_data = X_train.copy()

# 2. Create a new `logit` column in the `logit_data` df
logit_data['logit'] = [np.log(prob[1] / prob[0]) for prob in training_probabilities]
```

Plot a regplot where the x-axis represents an independent variable and the y-axis represents the log-odds of the predicted probabilities.

In an exhaustive analysis, this would be plotted for each continuous or discrete predictor variable. Here we show only `activity_days`.


```python
# Plot regplot of `activity_days` log-odds
sns.regplot(x='activity_days', y='logit', data=logit_data, scatter_kws={'s': 2,
                                                                        'alpha': 0.5})
plt.title("Log-Odds - activity_days")
```




    Text(0.5, 1.0, 'Log-Odds - activity_days')




    
<img width="565" height="453" alt="Waze_Logistic_Regression_100_1" src="https://github.com/user-attachments/assets/bacbeb4a-bbc7-45ed-8027-bbcfe506a4e7" />

    


## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

### <a id='toc1_6_1_'></a>[**Task 4a. Results and evaluation**](#toc0_)

If the logistic assumptions are met, the model results can be appropriately interpreted.

Use the code block below to make predictions on the test data.



```python
y_pred = clf.predict(X_test)
```

Now, use the `score()` method on the model with `X_test` and `y_test` as its two arguments. The default score in scikit-learn is **accuracy**.  What is the accuracy of your model?

*Consider:  Is accuracy the best metric to use to evaluate this model?*


```python
clf.score(X_test, y_test)
```




    0.8269230769230769



### <a id='toc1_6_2_'></a>[**Task 4b. Show results with a confusion matrix**](#toc0_)

Use the `confusion_matrix` function to obtain a confusion matrix. Use `y_test` and `y_preds` as arguments.


```python
cm = confusion_matrix(y_test, y_pred, labels=clf.classes_)
```

Next, use the `ConfusionMatrixDisplay()` function to display the confusion matrix from the above cell, passing the confusion matrix you just created as its argument.


```python
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=clf.classes_)
disp.plot()
```




    <sklearn.metrics._plot.confusion_matrix.ConfusionMatrixDisplay at 0x24c1b032660>




    
<img width="516" height="432" alt="Waze_Logistic_Regression_111_1" src="https://github.com/user-attachments/assets/44f8406d-10e3-4196-a4ee-acfc19f8752f" />

    


You can use the confusion matrix to compute precision and recall manually. You can also use scikit-learn's [`classification_report()`](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.classification_report.html) function to generate a table from `y_test` and `y_preds`.


```python
precision = 50 / (50 + 38)
precision
```




    0.5681818181818182




```python
prec = cm[1,1] / (cm[0,1] + cm[1,1])
prec
```




    np.float64(0.5681818181818182)




```python
recall = 50 / (50 + 457)
recall
```




    0.09861932938856016




```python
rec = cm[1,1] / (cm[1,0] + cm[1,1])
rec
```




    np.float64(0.09861932938856016)




```python
target_labels = ['retained', 'churned']
print(classification_report(y_test, y_pred, target_names=target_labels))
```

                  precision    recall  f1-score   support
    
        retained       0.84      0.98      0.90      2353
         churned       0.57      0.10      0.17       507
    
        accuracy                           0.83      2860
       macro avg       0.70      0.54      0.54      2860
    weighted avg       0.79      0.83      0.77      2860
    
    

**Note:** The model has decent precision but very low recall, which means that it makes a lot of false negative predictions and fails to capture users who will churn.

### <a id='toc1_6_3_'></a>[**BONUS**](#toc0_)

Generate a bar graph of the model's coefficients for a visual representation of the importance of the model's features.


```python
# Create a list of (column_name, coefficient) tuples
coeff_list = list(zip(X_train.columns, clf.coef_[0]))

# Sort the list by coefficient value
coeff_list = sorted(coeff_list, key=lambda x: x[1], reverse=True)
coeff_list
```




    [('device2', np.float64(0.028118250093698532)),
     ('drives', np.float64(0.0017753927965677937)),
     ('total_navigations_fav1', np.float64(0.001326007572526119)),
     ('total_navigations_fav2', np.float64(0.0007225566369828804)),
     ('total_sessions', np.float64(0.0004218977161620086)),
     ('duration_minutes_drives', np.float64(0.00010679467709510079)),
     ('km_per_driving_day', np.float64(3.229530259700701e-05)),
     ('driven_km_drives', np.float64(-1.9022771505575278e-05)),
     ('n_days_after_onboarding', np.float64(-0.0003964051095000133)),
     ('professional_driver', np.float64(-0.03448715857675381)),
     ('activity_days', np.float64(-0.1028858181622794))]




```python
# Plot the feature importances
plt.figure(figsize=(8,6))
sns.barplot(x=[x[1] for x in coeff_list],
            y=[x[0] for x in coeff_list],
            orient='h')
plt.xlabel("Coefficient Value")
plt.title("Logistic Regression Feature Importance")
plt.show()
```


    
<img width="824" height="545" alt="Waze_Logistic_Regression_121_0" src="https://github.com/user-attachments/assets/e62c641c-9193-4ee5-b0cc-de992ef33b49" />

    


### <a id='toc1_6_4_'></a>[**Task 4c. Conclusion**](#toc0_)

Now that you've built your regression model, the next step is to share your findings with the Waze leadership team. Consider the following questions as you prepare to write your executive summary. Think about key points you may want to share with the team, and what information is most relevant to the user churn project.

**Questions:**

1. What variable most influenced the model's prediction? How? Was this surprising?

2. Were there any variables that you expected to be stronger predictors than they were?

3. Why might a variable you thought to be important not be important in the model?

4. Would you recommend that Waze use this model? Why or why not?

5. What could you do to improve this model?

6. What additional features would you like to have to help improve the model?

**Answer:**

1. From the feature importance plot `activity_days` was the biggest influence to the models predictions, this is not surprising as this variable was very strongly correlated with `driving_days` which from the EDA we know has a negative correlation with churn.
   
2. Yes, I was expecting the engineered variable `km_per_driving_day` to be higher on the feature importance plot but was one of the lowest. This is a surprise as in the previous EDA, as the user churn rate increased so did the values in `km_per_driving_day`. In the correlation heatmap from earlier, this variable had a positive correlation with the target variable that was one of the strongest out of all the independent variables by a large margin. In the Logistic regression it was the second least important variable.
   
3. In a multiple logistic regression model, features can interact with each other and these interactions can result in seemingly counterintuitive relationships. This is both a strength and a weakness of predictive models, as capturing these interactions typically makes a model more predictive while at the same time making the model more difficult to explain.
   
4. In regards as to if I would recommend this model to be used, it is dependent on what the model will be used for. If the model is to be used and implemented into Waze and thereby used to inform subsequent business decisions, then I would not recommend it for use. This is due to the model not being a strong predictor as evident in the models poor recall score, confusion matrix results and classification report. On the other hand, if the model was to be only used to guide further exploratory efforts then it therefore has intrensnic value.
   
5. Actions taken to improve the model could be the engineering of new features to attempt to generate a better predictive signal, as is often the case when you have domain knowledge. In regards to this model, one of the engineered features (`professional_driver`) was the third most predictive predictor in the model, as evident on the feature importance plot. It could also be useful to scale the independent variables, and to reconstruct the model with different combinations of the predictor variables in order to reduce the noise from the unpredictive features.
   
6. Additional features I would like to have in order to improve the model are drive-level information for each user, such as drive times, geographic locations, etc. It would also be useful to have more granular data to know how users interact with the app. An example of this is how often do users report or confirm road hazard alerts/traffic/construction works? Finally, it would be helpful to obtain the monthly count of unique starting and ending locations that each driver inputs.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged. 

