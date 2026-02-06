# <a id='toc1_'></a>[**Waze_Hypothesis_Test**](#toc0_)

**Course 4 - The Power of Statistics**

**Table of contents**<a id='toc0_'></a>    
- [**Waze_Hypothesis_Test**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Sylvester Esperanza, Senior Project Manager**](#toc1_1_1_)    
    - [**Email from May Santner, Data Analysis Manager**](#toc1_1_2_)    
    - [**Email from Chidi Ga, Senior Data Analyst**](#toc1_1_3_)    
    - [**Email from Harriet Hadzic, Director of Data Analysis**](#toc1_1_4_)    
    - [**Email from Chidi Ga, Senior Data Analyst**](#toc1_1_5_)    
    - [**Data Dictionary**](#toc1_1_6_)    
    - [**Objectives**](#toc1_1_7_)    
  - [**Data exploration and hypothesis testing**](#toc1_2_)    
  - [**PACE Stages**](#toc1_3_)    
  - [**PACE:Plan**](#toc1_4_)    
    - [**Task 1. Imports and data loading**](#toc1_4_1_)    
  - [**PACE: Analyze and Construct**](#toc1_5_)    
    - [**Task 2. Data exploration**](#toc1_5_1_)    
    - [**Task 3. Hypothesis testing**](#toc1_5_2_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Task 4. Communicate insights with stakeholders**](#toc1_6_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

Your Waze team is nearing the midpoint of their project to develop a machine learning model to predict user churn. So far, you’ve completed a project proposal, and used Python to explore and analyze Waze’s user data. You’ve also used Python to create data visualizations. The next step is to use statistical methods to analyze and interpret your data. 

You receive a new email from Sylvester Esperanza, your project manager. Sylvester tells your team about a new request from leadership: to analyze the relationship between mean amount of rides and device type. You also discover follow-up emails from three other team members: May Santner, Chidi Ga, and Harriet Hadzic. These emails discuss the details of the analysis. A final email from Chidi includes your specific assignment: to conduct a two-sample hypothesis test. 

### <a id='toc1_1_1_'></a>[**Email from Sylvester Esperanza, Senior Project Manager**](#toc0_)

**Subject:** New Request - Analyze rides based on device type

**From:** "Sylvester Esperanza," Sylvester@Waze

**Cc:** "May Santner," May@waze, "Harriet Hadzic," Harriet@waze, "Chidi Ga," Chidi@waze

Hello, data team! 

Excellent work so far. The leadership team is impressed with the results, especially the analysis on the last report! 

On that note, they have requested a new deliverable be added to the initial project scope. They would like a statistical analysis of ride data based on device type. In particular, leadership wants to know if there is a statistically significant difference in mean amount of rides between iPhone® users and Android™ users. 

Should you conclude that the difference in mean amount of rides between iPhone users and Android users is statistically significant, please discuss next steps: what are your thoughts on strategies our team could implement to address these differences, such as improving user experience on a specific device? 

Many thanks! 

Sylvester Esperanza

Senior Project Manager

Waze

### <a id='toc1_1_2_'></a>[**Email from May Santner, Data Analysis Manager**](#toc0_)

**Subject:** RE: New Request - Analyze rides based on device type

**From:** "May Santner," May@waze

**Cc:** "Harriet Hadzic," Harriet@waze, "Chidi Ga," Chidi@waze, "Sylvester Esperanza," Sylvester@Waze

Thanks, Sylvester. 

It’s great to hear leadership is happy. I’m reminded again what a great data team we have! 

Please tell leadership we will provide them with this analysis in two weeks time. 

@Chidi, my initial thought is for us to conduct a two-sample t-test to analyze the difference in the mean amount of rides between iPhone users and Android users. What do you think? 

Thanks, 

May Santner

Data Analysis Manager

Waze

### <a id='toc1_1_3_'></a>[**Email from Chidi Ga, Senior Data Analyst**](#toc0_)

**Subject:** RE: New Request - Analyze rides based on device type

**From:** "Chidi Ga," Chidi@waze

**Cc:** "May Santner," May@waze, "Harriet Hadzic," Harriet@waze, "Sylvester Esperanza," Sylvester@Waze

Hi all, 

@May, I agree with you on hypothesis testing. We’ll share a summary of the results before we present to leadership. 

We’ll get started right away. 

Thank you,

Chidi Ga

Senior Data Analyst

Waze

### <a id='toc1_1_4_'></a>[**Email from Harriet Hadzic, Director of Data Analysis**](#toc0_)

**Subject:** New Request - Analyze rides based on device type

**From:** "Harriet Hadzic," Harriet@waze

**Cc:** "May Santner," May@waze, "Chidi Ga," Chidi@Waze, "Sylvester Esperanza," Sylvester@Waze

I support this plan of action. Thank you all. 

Harriet Hadzic

Director of Data Analysis

Waze

### <a id='toc1_1_5_'></a>[**Email from Chidi Ga, Senior Data Analyst**](#toc0_)

**Subject:** New Request - Analyze rides based on device type

**From:** "Chidi Ga," Chidi@waze

Hi there, fellow data guru! 

You’ve been handling all of this work really well, by the way. Excellent job. 

I was wondering if you’d like to try the hypothesis test on the user data yourself? Based on what you’ve shared with me, I’m confident you have all the skills and experience needed for this task. 

What do you think? 

Also, as I said in my email to May, you’ll need to draft an executive summary of the results to share with Harriet and the rest of the leadership team. 

Thanks so much! 

Chidi Ga

Senior Data Analyst

Waze

*"You can have data without information, but you cannot have information without data"*

--*Daniel Keys Moran*

### <a id='toc1_1_6_'></a>[**Data Dictionary**](#toc0_)

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


### <a id='toc1_1_7_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to demostrate knowledge of how to conduct a two-sample hypothesis test.

**The goal** is to apply descriptive statistics and hypothesis testing in Python.

*This activity has three parts:*

**Part 1:** Imports and data loading
* What data packages will be necessary for hypothesis testing?

**Part 2:** Conduct hypothesis testing
* How did computing descriptive statistics help you analyze your data?

* How did you formulate your null hypothesis and alternative hypothesis?

**Part 3:** Communicate insights with stakeholders

* What key business insight(s) emerged from your hypothesis test?

* What business recommendations do you propose based on your results?

<br/>


Follow the instructions and answer the questions below to complete the activity. Then, you will complete an Executive Summary using the questions listed on the PACE Strategy Document.

## <a id='toc1_2_'></a>[**Data exploration and hypothesis testing**](#toc0_)

## <a id='toc1_3_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_4_'></a>[**PACE:Plan**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:
1. What is your research question for this data project? Later on, you will need to formulate the null and alternative hypotheses as the first step of your hypothesis test. Consider your research question now, at the start of this task.

**Answer**

Is there a statistically significant difference in the mean amount of rides between iPhone users and Android users?

### <a id='toc1_4_1_'></a>[**Task 1. Imports and data loading**](#toc0_)

Import packages and libraries needed to compute descriptive statistics and conduct a hypothesis test.


```python
import pandas as pd
from scipy import stats
```

Import the dataset.


```python
df = pd.read_csv('waze_dataset.csv')
```

## <a id='toc1_5_'></a>[**PACE: Analyze and Construct**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:
1. Data professionals use descriptive statistics for exploratory data analysis (EDA). How can computing descriptive statistics help you learn more about your data in this stage of your analysis?

**Answer**

Computing descriptive statistics helps to discover the central tendency, dispersion and position of the data.

### <a id='toc1_5_1_'></a>[**Task 2. Data exploration**](#toc0_)

Use descriptive statistics to conduct exploratory data analysis (EDA).

**Note:** In the dataset, `device` is a categorical variable with the labels `iPhone` and `Android`.

In order to perform this analysis, you must turn each label into an integer.  The following code assigns a `1` for an `iPhone` user and a `2` for `Android`.  It assigns this label back to the variable `device_new`.

**Note:** Creating a new variable is ideal so that you don't overwrite original data.

1. Create a dictionary called `map_dictionary` that contains the class labels (`'Android'` and `'iPhone'`) for keys and the values you want to convert them to (`2` and `1`) as values.

2. Create a new column called `device_type` that is a copy of the `device` column.

3. Use the [`map()`](https://pandas.pydata.org/docs/reference/api/pandas.Series.map.html#pandas-series-map) method on the `device_type` series. Pass `map_dictionary` as its argument. Reassign the result back to the `device_type` series.
</br></br>
When you pass a dictionary to the `Series.map()` method, it will replace the data in the series where that data matches the dictionary's keys. The values that get imputed are the values of the dictionary.

```
Example:
df['column']
```

|column |
|  :-:       |
| A     |
| B     |
| A     |
| B     |

```
map_dictionary = {'A': 2, 'B': 1}
df['column'] = df['column'].map(map_dictionary)
df['column']
```

|column |
|  :-: |
| 2    |
| 1    |
| 2    |
| 1    |



```python
map_dictionary = {'iPhone': 1,
                  'Android': 2}
df['device_type'] = df['device'].copy()
df['device_type'] = df['device_type'].map(map_dictionary)
```

You are interested in the relationship between device type and the number of drives. One approach is to look at the average number of drives for each device type. Calculate these averages.


```python
df.groupby(df['device_type'])['drives'].mean()
```




    device_type
    1    67.859078
    2    66.231838
    Name: drives, dtype: float64



**Samples**


```python
iphone = df[df['device_type'] == 1]
android = df[df['device_type'] == 2]

iphone_sample = iphone.sample(n=20, random_state=42, replace=True)
android_sample = android.sample(n=20, random_state=42, replace=True)

print(f"iPhone Sample Mean = ", iphone_sample['drives'].mean())
print()
print(f"Android Sample Mean = ", android_sample['drives'].mean())
```

    iPhone Sample Mean =  80.85
    
    Android Sample Mean =  61.7
    

Based on the averages shown, it appears that drivers who use an iPhone device to interact with the application have a higher number of drives on average. However, this difference might arise from random sampling, rather than being a true difference in the number of drives. To assess whether the difference is statistically significant, you can conduct a hypothesis test.

### <a id='toc1_5_2_'></a>[**Task 3. Hypothesis testing**](#toc0_)

Your goal is to conduct a two-sample t-test. Recall the steps for conducting a hypothesis test:


1.   State the null hypothesis and the alternative hypothesis
2.   Choose a signficance level
3.   Find the p-value
4.   Reject or fail to reject the null hypothesis

**Note:** This is a t-test for two independent samples. This is the appropriate test since the two groups are independent (Android users vs. iPhone users).

Recall the difference between the null hypothesis ($H_0$) and the alternative hypothesis ($H_A$).

**Question:** What are your hypotheses for this data project?

**Answer**

$H_0$: There is no statisticaly significant difference in the mean drives between device users.

$H_a$: There is a statistically significant difference in the mean drives between device users.

Next, choose 5% as the significance level and proceed with a two-sample t-test.

You can use the `stats.ttest_ind()` function to perform the test.


**Technical note**: The default for the argument `equal_var` in `stats.ttest_ind()` is `True`, which assumes population variances are equal. This equal variance assumption might not hold in practice (that is, there is no strong reason to assume that the two groups have the same variance); you can relax this assumption by setting `equal_var` to `False`, and `stats.ttest_ind()` will perform the unequal variances $t$-test (known as Welch's `t`-test). Refer to the [scipy t-test documentation](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.ttest_ind.html) for more information.


1. Isolate the `drives` column for iPhone users.
2. Isolate the `drives` column for Android users.
3. Perform the t-test

$$
t = \frac{(\bar{x_1} - \bar{x_2})}{\sqrt{(\frac{s^2_1}{n_1}+\frac{s^2_2}{n_2})}}
$$

$\bar{x_1}$, $\bar{x_2}$ = Sample Means

$n_1$, $n_2$ = Sample Sizes

$s^2_1$, $s^2_2$ = Sample Variances


```python
iphone_drives = iphone_sample['drives']
android_drives = android_sample['drives']
```


```python
stats.ttest_ind(a=iphone_drives, b=android_drives, equal_var=False)
```




    TtestResult(statistic=np.float64(1.0275632679158548), pvalue=np.float64(0.311805450436491), df=np.float64(32.231358854895525))




```python
tstat, pvalue = stats.ttest_ind(a=iphone_drives,
                                b=android_drives,
                                equal_var=False)
print(f"t-test Statistic:", tstat)
print()
print(f'P-Value:', pvalue)
```

    t-test Statistic: 1.0275632679158548
    
    P-Value: 0.311805450436491
    

**Question:** Based on the p-value you got above, do you reject or fail to reject the null hypothesis?

**Answer**

The P-Value is 0.31 and so is greater than the significance level of 5% and so we fail to reject the hypothesis. Therefore, there is no statistically significant difference between the mean number of drives between drivers who use iPhone and drivers who use Androids.

## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

### <a id='toc1_6_1_'></a>[**Task 4. Communicate insights with stakeholders**](#toc0_)

Now that you've completed your hypothesis test, the next step is to share your findings with the Waze leadership team. Consider the following question as you prepare to write your executive summary:

* What business insight(s) can you draw from the result of your hypothesis test?

The key business insight that was revealed from this hypothesis test is that the drivers who use iPhone devices have on average a similar number of drives as those who use Android devices.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.
