# <a id='toc1_'></a>[**Automatidata_Hypothesis_Test**](#toc0_)

**Course 4 - The Power of Statistics**

**Table of contents**<a id='toc0_'></a>    
- [**Automatidata_Hypothesis_Test**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Uli King, Senior Project Manager**](#toc1_1_1_)    
    - [**Email from Deshawn Washington, Data Analysis Manager**](#toc1_1_2_)    
    - [**Email from Luana Rodriguez, Senior Data Analyst**](#toc1_1_3_)    
    - [**Email from Udo Bankole, Senior Data Analyst**](#toc1_1_4_)    
    - [**Email from Luana Rodriguez, Senior Data Analyst**](#toc1_1_5_)    
    - [**Data Dictionary**](#toc1_1_6_)    
    - [**Objectives**](#toc1_1_7_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE: Plan**](#toc1_3_)    
    - [**Task 1. Imports and data loading**](#toc1_3_1_)    
  - [**PACE: Analyze and Construct**](#toc1_4_)    
    - [**Task 2. Data exploration**](#toc1_4_1_)    
    - [**Task 3. Hypothesis testing**](#toc1_4_2_)    
  - [**PACE: Execute**](#toc1_5_)    
    - [**Task 4. Communicate insights with stakeholders**](#toc1_5_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

Your team at Automatidata is nearing the midpoint of their project for the New York City Taxi & Limousine Commission (TLC). So far, you've completed a project proposal and
used Python to explore and analyze the TLC dataset. You've also used both Python and Tableau to create data visualizations. The next step is to use statistical methods to
analyze and interpret your data.

You receive a new email from Uli King, Automatidata's project manager. Uli tells your team about a new request from the New York City TLC: to analyze the relationship between
fare amount and payment type. You also discover follow-up emails from three other team members: Deshawn Washington, Luana Rodriguez, and Udo Bankole. These emails
discuss the details of the analysis. A final email from Luana includes your specific assignment: to conduct an A/B test.

***Notes on the fictional nature of this project and data assumptions:***

*Please note the following considerations when preparing your project. When making data-driven inferences in your professional lives, you will need to perform comprehensive Exploratory Data Analysis and cross-check your own data sources and self-made assumptions. As outlined in the following notes, there is often a gap between theory and practice.*

* The team member names used in this workplace scenario are fictional and are not representative of the New York City TLC.
* The following scenario asks you to conduct an A/B test. An A/B test can only be performed in an experiment with randomly selected groups. In this scenario, this project makes the claim that (fictitiously) randomly grouped riders were asked to pay with a certain payment type in order to make data-driven inferences.
* All riders are assumed to be able to pay with cash or card (in practice, riders might not carry cash and have to pay with card, or vice versa).

### <a id='toc1_1_1_'></a>[**Email from Uli King, Senior Project Manager**](#toc0_)

**Subject:** New TLC Request - Taxi Tips Data

**From:** "Uli King" Uli@automatidata.com

**Cc:** "Deshawn Washington" Deshawn@automatidata.com, "Udo Bankole" Udo@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com

Hello Data Team! 

Really excellent work so far. Everyone over at New York City TLC is impressed with the results–especially the analysis on the last report! Thanks so much for the hard work. 

On that note, they have requested an additional item to be added to the initial project scope. They would like a detailed statistical analysis of payment type. That is, do the customers who use a credit card pay higher fare amounts than those who use cash? 

That said, the New York City TLC team is asking us to consider the following: 

* The relationship between fare amount and payment type. 

* Test the hypothesis that customers who use a credit card pay higher fare amounts.

* Should you conclude that there is a statistically significant relationship between credit card payment and fare amount, discuss what the next steps should be: what are your thoughts on strategies our team could implement to encourage customers to pay with credit card?

Many thanks! 

Uli King

Senior Project Manager

Automatidata

### <a id='toc1_1_2_'></a>[**Email from Deshawn Washington, Data Analysis Manager**](#toc0_)

**Subject:** RE: New TLC Request - Taxi Tips Data

**From:** "Deshawn Washington" Deshawn@automatidata.com

**Cc:** "Udo Bankole" Udo@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com, "Uli King" Uli@automatidata.com

Thanks, Uli. 

It’s great to hear the client is happy. I’m reminded again what a great data team we have! 

If you would, please tell the client we will be providing them with this analysis in two weeks’ time. 

@Luana, my initial thought is for us to conduct an A/B test to analyze the relationship between fare amount and payment type. What do you think? 

Thanks, 

Deshawn Washington

Data Analysis Manager

Automatidata

### <a id='toc1_1_3_'></a>[**Email from Luana Rodriguez, Senior Data Analyst**](#toc0_)

**Subject:** RE: New TLC Request - Taxi Tips Data

**From:** "Luana, Rodriguez" Luana@automatidata.com

**Cc:** "Udo Bankole" Udo@automatidata.com, "Uli King" Uli@automatidata.com, "Deshawn Washington" Deshawn@automatidata.com

Hi all, 

@Deshawn, I agree with you on the A/B testing. We’ll share a summary of the results with Uli before he presents it to the client. 

We’ll get started right away. 

Thank you,

Luana Rodriguez

Senior Data Analyst

Automatidata

### <a id='toc1_1_4_'></a>[**Email from Udo Bankole, Senior Data Analyst**](#toc0_)

**Subject:** RE: New TLC Request - Taxi Tips Data

**From:** "Udo Bankole" Udo@automatidata.com

**Cc:** "Uli King" Uli@automatidata.com, "Deshawn Washington" Deshawn@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com


I support the path forward. Thank you all. 

Udo Bankole

Senior Data Analyst

Automatidata

### <a id='toc1_1_5_'></a>[**Email from Luana Rodriguez, Senior Data Analyst**](#toc0_)

**Subject:** RE: New TLC Request - Taxi Tips Data

**From:** "Luana, Rodriguez" Luana@automatidata.com

**Cc:** 

Hi there, fellow data virtuoso! 

You’ve been handling all of this work really well, by the way. Excellent job. 

I was wondering if you’d like to try the A/B test on the TLC data yourself? Based on what you’ve shared with me, I have every confidence you already have all the skills and experience needed for this task. 

What do you think? Would you like to give it a go? 

Also, like I said in my email to Deshawn, you’ll need to write an executive summary of the results so we can present it to Udo before he shares it with the client. 

Thanks so much! 

Luana Rodriguez

Senior Data Analyst

Automatidata

*"You can have data without information, but you cannot have information without data.*

### <a id='toc1_1_6_'></a>[**Data Dictionary**](#toc0_)

This project uses a dataset called `2017_Yellow_Taxi_Trip_Data`. It contains data gathered by the New York City Taxi & Limousine Commission. For each trip, there are many different data variables gathered.

**22,699 rows** - Each row represents a different trip

**18 columns**

| Column Name | Description |
|------------|-------------|
| ID | Trip identification number |
| VendorID | Code indicating the TPEP provider that provided the record (**1 = Creative Mobile Technologies, LLC**; **2 = VeriFone Inc.**) |
| tpep_pickup_datetime | Date and time when the meter was engaged |
| tpep_dropoff_datetime | Date and time when the meter was disengaged |
| Passenger_count | Number of passengers in the vehicle (driver-entered value) |
| Trip_distance | Elapsed trip distance in miles reported by the taximeter |
| PULocationID | TLC Taxi Zone where the taximeter was engaged |
| DOLocationID | TLC Taxi Zone where the taximeter was disengaged |
| RateCodeID | Final rate code at end of trip (**1 = Standard rate**; **2 = JFK**; **3 = Newark**; **4 = Nassau/Westchester**; **5 = Negotiated fare**; **6 = Group ride**) |
| Store_and_fwd_flag | Indicates if trip record was stored in vehicle memory before being sent to vendor (**Y = store and forward**; **N = not store and forward**) |
| Payment_type | Payment method code (**1 = Credit card**; **2 = Cash**; **3 = No charge**; **4 = Dispute**; **5 = Unknown**; **6 = Voided trip**) |
| Fare_amount | Time-and-distance fare calculated by the meter |
| Extra | Miscellaneous extras and surcharges (e.g., rush hour and overnight charges) |
| MTA_tax | $0.50 MTA tax automatically triggered based on metered rate |
| Improvement_surcharge | $0.30 improvement surcharge assessed at flag drop (introduced in 2015) |
| Tip_amount | Tip amount (automatically populated for credit card tips; cash tips not included) |
| Tolls_amount | Total tolls paid during the trip |
| Total_amount | Total amount charged to passengers (excluding cash tips) |

### <a id='toc1_1_7_'></a>[**Objectives**](#toc0_)

In this activity, you will practice using statistics to analyze and interpret data. The activity covers fundamental concepts such as descriptive statistics and hypothesis testing. You will explore the data provided and conduct A/B and hypothesis testing.

**The purpose** of this project is to demostrate knowledge of how to prepare, create, and analyze A/B tests. Your A/B test results should aim to find ways to generate more revenue for taxi cab drivers.

**The goal** is to apply descriptive statistics and hypothesis testing in Python. The goal for this A/B test is to sample data and analyze whether there is a relationship between payment type and fare amount. For example: discover if customers who use credit cards pay higher fare amounts than customers who use cash.

**Note:** For the purpose of this exercise, assume that the sample data comes from an experiment in which customers are randomly selected and divided into two groups:

1) customers who are required to pay with credit card
   
2) customers who are required to pay with cash. Without this assumption, we cannot draw causal conclusions about how payment method affects fare amount.

*This activity has four parts:*

**Part 1:** Imports and data loading
* What data packages will be necessary for hypothesis testing?

**Part 2:** Conduct EDA and hypothesis testing
* How did computing descriptive statistics help you analyze your data? 

* How did you formulate your null hypothesis and alternative hypothesis? 

**Part 3:** Communicate insights with stakeholders

* What key business insight(s) emerged from your A/B test?

* What business recommendations do you propose based on your results?

Follow the instructions and answer the questions below to complete the activity. Then, you will complete an Executive Summary using the questions listed on the PACE Strategy Document.

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE: Plan**](#toc0_)

In this stage, consider the following questions where applicable to complete your code response:

1. What is your research question for this data project? Later on, you will need to formulate the null and alternative hypotheses as the first step of your hypothesis test. Consider your research question now, at the start of this task.

**Answer:**

The research question is: Is there a statistiaclly significant difference in the fare amount charged for the different payment types?

*Complete the following steps to perform statistical analysis of your data:* 

### <a id='toc1_3_1_'></a>[**Task 1. Imports and data loading**](#toc0_)


```python
import pandas as pd
import numpy as np
from scipy import stats
```


```python
# Load dataset into dataframe
taxi_data = pd.read_csv("2017_Yellow_Taxi_Trip_Data.csv", index_col = 0)
```

## <a id='toc1_4_'></a>[**PACE: Analyze and Construct**](#toc0_)

In this stage, consider the following questions where applicable to complete your code response:

1. Data professionals use descriptive statistics for Exploratory Data Analysis. How can computing descriptive statistics help you learn more about your data in this stage of your analysis?

**Answer:**

By computing descriptive statistics we can observe the measures of central tendency, dispersion and position of the dataset. This can provides us with valuable insights into the data including the identification of outliers, distributions, etc.

### <a id='toc1_4_1_'></a>[**Task 2. Data exploration**](#toc0_)

Use descriptive statistics to conduct Exploratory Data Analysis (EDA). 

**Note:** In the dataset, `payment_type` is encoded in integers:

*   1: Credit card
*   2: Cash
*   3: No charge
*   4: Dispute
*   5: Unknown


```python
taxi_data.describe()
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
      <th>VendorID</th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>RatecodeID</th>
      <th>PULocationID</th>
      <th>DOLocationID</th>
      <th>payment_type</th>
      <th>fare_amount</th>
      <th>extra</th>
      <th>mta_tax</th>
      <th>tip_amount</th>
      <th>tolls_amount</th>
      <th>improvement_surcharge</th>
      <th>total_amount</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
      <td>22699.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1.556236</td>
      <td>1.642319</td>
      <td>2.913313</td>
      <td>1.043394</td>
      <td>162.412353</td>
      <td>161.527997</td>
      <td>1.336887</td>
      <td>13.026629</td>
      <td>0.333275</td>
      <td>0.497445</td>
      <td>1.835781</td>
      <td>0.312542</td>
      <td>0.299551</td>
      <td>16.310502</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.496838</td>
      <td>1.285231</td>
      <td>3.653171</td>
      <td>0.708391</td>
      <td>66.633373</td>
      <td>70.139691</td>
      <td>0.496211</td>
      <td>13.243791</td>
      <td>0.463097</td>
      <td>0.039465</td>
      <td>2.800626</td>
      <td>1.399212</td>
      <td>0.015673</td>
      <td>16.097295</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>-120.000000</td>
      <td>-1.000000</td>
      <td>-0.500000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>-0.300000</td>
      <td>-120.300000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>0.990000</td>
      <td>1.000000</td>
      <td>114.000000</td>
      <td>112.000000</td>
      <td>1.000000</td>
      <td>6.500000</td>
      <td>0.000000</td>
      <td>0.500000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.300000</td>
      <td>8.750000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>2.000000</td>
      <td>1.000000</td>
      <td>1.610000</td>
      <td>1.000000</td>
      <td>162.000000</td>
      <td>162.000000</td>
      <td>1.000000</td>
      <td>9.500000</td>
      <td>0.000000</td>
      <td>0.500000</td>
      <td>1.350000</td>
      <td>0.000000</td>
      <td>0.300000</td>
      <td>11.800000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2.000000</td>
      <td>2.000000</td>
      <td>3.060000</td>
      <td>1.000000</td>
      <td>233.000000</td>
      <td>233.000000</td>
      <td>2.000000</td>
      <td>14.500000</td>
      <td>0.500000</td>
      <td>0.500000</td>
      <td>2.450000</td>
      <td>0.000000</td>
      <td>0.300000</td>
      <td>17.800000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2.000000</td>
      <td>6.000000</td>
      <td>33.960000</td>
      <td>99.000000</td>
      <td>265.000000</td>
      <td>265.000000</td>
      <td>4.000000</td>
      <td>999.990000</td>
      <td>4.500000</td>
      <td>0.500000</td>
      <td>200.000000</td>
      <td>19.100000</td>
      <td>0.300000</td>
      <td>1200.290000</td>
    </tr>
  </tbody>
</table>
</div>



You are interested in the relationship between payment type and the fare amount the customer pays. One approach is to look at the average fare amount for each payment type. 


```python
taxi_data.groupby(['payment_type'])[['fare_amount']].mean()
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
      <th>fare_amount</th>
    </tr>
    <tr>
      <th>payment_type</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>13.429748</td>
    </tr>
    <tr>
      <th>2</th>
      <td>12.213546</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12.186116</td>
    </tr>
    <tr>
      <th>4</th>
      <td>9.913043</td>
    </tr>
  </tbody>
</table>
</div>



Based on the averages shown, it appears that customers who pay in credit card tend to pay a larger fare amount than customers who pay in cash. However, this difference might arise from random sampling, rather than being a true difference in fare amount. To assess whether the difference is statistically significant, you conduct a hypothesis test.

### <a id='toc1_4_2_'></a>[**Task 3. Hypothesis testing**](#toc0_)

Before you conduct your hypothesis test, consider the following questions where applicable to complete your code response:

1. Recall the difference between the null hypothesis and the alternative hypotheses. Consider your hypotheses for this project as listed below.

$H_0$: There is no difference in the average fare amount between customers who use credit cards and customers who use cash.

$H_A$: There is a difference in the average fare amount between customers who use credit cards and customers who use cash.

Your goal in this step is to conduct a two-sample t-test. Recall the steps for conducting a hypothesis test: 

1.   State the null hypothesis and the alternative hypothesis
2.   Choose a signficance level
3.   Find the p-value
4.   Reject or fail to reject the null hypothesis 

**Note:** For the purpose of this exercise, your hypothesis test is the main component of your A/B test. 

You choose 5% as the significance level and proceed with a two-sample t-test.

$$
t = \frac{(\bar{x_1} - \bar{x_2})}{\sqrt{(\frac{s^2_1}{n_1}+\frac{s^2_2}{n_2})}}
$$

$\bar{x_1}$, $\bar{x_2}$ = Sample Means

$n_1$, $n_2$ = Sample Sizes

$s^2_1$, $s^2_2$ = Sample Variances


```python
card = taxi_data[taxi_data['payment_type'] == 1]['fare_amount']
cash = taxi_data[taxi_data['payment_type'] == 2]['fare_amount']
```


```python
tstat, pvalue = stats.ttest_ind(a=card, b=cash, equal_var=False)
print(f'T-Test Statistic:', tstat)
print(f'P-Value:', pvalue)
```

    T-Test Statistic: 6.866800855655372
    P-Value: 6.797387473030518e-12
    

**Answer:**

With the P-Value being smaller than our significance level of 0.05, we therefore reject the null hypothesis and conclude that there is a statistically significant difference in the mean fare amount between customers who pay by card and customers who pay by cash.

## <a id='toc1_5_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

### <a id='toc1_5_1_'></a>[**Task 4. Communicate insights with stakeholders**](#toc0_)

*Ask yourself the following questions:*

1. What business insight(s) can you draw from the result of your hypothesis test?
2. Consider why this A/B test project might not be realistic, and what assumptions had to be made for this educational project.

**Answer:**

1. The business insights that I can infer from the results of the two-sample hypothesis test is that there is a statistically significant difference in the average fare amount between customers who pay by card and those who pay by cash, with the average fare amount for card payments being higher than those with cash. Therefore, by encouraging the customers to pay via card can increase the revenue for the taxi drivers.

2. This A/B Test project may not be realistic due to the fact that the passengers in both of the groups was not actually forced to pay either by card or by cash but rather they made the decision themselves. Therefore, this lead to an assumption being made to randomly group the data via filtered subsets for the type of payment. Thereby, additional factors are not taken into consideration as to why the customers chose the payment method they did, such as some customers carrying a small amount of cash and so paying for a long journey is easier by card. This scenario would indicate that it is fare more plausible that the fare amount is the determining factor for the customers payment type rather than the payment type being the determing factor. Additionally, if the customer has an AMEX card a lot of taxi's do not accept these cards due to the fees associated with them which could lead to the customer paying in cash.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.
