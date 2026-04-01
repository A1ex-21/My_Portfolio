# <a id='toc1_'></a>[**Automatidata_Multiple_Linear Regression**](#toc0_)

**Course 5 - Regression Analysis: Simplify complex data relationships**

**Table of contents**<a id='toc0_'></a>    
- [**Automatidata_Multiple_Linear Regression**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Titus Nelson, Operations Manager (NYC TLC)**](#toc1_1_1_)    
    - [**Email from Deshawn Washington, Data Analysis Manager (Automatidata)**](#toc1_1_2_)    
    - [**Email from Deshawn Washington, Data Analysis Manager (Automatidata)**](#toc1_1_3_)    
    - [**Data Dictionary**](#toc1_1_4_)    
    - [**Objectives**](#toc1_1_5_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE:Plan**](#toc1_3_)    
    - [**Task 1. Imports and loading**](#toc1_3_1_)    
  - [**PACE: Analyze**](#toc1_4_)    
    - [**Task 2a. Explore data with EDA**](#toc1_4_1_)    
    - [**Task 2b. Convert pickup & dropoff columns to datetime**](#toc1_4_2_)    
    - [**Task 2c. Create duration column**](#toc1_4_3_)    
    - [**Outliers**](#toc1_4_4_)    
    - [**Task 2d. Box plots**](#toc1_4_5_)    
    - [**Task 2e. Imputations**](#toc1_4_6_)    
      - [**`trip_distance` outliers**](#toc1_4_6_1_)    
      - [**`fare_amount` outliers**](#toc1_4_6_2_)    
      - [**`duration` outliers**](#toc1_4_6_3_)    
    - [**Task 3a. Feature engineering**](#toc1_4_7_)    
      - [Create `mean_distance` column](#toc1_4_7_1_)    
      - [**Create `mean_duration` column**](#toc1_4_7_2_)    
      - [**Create `day` and `month` columns**](#toc1_4_7_3_)    
      - [**Create `rush_hour` column**](#toc1_4_7_4_)    
    - [**Task 4. Scatter plot**](#toc1_4_8_)    
    - [**Task 5. Isolate modeling variables**](#toc1_4_9_)    
    - [**Task 6. Pair plot**](#toc1_4_10_)    
    - [**Task 7. Identify correlations**](#toc1_4_11_)    
  - [**PACE: Construct**](#toc1_5_)    
    - [**Task 8a. Split data into outcome variable and features**](#toc1_5_1_)    
    - [**Task 8b. Pre-process data**](#toc1_5_2_)    
    - [**Split data into training and test sets**](#toc1_5_3_)    
    - [**Standardize the data**](#toc1_5_4_)    
    - [**Fit the model**](#toc1_5_5_)    
    - [**Task 8c. Evaluate model**](#toc1_5_6_)    
    - [**Train data**](#toc1_5_7_)    
    - [**Test data**](#toc1_5_8_)    
    - [**Imputing the fare amount for Ratecode = 2**](#toc1_5_9_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Task 9a. Results**](#toc1_6_1_)    
    - [**Task 9b. Visualize model results**](#toc1_6_2_)    
    - [**Task 9c. Coefficients**](#toc1_6_3_)    
    - [**Task 9d. Conclusion**](#toc1_6_4_)    
  - [**Appendix**](#toc1_7_)    
    - [**Multiple Linear Regression Results**](#toc1_7_1_)    
    - [**Multiple Linear Regression Coefficients**](#toc1_7_2_)    
    - [**Models Predictions**](#toc1_7_3_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

The Automatidata team is more than halfway through their project for the New York City Taxi & Limousine Commission (TLC). Earlier, the team completed a project proposal, used Python to explore the data, create data visualizations and conducted statistical testing. Now, the New York City TLC wants your team to build a regression model for ride fares based on a variety of variables.

In your inbox you discover an email from Titus Nelson, the Operations Manager at the New York City TLC asking for details about regression modeling. You also notice two follow-up emails from your manager, Deshawn Washington. Review the emails, then follow the provided instructions to complete the PACE strategy document, the code notebook, and the executive summary. 

### <a id='toc1_1_1_'></a>[**Email from Titus Nelson, Operations Manager (NYC TLC)**](#toc0_)

**Subject:** Details on Regression Model

**From:** "Titus Nelson" Titus.Nelson@tlc.nyc

**Cc:** "Udo Bankole" Udo@automatidata.com, "Uli King" Uli@automatidata.com, "Deshawn Washington" Deshawn@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com

Hello Automatidata team,

I really appreciate your work, and thanks for the explanation of the next phase of the algorithm creation.

I was hoping to get a bit more detail on regression. Will you be applying a linear regression or a multiple regression model? It wasn’t clear in the meeting, and I wanted to be sure our teams are aligned on expectations. 

Thank you, 

Titus Nelson

Operations Manager

IT Division

NYC TLC

Learn more about [TLC’s accessible vehicle initiatives](https://www1.nyc.gov/site/tlc/about/accessibility.page)

### <a id='toc1_1_2_'></a>[**Email from Deshawn Washington, Data Analysis Manager (Automatidata)**](#toc0_)

**Subject:** RE: Details on Regression Phase

**From:** "Deshawn Washington" Deshawn@automatidata.com

**Cc:** "Udo Bankole" Udo@automatidata.com, "Uli King" Uli@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com, "Titus Nelson" Titus.Nelson@tlc.nyc

Thank you for your email, Titus. 

To answer your question, we will create and run a multiple linear regression (MLR) model to get the most accurate prediction because we want to predict ride fares based on multiple variables.

Our team will be working on getting you the results of the MLR model this week. 

Feel free to reach out with additional questions. 

Many thanks,

Deshawn Washington

Data Analysis Manager

Automatidata

### <a id='toc1_1_3_'></a>[**Email from Deshawn Washington, Data Analysis Manager (Automatidata)**](#toc0_)

**Subject:** RE: Details on Regression Phase

**From:** "Deshawn Washington" Deshawn@automatidata.com

**Cc:** "Luana, Rodriguez" Luana@automatidata.com

Hello my Data team! 

Would you two mind completing the following: 

* MLR model in a Python notebook
* Draft an executive summary of your results

I’d appreciate a chance to review it before you send it over to Uli, but write the summary as if you’re addressing the client. 

Best regards,

Deshawn Washington

Data Analysis Manager

Automatidata

### <a id='toc1_1_4_'></a>[**Data Dictionary**](#toc0_)

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

### <a id='toc1_1_5_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to demostrate knowledge of EDA and a multiple linear regression model

**The goal** is to build a multiple linear regression model and evaluate the model

*This activity has three parts:*

**Part 1:** EDA & Checking Model Assumptions
* What are some purposes of EDA before constructing a multiple linear regression model?

**Part 2:** Model Building and evaluation
* What resources do you find yourself using as you complete this stage?

**Part 3:** Interpreting Model Results

* What key insights emerged from your model(s)?

* What business recommendations do you propose based on the models built?

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE:Plan**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Plan stage.

### <a id='toc1_3_1_'></a>[**Task 1. Imports and loading**](#toc0_)
Import the packages that you've learned are needed for building linear regression models.


```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import datetime
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.outliers_influence import variance_inflation_factor
from statsmodels.tools.tools import add_constant
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
```


```python
df = pd.read_csv("2017_Yellow_Taxi_Trip_Data.csv")
```

## <a id='toc1_4_'></a>[**PACE: Analyze**](#toc0_)

In this stage, consider the following question where applicable to complete your code response:

* What are some purposes of EDA before constructing a multiple linear regression model?

**Answer:**

Some of the purposes of conducting EDA before implementing a multiple linear regression model is to understand the data in relation to the models assumptions. One such example, is the multiple linear regression assumption of linearity, and so through EDA we can see which variables have a linear relationship with each other. Additionally, EDA can be used to clean and prepare the data for modelling.

### <a id='toc1_4_1_'></a>[**Task 2a. Explore data with EDA**](#toc0_)

Analyze and discover data, looking for correlations, missing data, outliers, and duplicates.

Start with `.shape` and `.info()`.


```python
print(df.shape)
df.info()
```

    (22699, 18)
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 22699 entries, 0 to 22698
    Data columns (total 18 columns):
     #   Column                 Non-Null Count  Dtype  
    ---  ------                 --------------  -----  
     0   Unnamed: 0             22699 non-null  int64  
     1   VendorID               22699 non-null  int64  
     2   tpep_pickup_datetime   22699 non-null  object 
     3   tpep_dropoff_datetime  22699 non-null  object 
     4   passenger_count        22699 non-null  int64  
     5   trip_distance          22699 non-null  float64
     6   RatecodeID             22699 non-null  int64  
     7   store_and_fwd_flag     22699 non-null  object 
     8   PULocationID           22699 non-null  int64  
     9   DOLocationID           22699 non-null  int64  
     10  payment_type           22699 non-null  int64  
     11  fare_amount            22699 non-null  float64
     12  extra                  22699 non-null  float64
     13  mta_tax                22699 non-null  float64
     14  tip_amount             22699 non-null  float64
     15  tolls_amount           22699 non-null  float64
     16  improvement_surcharge  22699 non-null  float64
     17  total_amount           22699 non-null  float64
    dtypes: float64(8), int64(7), object(3)
    memory usage: 3.1+ MB
    

Check for missing data and duplicates using `.isna()` and `.drop_duplicates()`.


```python
df.drop_duplicates().shape
```




    (22699, 18)




```python
df.isna().sum()
```




    Unnamed: 0               0
    VendorID                 0
    tpep_pickup_datetime     0
    tpep_dropoff_datetime    0
    passenger_count          0
    trip_distance            0
    RatecodeID               0
    store_and_fwd_flag       0
    PULocationID             0
    DOLocationID             0
    payment_type             0
    fare_amount              0
    extra                    0
    mta_tax                  0
    tip_amount               0
    tolls_amount             0
    improvement_surcharge    0
    total_amount             0
    dtype: int64



There are no duplicate data in the dataset.

Use `.describe()`.


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
      <th>Unnamed: 0</th>
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
      <td>2.269900e+04</td>
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
      <td>5.675849e+07</td>
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
      <td>3.274493e+07</td>
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
      <td>1.212700e+04</td>
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
      <td>2.852056e+07</td>
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
      <td>5.673150e+07</td>
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
      <td>8.537452e+07</td>
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
      <td>1.134863e+08</td>
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



### <a id='toc1_4_2_'></a>[**Task 2b. Convert pickup & dropoff columns to datetime**](#toc0_)


```python
df.dtypes
```




    Unnamed: 0                 int64
    VendorID                   int64
    tpep_pickup_datetime      object
    tpep_dropoff_datetime     object
    passenger_count            int64
    trip_distance            float64
    RatecodeID                 int64
    store_and_fwd_flag        object
    PULocationID               int64
    DOLocationID               int64
    payment_type               int64
    fare_amount              float64
    extra                    float64
    mta_tax                  float64
    tip_amount               float64
    tolls_amount             float64
    improvement_surcharge    float64
    total_amount             float64
    dtype: object




```python
df['tpep_pickup_datetime'] = pd.to_datetime(df['tpep_pickup_datetime'])
df['tpep_dropoff_datetime'] = pd.to_datetime(df['tpep_dropoff_datetime'])
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
      <th>Unnamed: 0</th>
      <th>VendorID</th>
      <th>tpep_pickup_datetime</th>
      <th>tpep_dropoff_datetime</th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>RatecodeID</th>
      <th>store_and_fwd_flag</th>
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
      <th>0</th>
      <td>24870114</td>
      <td>2</td>
      <td>2017-03-25 08:55:43</td>
      <td>2017-03-25 09:09:47</td>
      <td>6</td>
      <td>3.34</td>
      <td>1</td>
      <td>N</td>
      <td>100</td>
      <td>231</td>
      <td>1</td>
      <td>13.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>2.76</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.56</td>
    </tr>
    <tr>
      <th>1</th>
      <td>35634249</td>
      <td>1</td>
      <td>2017-04-11 14:53:28</td>
      <td>2017-04-11 15:19:58</td>
      <td>1</td>
      <td>1.80</td>
      <td>1</td>
      <td>N</td>
      <td>186</td>
      <td>43</td>
      <td>1</td>
      <td>16.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>4.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>20.80</td>
    </tr>
    <tr>
      <th>2</th>
      <td>106203690</td>
      <td>1</td>
      <td>2017-12-15 07:26:56</td>
      <td>2017-12-15 07:34:08</td>
      <td>1</td>
      <td>1.00</td>
      <td>1</td>
      <td>N</td>
      <td>262</td>
      <td>236</td>
      <td>1</td>
      <td>6.5</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>1.45</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>8.75</td>
    </tr>
    <tr>
      <th>3</th>
      <td>38942136</td>
      <td>2</td>
      <td>2017-05-07 13:17:59</td>
      <td>2017-05-07 13:48:14</td>
      <td>1</td>
      <td>3.70</td>
      <td>1</td>
      <td>N</td>
      <td>188</td>
      <td>97</td>
      <td>1</td>
      <td>20.5</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>6.39</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>27.69</td>
    </tr>
    <tr>
      <th>4</th>
      <td>30841670</td>
      <td>2</td>
      <td>2017-04-15 23:32:20</td>
      <td>2017-04-15 23:49:03</td>
      <td>1</td>
      <td>4.37</td>
      <td>1</td>
      <td>N</td>
      <td>4</td>
      <td>112</td>
      <td>2</td>
      <td>16.5</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>17.80</td>
    </tr>
  </tbody>
</table>
</div>



### <a id='toc1_4_3_'></a>[**Task 2c. Create duration column**](#toc0_)

Create a new column called `duration` that represents the total number of minutes that each taxi ride took.


```python
df['duration'] = (df['tpep_dropoff_datetime'] - df['tpep_pickup_datetime']).dt.total_seconds()/60
df['duration'] = df['duration'].round(2)
df['duration']
```




    0        14.07
    1        26.50
    2         7.20
    3        30.25
    4        16.72
             ...  
    22694     3.27
    22695    40.80
    22696     4.13
    22697    11.93
    22698    13.33
    Name: duration, Length: 22699, dtype: float64



### <a id='toc1_4_4_'></a>[**Outliers**](#toc0_)

Call `df.info()` to inspect the columns and decide which ones to check for outliers.


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 22699 entries, 0 to 22698
    Data columns (total 19 columns):
     #   Column                 Non-Null Count  Dtype         
    ---  ------                 --------------  -----         
     0   Unnamed: 0             22699 non-null  int64         
     1   VendorID               22699 non-null  int64         
     2   tpep_pickup_datetime   22699 non-null  datetime64[ns]
     3   tpep_dropoff_datetime  22699 non-null  datetime64[ns]
     4   passenger_count        22699 non-null  int64         
     5   trip_distance          22699 non-null  float64       
     6   RatecodeID             22699 non-null  int64         
     7   store_and_fwd_flag     22699 non-null  object        
     8   PULocationID           22699 non-null  int64         
     9   DOLocationID           22699 non-null  int64         
     10  payment_type           22699 non-null  int64         
     11  fare_amount            22699 non-null  float64       
     12  extra                  22699 non-null  float64       
     13  mta_tax                22699 non-null  float64       
     14  tip_amount             22699 non-null  float64       
     15  tolls_amount           22699 non-null  float64       
     16  improvement_surcharge  22699 non-null  float64       
     17  total_amount           22699 non-null  float64       
     18  duration               22699 non-null  float64       
    dtypes: datetime64[ns](2), float64(9), int64(7), object(1)
    memory usage: 3.3+ MB
    

Keeping in mind that many of the features will not be used to fit your model, the most important columns to check for outliers are likely to be:
* `trip_distance`
* `fare_amount`
* `duration`

### <a id='toc1_4_5_'></a>[**Task 2d. Box plots**](#toc0_)

Plot a box plot for each feature: `trip_distance`, `fare_amount`, `duration`.


```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['trip_distance'])
plt.title("trip_distance Boxplot")
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_44_0.png)
    



```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['fare_amount'])
plt.title("fare_amount Boxplot")
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_45_0.png)
    



```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['duration'])
plt.title("duration Boxplot")
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_46_0.png)
    


**Questions:** 
1. Which variable(s) contains outliers? 

2. Are the values in the `trip_distance` column unbelievable?

3. What about the lower end? Do distances, fares, and durations of 0 (or negative values) make sense?

**Answer:**

1. All 3 of the variables display outliers from their boxplots with extreme values.
2. Yes the values in the `trip_distance` is unbelivable as it is recording 35 miles for a single trip.
3. No the values of 0 for `fare_amount` and `duration` does not make sense as it would mean a negative amount of time for the duration of the trip and a negative fare which is not possible. Whereas a trip distance of 0 could be a very small trip under 1 mile or from a passenger cancelling a ride and so can be possible and can make sense, but a negative value would be likewise impossible.

### <a id='toc1_4_6_'></a>[**Task 2e. Imputations**](#toc0_)

#### <a id='toc1_4_6_1_'></a>[**`trip_distance` outliers**](#toc0_)

You know from the summary statistics that there are trip distances of 0. Are these reflective of erroneous data, or are they very short trips that get rounded down?

To check, sort the column values, eliminate duplicates, and inspect the least 10 values. Are they rounded values or precise values?


```python
sorted(set(df['trip_distance']))[:10]
```




    [0.0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09]



The distances are captured with a high degree of precision. However, it might be possible for trips to have distances of zero if a passenger summoned a taxi and then changed their mind. Besides, are there enough zero values in the data to pose a problem?

Calculate the count of rides where the `trip_distance` is zero.


```python
len(df[df['trip_distance'] == 0])
```




    148



**Note:** 148 rides out of the nearly 23,000 rides is not significant at all and these values could be imputed with a value as little as 0.01 but is unnecessary due to the insiginifance of the outliers.

#### <a id='toc1_4_6_2_'></a>[**`fare_amount` outliers**](#toc0_)


```python
df['fare_amount'].describe()
```




    count    22699.000000
    mean        13.026629
    std         13.243791
    min       -120.000000
    25%          6.500000
    50%          9.500000
    75%         14.500000
    max        999.990000
    Name: fare_amount, dtype: float64



**Question:** What do you notice about the values in the `fare_amount` column?

**Answer**

What is observable from the `fare_amount` variables is that there are negative values such as -3 and extreme negative values such as -120, these could be due to error or from the driver cancelling the ride and so can be imputed as 0. However, the high values in the variables seem very unlikely, such as the nearly 1,000 USD fare for a single trip. Therefore, the values that go over a certain threshold can be capped using the Interquartile Range (IQR). The IQR is calculated with the equation IQR = Q3-Q1 and so for this variable the IQR is 8 USD and the standard formula of Q3 + (1.5 * IQR) returns a value of 26.50 USD. Thereby in order to get reasonable fare cap we will use the IQR formula of Q3 + (6 * IQR) which returns 62.50 USD which is more appropriate.

$$
\text{IQR} = \text{Q3} - \text{Q1}
$$

$$
\text{Q3} + (1.5 * \text{IQR})
$$

$$
\text{Q3} + (6 * \text{IQR})
$$

Impute values less than $0 with `0`.


```python
df.loc[df['fare_amount'] < 0, 'fare_amount'] = 0
df['fare_amount'].sort_values(ascending=False).tail(10)
```




    12944    0.0
    20317    0.0
    5758     0.0
    314      0.0
    20698    0.0
    8204     0.0
    5722     0.0
    4423     0.0
    4402     0.0
    17602    0.0
    Name: fare_amount, dtype: float64



Now impute the maximum value as `Q3 + (6 * IQR)`.


```python
def outlier(column_list, iqr_factor):
    '''
    Impute upper-limit values in specified columns based on their interquartile range.

    Arguments:
        column_list: A list of columns to iterate over
        iqr_factor: A number representing x in the formula:
                    Q3 + (x * IQR). Used to determine maximum threshold,
                    beyond which a point is considered an outlier.

    The IQR is computed for each column in column_list and values exceeding
    the upper threshold for each column are imputed with the upper threshold value.
    '''
    # Reassign minimum to zero
    for col in column_list:
        df.loc[df[col] < 0, col] = 0
    
    # Calculate upper threshold
    percentile25 = df[col].quantile(0.25)
    percentile75 = df[col].quantile(0.75)
    iqr = percentile75 - percentile25
    threshold = percentile75 + (iqr_factor * iqr)
    print(f'Column Name:', col)
    print(f'Q1:', percentile25)
    print(f'Q3:', percentile75)
    print(f'IQR:', iqr)
    print(f'Threshold', threshold)
    # Reassign the maximum values
    df.loc[df[col] > threshold, col] = threshold
    print(f'Variable Descriptive Statistics:', df[col].describe())
```


```python
outlier(['fare_amount'], 6)
```

    Column Name: fare_amount
    Q1: 6.5
    Q3: 14.5
    IQR: 8.0
    Threshold 62.5
    Variable Descriptive Statistics: count    22699.000000
    mean        12.897913
    std         10.541137
    min          0.000000
    25%          6.500000
    50%          9.500000
    75%         14.500000
    max         62.500000
    Name: fare_amount, dtype: float64
    

#### <a id='toc1_4_6_3_'></a>[**`duration` outliers**](#toc0_)


```python
df['duration'].describe()
```




    count    22699.000000
    mean        17.013766
    std         61.996476
    min        -16.980000
    25%          6.650000
    50%         11.180000
    75%         18.380000
    max       1439.550000
    Name: duration, dtype: float64



The `duration` column has problematic values at both the lower and upper extremities.

* **Low values:** There should be no values that represent negative time. Impute all negative durations with `0`.

* **High values:** Impute high values the same way you imputed the high-end outliers for fares: `Q3 + (6 * IQR)`.


```python
df.loc[df['duration'] < 0, 'duration'] = 0
df['duration'].sort_values(ascending=False).tail(10)
```




    7327     0.0
    472      0.0
    19838    0.0
    21977    0.0
    17270    0.0
    17311    0.0
    1205     0.0
    2740     0.0
    15295    0.0
    4171     0.0
    Name: duration, dtype: float64




```python
outlier(['duration'], 6)
```

    Column Name: duration
    Q1: 6.65
    Q3: 18.38
    IQR: 11.729999999999999
    Threshold 88.75999999999999
    Variable Descriptive Statistics: count    22699.000000
    mean        14.460471
    std         11.946570
    min          0.000000
    25%          6.650000
    50%         11.180000
    75%         18.380000
    max         88.760000
    Name: duration, dtype: float64
    

### <a id='toc1_4_7_'></a>[**Task 3a. Feature engineering**](#toc0_)

#### <a id='toc1_4_7_1_'></a>[Create `mean_distance` column](#toc0_)

When deployed, the model will not know the duration of a trip until after the trip occurs, so you cannot train a model that uses this feature. However, you can use the statistics of trips you *do* know to generalize about ones you do not know.

In this step, create a column called `mean_distance` that captures the mean distance for each group of trips that share pickup and dropoff points.

For example, if your data were:

|Trip|Start|End|Distance|
|--: |:---:|:-:|    |
| 1  | A   | B | 1  |
| 2  | C   | D | 2  |
| 3  | A   | B |1.5 |
| 4  | D   | C | 3  |

The results should be:
```
A -> B: 1.25 miles
C -> D: 2 miles
D -> C: 3 miles
```

Notice that C -> D is not the same as D -> C. All trips that share a unique pair of start and end points get grouped and averaged.

Then, a new column `mean_distance` will be added where the value at each row is the average for all trips with those pickup and dropoff locations:

|Trip|Start|End|Distance|mean_distance|
|--: |:---:|:-:|  :--   |:--   |
| 1  | A   | B | 1      | 1.25 |
| 2  | C   | D | 2      | 2    |
| 3  | A   | B |1.5     | 1.25 |
| 4  | D   | C | 3      | 3    |


Begin by creating a helper column called `pickup_dropoff`, which contains the unique combination of pickup and dropoff location IDs for each row.

One way to do this is to convert the pickup and dropoff location IDs to strings and join them, separated by a space. The space is to ensure that, for example, a trip with pickup/dropoff points of 12 & 151 gets encoded differently than a trip with points 121 & 51.

So, the new column would look like this:

|Trip|Start|End|pickup_dropoff|
|--: |:---:|:-:|  :--         |
| 1  | A   | B | 'A B'        |
| 2  | C   | D | 'C D'        |
| 3  | A   | B | 'A B'        |
| 4  | D   | C | 'D C'        |



```python
df['PULocationID'] = df['PULocationID'].astype(str)
df['DOLocationID'] = df['DOLocationID'].astype(str)
df['pickup_dropoff'] = df['PULocationID'] + ' ' + df['DOLocationID']
df['pickup_dropoff'].head()
```




    0    100 231
    1     186 43
    2    262 236
    3     188 97
    4      4 112
    Name: pickup_dropoff, dtype: object



Now, use a `groupby()` statement to group each row by the new `pickup_dropoff` column, compute the mean, and capture the values only in the `trip_distance` column. Assign the results to a variable named `grouped`.


```python
grouped = df.groupby(['pickup_dropoff'])[['trip_distance']].mean(numeric_only=True)
grouped
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
      <th>trip_distance</th>
    </tr>
    <tr>
      <th>pickup_dropoff</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1 1</th>
      <td>2.433333</td>
    </tr>
    <tr>
      <th>10 148</th>
      <td>15.700000</td>
    </tr>
    <tr>
      <th>100 1</th>
      <td>16.890000</td>
    </tr>
    <tr>
      <th>100 100</th>
      <td>0.253333</td>
    </tr>
    <tr>
      <th>100 107</th>
      <td>1.180000</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
    </tr>
    <tr>
      <th>97 65</th>
      <td>0.500000</td>
    </tr>
    <tr>
      <th>97 66</th>
      <td>1.400000</td>
    </tr>
    <tr>
      <th>97 80</th>
      <td>3.840000</td>
    </tr>
    <tr>
      <th>97 90</th>
      <td>4.420000</td>
    </tr>
    <tr>
      <th>97 97</th>
      <td>1.006667</td>
    </tr>
  </tbody>
</table>
<p>4172 rows × 1 columns</p>
</div>



`grouped` is an object of the `DataFrame` class.

1. Convert it to a dictionary using the [`to_dict()`](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_dict.html) method. Assign the results to a variable called `grouped_dict`. This will result in a dictionary with a key of `trip_distance` whose values are another dictionary. The inner dictionary's keys are pickup/dropoff points and its values are mean distances. This is the information you want.

```
Example:
grouped_dict = {'trip_distance': {'A B': 1.25, 'C D': 2, 'D C': 3}
```

2. Reassign the `grouped_dict` dictionary so it contains only the inner dictionary. In other words, get rid of `trip_distance` as a key, so:

```
Example:
grouped_dict = {'A B': 1.25, 'C D': 2, 'D C': 3}
 ```


```python
grouped = grouped.to_dict()
grouped_dict = {}
for x in grouped.values():
    grouped_dict.update(x)
```

1. Create a `mean_distance` column that is a copy of the `pickup_dropoff` helper column.

2. Use the [`map()`](https://pandas.pydata.org/docs/reference/api/pandas.Series.map.html#pandas-series-map) method on the `mean_distance` series. Pass `grouped_dict` as its argument. Reassign the result back to the `mean_distance` series.
</br></br>
When you pass a dictionary to the `Series.map()` method, it will replace the data in the series where that data matches the dictionary's keys. The values that get imputed are the values of the dictionary.

```
Example:
df['mean_distance']
```

|mean_distance |
|  :-:         |
| 'A B'        |
| 'C D'        |
| 'A B'        |
| 'D C'        |
| 'E F'        |

```
grouped_dict = {'A B': 1.25, 'C D': 2, 'D C': 3}
df['mean_distance`] = df['mean_distance'].map(grouped_dict)
df['mean_distance']
```

|mean_distance |
|  :-:         |
| 1.25         |
| 2            |
| 1.25         |
| 3            |
| NaN          |

When used this way, the `map()` `Series` method is very similar to `replace()`, however, note that `map()` will impute `NaN` for any values in the series that do not have a corresponding key in the mapping dictionary, so be careful.


```python
df['mean_distance'] = df['pickup_dropoff']
df['mean_distance'] = df['mean_distance'].map(grouped_dict)
df['mean_distance']
```




    0         3.521667
    1         3.108889
    2         0.881429
    3         3.700000
    4         4.435000
               ...    
    22694     1.098214
    22695    18.757500
    22696     0.684242
    22697     2.077500
    22698     1.476970
    Name: mean_distance, Length: 22699, dtype: float64



#### <a id='toc1_4_7_2_'></a>[**Create `mean_duration` column**](#toc0_)

Repeat the process used to create the `mean_distance` column to create a `mean_duration` column.


```python
grouped_duration = df.groupby(['pickup_dropoff'])[['duration']].mean(numeric_only=True)

grouped_dict = grouped_duration.to_dict()
grouped_dict = grouped_dict['duration']

df['mean_duration'] = df['pickup_dropoff']
df['mean_duration'] = df['mean_duration'].map(grouped_dict)
df['mean_duration']
```




    0        22.848333
    1        24.470000
    2         7.250286
    3        30.250000
    4        14.620000
               ...    
    22694     8.594286
    22695    59.560000
    22696     6.609697
    22697    16.648750
    22698     9.404848
    Name: mean_duration, Length: 22699, dtype: float64



#### <a id='toc1_4_7_3_'></a>[**Create `day` and `month` columns**](#toc0_)

Create two new columns, `day` (name of day) and `month` (name of month) by extracting the relevant information from the `tpep_pickup_datetime` column.


```python
df['day'] = df['tpep_pickup_datetime'].dt.day_name()
df['month'] = df['tpep_pickup_datetime'].dt.month_name().str.slice(stop=3)
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
      <th>Unnamed: 0</th>
      <th>VendorID</th>
      <th>tpep_pickup_datetime</th>
      <th>tpep_dropoff_datetime</th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>RatecodeID</th>
      <th>store_and_fwd_flag</th>
      <th>PULocationID</th>
      <th>DOLocationID</th>
      <th>...</th>
      <th>tip_amount</th>
      <th>tolls_amount</th>
      <th>improvement_surcharge</th>
      <th>total_amount</th>
      <th>duration</th>
      <th>pickup_dropoff</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>day</th>
      <th>month</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>24870114</td>
      <td>2</td>
      <td>2017-03-25 08:55:43</td>
      <td>2017-03-25 09:09:47</td>
      <td>6</td>
      <td>3.34</td>
      <td>1</td>
      <td>N</td>
      <td>100</td>
      <td>231</td>
      <td>...</td>
      <td>2.76</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.56</td>
      <td>14.07</td>
      <td>100 231</td>
      <td>3.521667</td>
      <td>22.848333</td>
      <td>Saturday</td>
      <td>Mar</td>
    </tr>
    <tr>
      <th>1</th>
      <td>35634249</td>
      <td>1</td>
      <td>2017-04-11 14:53:28</td>
      <td>2017-04-11 15:19:58</td>
      <td>1</td>
      <td>1.80</td>
      <td>1</td>
      <td>N</td>
      <td>186</td>
      <td>43</td>
      <td>...</td>
      <td>4.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>20.80</td>
      <td>26.50</td>
      <td>186 43</td>
      <td>3.108889</td>
      <td>24.470000</td>
      <td>Tuesday</td>
      <td>Apr</td>
    </tr>
    <tr>
      <th>2</th>
      <td>106203690</td>
      <td>1</td>
      <td>2017-12-15 07:26:56</td>
      <td>2017-12-15 07:34:08</td>
      <td>1</td>
      <td>1.00</td>
      <td>1</td>
      <td>N</td>
      <td>262</td>
      <td>236</td>
      <td>...</td>
      <td>1.45</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>8.75</td>
      <td>7.20</td>
      <td>262 236</td>
      <td>0.881429</td>
      <td>7.250286</td>
      <td>Friday</td>
      <td>Dec</td>
    </tr>
    <tr>
      <th>3</th>
      <td>38942136</td>
      <td>2</td>
      <td>2017-05-07 13:17:59</td>
      <td>2017-05-07 13:48:14</td>
      <td>1</td>
      <td>3.70</td>
      <td>1</td>
      <td>N</td>
      <td>188</td>
      <td>97</td>
      <td>...</td>
      <td>6.39</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>27.69</td>
      <td>30.25</td>
      <td>188 97</td>
      <td>3.700000</td>
      <td>30.250000</td>
      <td>Sunday</td>
      <td>May</td>
    </tr>
    <tr>
      <th>4</th>
      <td>30841670</td>
      <td>2</td>
      <td>2017-04-15 23:32:20</td>
      <td>2017-04-15 23:49:03</td>
      <td>1</td>
      <td>4.37</td>
      <td>1</td>
      <td>N</td>
      <td>4</td>
      <td>112</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>17.80</td>
      <td>16.72</td>
      <td>4 112</td>
      <td>4.435000</td>
      <td>14.620000</td>
      <td>Saturday</td>
      <td>Apr</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 24 columns</p>
</div>



#### <a id='toc1_4_7_4_'></a>[**Create `rush_hour` column**](#toc0_)

Define rush hour as:
* Any weekday (not Saturday or Sunday) AND
* Either from 06:00&ndash;10:00 or from 16:00&ndash;20:00

Create a binary `rush_hour` column that contains a 1 if the ride was during rush hour and a 0 if it was not.

**Note:** There are 2 ways of doing this

The first way is to use the relational operators in conjunction with datetime hours from the `tpep_pickup_datetime` colum and exclude Saturday and Sunday from the `day` column.


```python
df['rush_hour'] = ((~df['day'].isin(['Saturday', 'Sunday'])) & 
                   (
                       (df['tpep_pickup_datetime'].dt.hour.between(6,10)) |
                       (df['tpep_pickup_datetime'].dt.hour.between(16,20))
                   )).astype(int)

```

The second way is to use `df.loc` and write a custom function with conditional statemenets.


```python
def rush_houriser(dataframe):
    if 6 <= dataframe['rush_hour'] < 10:
        val = 1
    elif 16 <= dataframe['rush_hour'] < 20:
        val = 1
    else:
        val=0
    return val
```


```python
df['rush_hour'] = df['tpep_pickup_datetime'].dt.hour
df.loc[df['day'].isin(['Saturday', 'Sunday']), 'rush_hour'] = 0
df.loc[(df['day'] != 'Saturday') & (df['day'] != 'Sunday'), 'rush_hour'] = df.apply(rush_houriser, axis=1)
df.head()
```

    C:\Users\alexa\AppData\Local\Temp\ipykernel_7840\4261285989.py:3: FutureWarning: Setting an item of incompatible dtype is deprecated and will raise an error in a future version of pandas. Value '[0 1 1 ... 1 0 0]' has dtype incompatible with int32, please explicitly cast to a compatible dtype first.
      df.loc[(df['day'] != 'Saturday') & (df['day'] != 'Sunday'), 'rush_hour'] = df.apply(rush_houriser, axis=1)
    




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
      <th>Unnamed: 0</th>
      <th>VendorID</th>
      <th>tpep_pickup_datetime</th>
      <th>tpep_dropoff_datetime</th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>RatecodeID</th>
      <th>store_and_fwd_flag</th>
      <th>PULocationID</th>
      <th>DOLocationID</th>
      <th>...</th>
      <th>tolls_amount</th>
      <th>improvement_surcharge</th>
      <th>total_amount</th>
      <th>duration</th>
      <th>pickup_dropoff</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>day</th>
      <th>month</th>
      <th>rush_hour</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>24870114</td>
      <td>2</td>
      <td>2017-03-25 08:55:43</td>
      <td>2017-03-25 09:09:47</td>
      <td>6</td>
      <td>3.34</td>
      <td>1</td>
      <td>N</td>
      <td>100</td>
      <td>231</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.56</td>
      <td>14.07</td>
      <td>100 231</td>
      <td>3.521667</td>
      <td>22.848333</td>
      <td>Saturday</td>
      <td>Mar</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>35634249</td>
      <td>1</td>
      <td>2017-04-11 14:53:28</td>
      <td>2017-04-11 15:19:58</td>
      <td>1</td>
      <td>1.80</td>
      <td>1</td>
      <td>N</td>
      <td>186</td>
      <td>43</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>20.80</td>
      <td>26.50</td>
      <td>186 43</td>
      <td>3.108889</td>
      <td>24.470000</td>
      <td>Tuesday</td>
      <td>Apr</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>106203690</td>
      <td>1</td>
      <td>2017-12-15 07:26:56</td>
      <td>2017-12-15 07:34:08</td>
      <td>1</td>
      <td>1.00</td>
      <td>1</td>
      <td>N</td>
      <td>262</td>
      <td>236</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>8.75</td>
      <td>7.20</td>
      <td>262 236</td>
      <td>0.881429</td>
      <td>7.250286</td>
      <td>Friday</td>
      <td>Dec</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>38942136</td>
      <td>2</td>
      <td>2017-05-07 13:17:59</td>
      <td>2017-05-07 13:48:14</td>
      <td>1</td>
      <td>3.70</td>
      <td>1</td>
      <td>N</td>
      <td>188</td>
      <td>97</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>27.69</td>
      <td>30.25</td>
      <td>188 97</td>
      <td>3.700000</td>
      <td>30.250000</td>
      <td>Sunday</td>
      <td>May</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>30841670</td>
      <td>2</td>
      <td>2017-04-15 23:32:20</td>
      <td>2017-04-15 23:49:03</td>
      <td>1</td>
      <td>4.37</td>
      <td>1</td>
      <td>N</td>
      <td>4</td>
      <td>112</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>17.80</td>
      <td>16.72</td>
      <td>4 112</td>
      <td>4.435000</td>
      <td>14.620000</td>
      <td>Saturday</td>
      <td>Apr</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 25 columns</p>
</div>



### <a id='toc1_4_8_'></a>[**Task 4. Scatter plot**](#toc0_)

Create a scatterplot to visualize the relationship between `mean_duration` and `fare_amount`.


```python
plt.figure(figsize=(10, 10))
sns.regplot(x='mean_duration', y='fare_amount', data=df, scatter_kws={'alpha':0.5,
                                                                      's':5},
                                                                      line_kws={'color':'red'})
plt.title("fare amount by average trip duration Scatterplot")
plt.ylim(0, 70)
plt.xlim(0, 70)
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_88_0.png)
    


The `mean_duration` variable correlates with the target variable. But what are the horizontal lines around fare amounts of 52 dollars and 63 dollars? What are the values and how many are there?

You know what one of the lines represents. 62 dollars and 50 cents is the maximum that was imputed for outliers, so all former outliers will now have fare amounts of \$62.50. What is the other line?

Check the value of the rides in the second horizontal line in the scatter plot.


```python
df[df['fare_amount'] > 50]['fare_amount'].value_counts()
```




    fare_amount
    52.0    514
    62.5     84
    59.0      9
    50.5      9
    57.5      8
    51.0      7
    55.0      6
    51.5      6
    60.0      6
    52.5      4
    53.0      4
    55.5      3
    62.0      3
    56.5      3
    61.0      3
    56.0      3
    54.0      2
    57.0      2
    61.5      2
    58.5      2
    59.5      2
    58.0      1
    54.7      1
    54.5      1
    Name: count, dtype: int64



**Note:** There are 514 trips that have a fare amount of 52 USD.

Examine the first 30 of these trips.


```python
df[df['fare_amount'] == 52].head(30)
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
      <th>Unnamed: 0</th>
      <th>VendorID</th>
      <th>tpep_pickup_datetime</th>
      <th>tpep_dropoff_datetime</th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>RatecodeID</th>
      <th>store_and_fwd_flag</th>
      <th>PULocationID</th>
      <th>DOLocationID</th>
      <th>...</th>
      <th>tolls_amount</th>
      <th>improvement_surcharge</th>
      <th>total_amount</th>
      <th>duration</th>
      <th>pickup_dropoff</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>day</th>
      <th>month</th>
      <th>rush_hour</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>11</th>
      <td>18600059</td>
      <td>2</td>
      <td>2017-03-05 19:15:30</td>
      <td>2017-03-05 19:52:18</td>
      <td>2</td>
      <td>18.90</td>
      <td>2</td>
      <td>N</td>
      <td>236</td>
      <td>132</td>
      <td>...</td>
      <td>5.54</td>
      <td>0.3</td>
      <td>72.92</td>
      <td>36.80</td>
      <td>236 132</td>
      <td>19.211667</td>
      <td>40.496667</td>
      <td>Sunday</td>
      <td>Mar</td>
      <td>0</td>
    </tr>
    <tr>
      <th>110</th>
      <td>47959795</td>
      <td>1</td>
      <td>2017-06-03 14:24:57</td>
      <td>2017-06-03 15:31:48</td>
      <td>1</td>
      <td>18.00</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>163</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>66.85</td>
      <td>132 163</td>
      <td>19.229000</td>
      <td>52.943000</td>
      <td>Saturday</td>
      <td>Jun</td>
      <td>0</td>
    </tr>
    <tr>
      <th>161</th>
      <td>95729204</td>
      <td>2</td>
      <td>2017-11-11 20:16:16</td>
      <td>2017-11-11 20:17:14</td>
      <td>1</td>
      <td>0.23</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>132</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>0.97</td>
      <td>132 132</td>
      <td>2.255862</td>
      <td>3.022414</td>
      <td>Saturday</td>
      <td>Nov</td>
      <td>0</td>
    </tr>
    <tr>
      <th>247</th>
      <td>103404868</td>
      <td>2</td>
      <td>2017-12-06 23:37:08</td>
      <td>2017-12-07 00:06:19</td>
      <td>1</td>
      <td>18.93</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>79</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>29.18</td>
      <td>132 79</td>
      <td>19.431667</td>
      <td>47.273333</td>
      <td>Wednesday</td>
      <td>Dec</td>
      <td>0</td>
    </tr>
    <tr>
      <th>379</th>
      <td>80479432</td>
      <td>2</td>
      <td>2017-09-24 23:45:45</td>
      <td>2017-09-25 00:15:14</td>
      <td>1</td>
      <td>17.99</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>234</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>73.20</td>
      <td>29.48</td>
      <td>132 234</td>
      <td>17.654000</td>
      <td>49.834000</td>
      <td>Sunday</td>
      <td>Sep</td>
      <td>0</td>
    </tr>
    <tr>
      <th>388</th>
      <td>16226157</td>
      <td>1</td>
      <td>2017-02-28 18:30:05</td>
      <td>2017-02-28 19:09:55</td>
      <td>1</td>
      <td>18.40</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>48</td>
      <td>...</td>
      <td>5.54</td>
      <td>0.3</td>
      <td>62.84</td>
      <td>39.83</td>
      <td>132 48</td>
      <td>18.761905</td>
      <td>58.244762</td>
      <td>Tuesday</td>
      <td>Feb</td>
      <td>1</td>
    </tr>
    <tr>
      <th>406</th>
      <td>55253442</td>
      <td>2</td>
      <td>2017-06-05 12:51:58</td>
      <td>2017-06-05 13:07:35</td>
      <td>1</td>
      <td>4.73</td>
      <td>2</td>
      <td>N</td>
      <td>228</td>
      <td>88</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>58.56</td>
      <td>15.62</td>
      <td>228 88</td>
      <td>4.730000</td>
      <td>15.620000</td>
      <td>Monday</td>
      <td>Jun</td>
      <td>0</td>
    </tr>
    <tr>
      <th>449</th>
      <td>65900029</td>
      <td>2</td>
      <td>2017-08-03 22:47:14</td>
      <td>2017-08-03 23:32:41</td>
      <td>2</td>
      <td>18.21</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>48</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>58.56</td>
      <td>45.45</td>
      <td>132 48</td>
      <td>18.761905</td>
      <td>58.244762</td>
      <td>Thursday</td>
      <td>Aug</td>
      <td>0</td>
    </tr>
    <tr>
      <th>468</th>
      <td>80904240</td>
      <td>2</td>
      <td>2017-09-26 13:48:26</td>
      <td>2017-09-26 14:31:17</td>
      <td>1</td>
      <td>17.27</td>
      <td>2</td>
      <td>N</td>
      <td>186</td>
      <td>132</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>58.56</td>
      <td>42.85</td>
      <td>186 132</td>
      <td>17.096000</td>
      <td>42.922000</td>
      <td>Tuesday</td>
      <td>Sep</td>
      <td>0</td>
    </tr>
    <tr>
      <th>520</th>
      <td>33706214</td>
      <td>2</td>
      <td>2017-04-23 21:34:48</td>
      <td>2017-04-23 22:46:23</td>
      <td>6</td>
      <td>18.34</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>148</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>57.80</td>
      <td>71.58</td>
      <td>132 148</td>
      <td>17.994286</td>
      <td>46.340000</td>
      <td>Sunday</td>
      <td>Apr</td>
      <td>0</td>
    </tr>
    <tr>
      <th>569</th>
      <td>99259872</td>
      <td>2</td>
      <td>2017-11-22 21:31:32</td>
      <td>2017-11-22 22:00:25</td>
      <td>1</td>
      <td>18.65</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>144</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>63.36</td>
      <td>28.88</td>
      <td>132 144</td>
      <td>18.537500</td>
      <td>37.000000</td>
      <td>Wednesday</td>
      <td>Nov</td>
      <td>0</td>
    </tr>
    <tr>
      <th>572</th>
      <td>61050418</td>
      <td>2</td>
      <td>2017-07-18 13:29:06</td>
      <td>2017-07-18 13:29:19</td>
      <td>1</td>
      <td>0.00</td>
      <td>2</td>
      <td>N</td>
      <td>230</td>
      <td>161</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>70.27</td>
      <td>0.22</td>
      <td>230 161</td>
      <td>0.685484</td>
      <td>7.965484</td>
      <td>Tuesday</td>
      <td>Jul</td>
      <td>0</td>
    </tr>
    <tr>
      <th>586</th>
      <td>54444647</td>
      <td>2</td>
      <td>2017-06-26 13:39:12</td>
      <td>2017-06-26 14:34:54</td>
      <td>1</td>
      <td>17.76</td>
      <td>2</td>
      <td>N</td>
      <td>211</td>
      <td>132</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>70.27</td>
      <td>55.70</td>
      <td>211 132</td>
      <td>16.580000</td>
      <td>61.690000</td>
      <td>Monday</td>
      <td>Jun</td>
      <td>0</td>
    </tr>
    <tr>
      <th>692</th>
      <td>94424289</td>
      <td>2</td>
      <td>2017-11-07 22:15:00</td>
      <td>2017-11-07 22:45:32</td>
      <td>2</td>
      <td>16.97</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>170</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>70.27</td>
      <td>30.53</td>
      <td>132 170</td>
      <td>17.203000</td>
      <td>37.112000</td>
      <td>Tuesday</td>
      <td>Nov</td>
      <td>0</td>
    </tr>
    <tr>
      <th>717</th>
      <td>103094220</td>
      <td>1</td>
      <td>2017-12-06 05:19:50</td>
      <td>2017-12-06 05:53:52</td>
      <td>1</td>
      <td>20.80</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>239</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>64.41</td>
      <td>34.03</td>
      <td>132 239</td>
      <td>20.901250</td>
      <td>44.862500</td>
      <td>Wednesday</td>
      <td>Dec</td>
      <td>0</td>
    </tr>
    <tr>
      <th>719</th>
      <td>66115834</td>
      <td>1</td>
      <td>2017-08-04 17:53:34</td>
      <td>2017-08-04 18:50:56</td>
      <td>1</td>
      <td>21.60</td>
      <td>2</td>
      <td>N</td>
      <td>264</td>
      <td>264</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>75.66</td>
      <td>57.37</td>
      <td>264 264</td>
      <td>3.191516</td>
      <td>15.618195</td>
      <td>Friday</td>
      <td>Aug</td>
      <td>1</td>
    </tr>
    <tr>
      <th>782</th>
      <td>55934137</td>
      <td>2</td>
      <td>2017-06-09 09:31:25</td>
      <td>2017-06-09 10:24:10</td>
      <td>2</td>
      <td>18.81</td>
      <td>2</td>
      <td>N</td>
      <td>163</td>
      <td>132</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>66.00</td>
      <td>52.75</td>
      <td>163 132</td>
      <td>17.275833</td>
      <td>52.337500</td>
      <td>Friday</td>
      <td>Jun</td>
      <td>1</td>
    </tr>
    <tr>
      <th>816</th>
      <td>13731926</td>
      <td>2</td>
      <td>2017-02-21 06:11:03</td>
      <td>2017-02-21 06:59:39</td>
      <td>5</td>
      <td>16.94</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>170</td>
      <td>...</td>
      <td>5.54</td>
      <td>0.3</td>
      <td>60.34</td>
      <td>48.60</td>
      <td>132 170</td>
      <td>17.203000</td>
      <td>37.112000</td>
      <td>Tuesday</td>
      <td>Feb</td>
      <td>1</td>
    </tr>
    <tr>
      <th>818</th>
      <td>52277743</td>
      <td>2</td>
      <td>2017-06-20 08:15:18</td>
      <td>2017-06-20 10:24:37</td>
      <td>1</td>
      <td>17.77</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>246</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>70.27</td>
      <td>88.76</td>
      <td>132 246</td>
      <td>18.515000</td>
      <td>66.305000</td>
      <td>Tuesday</td>
      <td>Jun</td>
      <td>1</td>
    </tr>
    <tr>
      <th>835</th>
      <td>2684305</td>
      <td>2</td>
      <td>2017-01-10 22:29:47</td>
      <td>2017-01-10 23:06:46</td>
      <td>1</td>
      <td>18.57</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>48</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>66.00</td>
      <td>36.98</td>
      <td>132 48</td>
      <td>18.761905</td>
      <td>58.244762</td>
      <td>Tuesday</td>
      <td>Jan</td>
      <td>0</td>
    </tr>
    <tr>
      <th>840</th>
      <td>90860814</td>
      <td>2</td>
      <td>2017-10-27 21:50:00</td>
      <td>2017-10-27 22:35:04</td>
      <td>1</td>
      <td>22.43</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>163</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>58.56</td>
      <td>45.07</td>
      <td>132 163</td>
      <td>19.229000</td>
      <td>52.943000</td>
      <td>Friday</td>
      <td>Oct</td>
      <td>0</td>
    </tr>
    <tr>
      <th>861</th>
      <td>106575186</td>
      <td>1</td>
      <td>2017-12-16 06:39:59</td>
      <td>2017-12-16 07:07:59</td>
      <td>2</td>
      <td>17.80</td>
      <td>2</td>
      <td>N</td>
      <td>75</td>
      <td>132</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>64.56</td>
      <td>28.00</td>
      <td>75 132</td>
      <td>18.442500</td>
      <td>36.205000</td>
      <td>Saturday</td>
      <td>Dec</td>
      <td>0</td>
    </tr>
    <tr>
      <th>881</th>
      <td>110495611</td>
      <td>2</td>
      <td>2017-12-30 05:25:29</td>
      <td>2017-12-30 06:01:29</td>
      <td>6</td>
      <td>18.23</td>
      <td>2</td>
      <td>N</td>
      <td>68</td>
      <td>132</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>36.00</td>
      <td>68 132</td>
      <td>18.785000</td>
      <td>58.035000</td>
      <td>Saturday</td>
      <td>Dec</td>
      <td>0</td>
    </tr>
    <tr>
      <th>958</th>
      <td>87017503</td>
      <td>1</td>
      <td>2017-10-15 22:39:12</td>
      <td>2017-10-15 23:14:22</td>
      <td>1</td>
      <td>21.80</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>261</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>35.17</td>
      <td>132 261</td>
      <td>22.115000</td>
      <td>51.495000</td>
      <td>Sunday</td>
      <td>Oct</td>
      <td>0</td>
    </tr>
    <tr>
      <th>970</th>
      <td>12762608</td>
      <td>2</td>
      <td>2017-02-17 20:39:42</td>
      <td>2017-02-17 21:13:29</td>
      <td>1</td>
      <td>19.57</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>140</td>
      <td>...</td>
      <td>5.54</td>
      <td>0.3</td>
      <td>70.01</td>
      <td>33.78</td>
      <td>132 140</td>
      <td>19.293333</td>
      <td>36.791667</td>
      <td>Friday</td>
      <td>Feb</td>
      <td>0</td>
    </tr>
    <tr>
      <th>984</th>
      <td>71264442</td>
      <td>1</td>
      <td>2017-08-23 18:23:26</td>
      <td>2017-08-23 19:18:29</td>
      <td>1</td>
      <td>16.70</td>
      <td>2</td>
      <td>N</td>
      <td>132</td>
      <td>230</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>99.59</td>
      <td>55.05</td>
      <td>132 230</td>
      <td>18.571200</td>
      <td>59.596400</td>
      <td>Wednesday</td>
      <td>Aug</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1082</th>
      <td>11006300</td>
      <td>2</td>
      <td>2017-02-07 17:20:19</td>
      <td>2017-02-07 17:34:41</td>
      <td>1</td>
      <td>1.09</td>
      <td>2</td>
      <td>N</td>
      <td>170</td>
      <td>48</td>
      <td>...</td>
      <td>5.54</td>
      <td>0.3</td>
      <td>62.84</td>
      <td>14.37</td>
      <td>170 48</td>
      <td>1.265789</td>
      <td>14.137368</td>
      <td>Tuesday</td>
      <td>Feb</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1097</th>
      <td>68882036</td>
      <td>2</td>
      <td>2017-08-14 23:01:15</td>
      <td>2017-08-14 23:03:35</td>
      <td>5</td>
      <td>2.12</td>
      <td>2</td>
      <td>N</td>
      <td>265</td>
      <td>265</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>52.80</td>
      <td>2.33</td>
      <td>265 265</td>
      <td>0.753077</td>
      <td>3.411538</td>
      <td>Monday</td>
      <td>Aug</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1110</th>
      <td>74720333</td>
      <td>1</td>
      <td>2017-09-06 10:46:17</td>
      <td>2017-09-06 11:44:41</td>
      <td>1</td>
      <td>19.10</td>
      <td>2</td>
      <td>N</td>
      <td>239</td>
      <td>132</td>
      <td>...</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>68.60</td>
      <td>58.40</td>
      <td>239 132</td>
      <td>19.795000</td>
      <td>50.562500</td>
      <td>Wednesday</td>
      <td>Sep</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1179</th>
      <td>51937907</td>
      <td>2</td>
      <td>2017-06-19 06:23:13</td>
      <td>2017-06-19 07:03:53</td>
      <td>6</td>
      <td>19.77</td>
      <td>2</td>
      <td>N</td>
      <td>238</td>
      <td>132</td>
      <td>...</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>76.13</td>
      <td>40.67</td>
      <td>238 132</td>
      <td>19.470000</td>
      <td>53.860000</td>
      <td>Monday</td>
      <td>Jun</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>30 rows × 25 columns</p>
</div>



**Question:** What do you notice about the first 30 trips?

**Answer**

What I can infer about the first 30 trips with a fare amount of 52 USD is that they have the `PULocationID` or `DOLocationID` of 132 and have a `RatecodeID` of 2. With regards to the PU/DOLocationID's, upon investigating the 30 trips further it seems there are toll amounts of 5.54 USD and 5.76 USD, indicating that this location ID frequently requires a toll to get through. Through the data dictionary provided with this dataset, the `RatecodeID` refers to the final rate code at the end of the trip with 2 equaling JFK, which is John F. Kennedy International Airport. After further research, it turns out that in 2017, the flate rate for a taxi between JFK Airport and Manhattan was 52 USD plus tolls, a 0.50 MTA state surcharge, a 0.30 improvement surcharge and a 5 USD rush hour surcharge from 4pm to 8pm on weekdays. This is further evident with when there is a rush hour as indicated by the `rush_hour` column, there is a 4.50 USD extra which would be the rush hour surcharge. This concludes that the 52 USD line is for trips to and from JFK International Airport.

To view more information on taxis to and from JFK Airport click [here](https://www.jfkairport.com/transportation/taxi-service)

### <a id='toc1_4_9_'></a>[**Task 5. Isolate modeling variables**](#toc0_)

Drop features that are redundant, irrelevant, or that will not be available in a deployed environment.


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 22699 entries, 0 to 22698
    Data columns (total 25 columns):
     #   Column                 Non-Null Count  Dtype         
    ---  ------                 --------------  -----         
     0   Unnamed: 0             22699 non-null  int64         
     1   VendorID               22699 non-null  int64         
     2   tpep_pickup_datetime   22699 non-null  datetime64[ns]
     3   tpep_dropoff_datetime  22699 non-null  datetime64[ns]
     4   passenger_count        22699 non-null  int64         
     5   trip_distance          22699 non-null  float64       
     6   RatecodeID             22699 non-null  int64         
     7   store_and_fwd_flag     22699 non-null  object        
     8   PULocationID           22699 non-null  object        
     9   DOLocationID           22699 non-null  object        
     10  payment_type           22699 non-null  int64         
     11  fare_amount            22699 non-null  float64       
     12  extra                  22699 non-null  float64       
     13  mta_tax                22699 non-null  float64       
     14  tip_amount             22699 non-null  float64       
     15  tolls_amount           22699 non-null  float64       
     16  improvement_surcharge  22699 non-null  float64       
     17  total_amount           22699 non-null  float64       
     18  duration               22699 non-null  float64       
     19  pickup_dropoff         22699 non-null  object        
     20  mean_distance          22699 non-null  float64       
     21  mean_duration          22699 non-null  float64       
     22  day                    22699 non-null  object        
     23  month                  22699 non-null  object        
     24  rush_hour              22699 non-null  int64         
    dtypes: datetime64[ns](2), float64(11), int64(6), object(6)
    memory usage: 4.3+ MB
    


```python
df1 = df.copy()
```


```python
df1 = df1.drop(['Unnamed: 0', 'tpep_pickup_datetime', 'tpep_dropoff_datetime', 'trip_distance',
                'RatecodeID', 'store_and_fwd_flag', 'PULocationID', 'DOLocationID',
                'payment_type', 'extra', 'mta_tax', 'tip_amount', 'tolls_amount', 'improvement_surcharge',
                'total_amount', 'duration', 'pickup_dropoff', 'day', 'month'], axis=1)
```


```python
df1.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 22699 entries, 0 to 22698
    Data columns (total 6 columns):
     #   Column           Non-Null Count  Dtype  
    ---  ------           --------------  -----  
     0   VendorID         22699 non-null  int64  
     1   passenger_count  22699 non-null  int64  
     2   fare_amount      22699 non-null  float64
     3   mean_distance    22699 non-null  float64
     4   mean_duration    22699 non-null  float64
     5   rush_hour        22699 non-null  int64  
    dtypes: float64(3), int64(3)
    memory usage: 1.0 MB
    

### <a id='toc1_4_10_'></a>[**Task 6. Pair plot**](#toc0_)

Create a pairplot to visualize pairwise relationships between `fare_amount`, `mean_duration`, and `mean_distance`.


```python
sns.pairplot(df1[['fare_amount', 'mean_duration', 'mean_distance']])
```




    <seaborn.axisgrid.PairGrid at 0x1db3aeb9400>




    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_101_1.png)
    


These variables all show linear correlation with each other. Investigate this further.

### <a id='toc1_4_11_'></a>[**Task 7. Identify correlations**](#toc0_)

Next, code a correlation matrix to help determine most correlated variables.


```python
df1.corr(method='pearson')
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
      <th>fare_amount</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>rush_hour</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>VendorID</th>
      <td>1.000000</td>
      <td>0.266463</td>
      <td>0.001045</td>
      <td>0.004741</td>
      <td>0.001876</td>
      <td>-0.002874</td>
    </tr>
    <tr>
      <th>passenger_count</th>
      <td>0.266463</td>
      <td>1.000000</td>
      <td>0.014942</td>
      <td>0.013428</td>
      <td>0.015853</td>
      <td>-0.022035</td>
    </tr>
    <tr>
      <th>fare_amount</th>
      <td>0.001045</td>
      <td>0.014942</td>
      <td>1.000000</td>
      <td>0.910185</td>
      <td>0.859111</td>
      <td>-0.020075</td>
    </tr>
    <tr>
      <th>mean_distance</th>
      <td>0.004741</td>
      <td>0.013428</td>
      <td>0.910185</td>
      <td>1.000000</td>
      <td>0.874870</td>
      <td>-0.039725</td>
    </tr>
    <tr>
      <th>mean_duration</th>
      <td>0.001876</td>
      <td>0.015853</td>
      <td>0.859111</td>
      <td>0.874870</td>
      <td>1.000000</td>
      <td>-0.021583</td>
    </tr>
    <tr>
      <th>rush_hour</th>
      <td>-0.002874</td>
      <td>-0.022035</td>
      <td>-0.020075</td>
      <td>-0.039725</td>
      <td>-0.021583</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



Visualize a correlation heatmap of the data.


```python
plt.figure(figsize=(15,10))
sns.heatmap(df1.corr(method='pearson'), vmin=1, vmax=1, annot=True, cmap='coolwarm')
plt.title("Correlation Heatmap", fontsize=18)
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_107_0.png)
    


**Question:** Which variable(s) are correlated with the target variable of `fare_amount`? 

**Answer**

The variables that are the most highly correlated with `fare_amount` are `mean_distance` and `mean_duration` with them also being highly correlated with each other with a pearson correlation of 0.87. With linear regression, modelling with highly correlated variables can be bad for drawing statistical inferences about the data from the model, but can still be used to create an accurate predictor. This is done if the main objective is to make a prediction rather than learning about your data and so the prediction itself is more important than the inferences made from the data.

Try modeling with both variables even though they are correlated.

## <a id='toc1_5_'></a>[**PACE: Construct**](#toc0_)

After analysis and deriving variables with close relationships, it is time to begin constructing the model. Consider the questions in your PACE Strategy Document to reflect on the Construct stage.

### <a id='toc1_5_1_'></a>[**Task 8a. Split data into outcome variable and features**](#toc0_)


```python
X = df1.copy()
X = X.drop(['fare_amount'], axis=1)
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
      <th>VendorID</th>
      <th>passenger_count</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>rush_hour</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>6</td>
      <td>3.521667</td>
      <td>22.848333</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1</td>
      <td>3.108889</td>
      <td>24.470000</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>1</td>
      <td>0.881429</td>
      <td>7.250286</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>1</td>
      <td>3.700000</td>
      <td>30.250000</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2</td>
      <td>1</td>
      <td>4.435000</td>
      <td>14.620000</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



Set your X and y variables. X represents the features and y represents the outcome (target) variable.


```python
y = df1['fare_amount']
```

*Keeping a copy of the `RatecodeID` seperately for later when imputating the predictions*


```python
ratecode = df['RatecodeID']
```

### <a id='toc1_5_2_'></a>[**Task 8b. Pre-process data**](#toc0_)

Dummy encode categorical variables


```python
X['VendorID'] = X['VendorID'].astype(str)
X = pd.get_dummies(X, columns=['VendorID'], drop_first=True)
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
      <th>passenger_count</th>
      <th>mean_distance</th>
      <th>mean_duration</th>
      <th>rush_hour</th>
      <th>VendorID_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>6</td>
      <td>3.521667</td>
      <td>22.848333</td>
      <td>0</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>3.108889</td>
      <td>24.470000</td>
      <td>0</td>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>0.881429</td>
      <td>7.250286</td>
      <td>1</td>
      <td>False</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>3.700000</td>
      <td>30.250000</td>
      <td>0</td>
      <td>True</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>4.435000</td>
      <td>14.620000</td>
      <td>0</td>
      <td>True</td>
    </tr>
  </tbody>
</table>
</div>



### <a id='toc1_5_3_'></a>[**Split data into training and test sets**](#toc0_)

Create training and testing sets. The test set should contain 20% of the total samples. Set `random_state=0`.

*`rate_train` and `rate_test` are in here as well for the future imputation of the predictions*


```python
X_train, X_test, y_train, y_test, rate_train, rate_test = train_test_split(X, y, ratecode, test_size=0.2, random_state=0)
```

### <a id='toc1_5_4_'></a>[**Standardize the data**](#toc0_)

Use `StandardScaler()`, `fit()`, and `transform()` to standardize the `X_train` variables. Assign the results to a variable called `X_train_scaled`.


```python
scaler = StandardScaler().fit(X_train)
X_train_scaled = scaler.transform(X_train)
```

### <a id='toc1_5_5_'></a>[**Fit the model**](#toc0_)

Instantiate your model and fit it to the training data.

**Estimated Model**

$$
\text{fare\_amount}_i=\beta{_0} + \beta{_1}\;\text{passenger\_count}_i + \beta{_2}\;\text{mean\_distance}_i + \beta{_3}\;\text{mean\_duration}_i + \beta{_4}\;\text{rush\_hour}_i + \beta{_5}\;\text{VendorID\_2}_i +\varepsilon{_i}
$$

**Functional Form = Linear Model**

$$
\text{Y} = \beta{_0} + \beta{_1} + \beta{_2} + \beta{_3} + \beta{_4} + \beta{_5} + \varepsilon{}
$$

$$
\text{Y} = \beta{_0} + \beta{_1}\;X_1 + \beta{_2}\;X_2 + \beta{_3}\;X_3 + \beta{_4}\;X_4 + \beta{_5}\;X_5 + \varepsilon{}
$$

$$
Y_\text{fare\_amount} = \beta{_0} + \beta{_1}\;X_\text{passenger\_count} + \beta{_2}\;X_\text{mean\_distance} + \beta{_3}\;X_\text{mean\_duration} + \beta{_4}\;X_\text{rush\_hour} + \beta{_5}\;X_\text{VendorID\_2} + \varepsilon{}
$$


```python
X_train_scaled = pd.DataFrame(X_train_scaled, columns=X_train.columns)
ols_data = pd.concat([X_train_scaled, y_train], axis=1)
ols_formula = 'fare_amount ~ passenger_count + mean_distance + mean_duration + rush_hour + VendorID_2'
OLS = ols(formula=ols_formula, data=ols_data)
model = OLS.fit()
model.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>       <td>fare_amount</td>   <th>  R-squared:         </th> <td>   0.000</td> 
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>  -0.000</td> 
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>  0.3000</td> 
</tr>
<tr>
  <th>Date:</th>             <td>Wed, 01 Apr 2026</td> <th>  Prob (F-statistic):</th>  <td> 0.913</td>  
</tr>
<tr>
  <th>Time:</th>                 <td>23:11:28</td>     <th>  Log-Likelihood:    </th> <td> -54849.</td> 
</tr>
<tr>
  <th>No. Observations:</th>      <td> 14515</td>      <th>  AIC:               </th> <td>1.097e+05</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td> 14509</td>      <th>  BIC:               </th> <td>1.098e+05</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     5</td>      <th>                     </th>     <td> </td>    
</tr>
<tr>
  <th>Covariance Type:</th>      <td>nonrobust</td>    <th>                     </th>     <td> </td>    
</tr>
</table>
<table class="simpletable">
<tr>
         <td></td>            <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>       <td>   12.8953</td> <td>    0.088</td> <td>  146.671</td> <td> 0.000</td> <td>   12.723</td> <td>   13.068</td>
</tr>
<tr>
  <th>passenger_count</th> <td>   -0.0319</td> <td>    0.091</td> <td>   -0.351</td> <td> 0.726</td> <td>   -0.210</td> <td>    0.146</td>
</tr>
<tr>
  <th>mean_distance</th>   <td>    0.0070</td> <td>    0.181</td> <td>    0.039</td> <td> 0.969</td> <td>   -0.347</td> <td>    0.361</td>
</tr>
<tr>
  <th>mean_duration</th>   <td>    0.0270</td> <td>    0.182</td> <td>    0.149</td> <td> 0.882</td> <td>   -0.329</td> <td>    0.383</td>
</tr>
<tr>
  <th>rush_hour</th>       <td>   -0.0756</td> <td>    0.088</td> <td>   -0.861</td> <td> 0.389</td> <td>   -0.248</td> <td>    0.097</td>
</tr>
<tr>
  <th>VendorID_2</th>      <td>    0.0694</td> <td>    0.091</td> <td>    0.759</td> <td> 0.448</td> <td>   -0.110</td> <td>    0.248</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>6927.636</td> <th>  Durbin-Watson:     </th> <td>   2.015</td> 
</tr>
<tr>
  <th>Prob(Omnibus):</th>  <td> 0.000</td>  <th>  Jarque-Bera (JB):  </th> <td>34401.165</td>
</tr>
<tr>
  <th>Skew:</th>           <td> 2.354</td>  <th>  Prob(JB):          </th> <td>    0.00</td> 
</tr>
<tr>
  <th>Kurtosis:</th>       <td> 8.892</td>  <th>  Cond. No.          </th> <td>    3.92</td> 
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.



**Note:** Due to the data being scaled we can't use the Statsmodels ols function and so we have to use the scikit-learn implementation of a multiple linear regression model via `LinearRegression()`


```python
model = LinearRegression()
model.fit(X_train_scaled, y_train)
```




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
</style><div id="sk-container-id-1" class="sk-top-container"><div class="sk-text-repr-fallback"><pre>LinearRegression()</pre><b>In a Jupyter environment, please rerun this cell to show the HTML representation or trust the notebook. <br />On GitHub, the HTML representation is unable to render, please try loading this page with nbviewer.org.</b></div><div class="sk-container" hidden><div class="sk-item"><div class="sk-estimator fitted sk-toggleable"><input class="sk-toggleable__control sk-hidden--visually" id="sk-estimator-id-1" type="checkbox" checked><label for="sk-estimator-id-1" class="sk-toggleable__label fitted sk-toggleable__label-arrow"><div><div>LinearRegression</div></div><div><a class="sk-estimator-doc-link fitted" rel="noreferrer" target="_blank" href="https://scikit-learn.org/1.6/modules/generated/sklearn.linear_model.LinearRegression.html">?<span>Documentation for LinearRegression</span></a><span class="sk-estimator-doc-link fitted">i<span>Fitted</span></span></div></label><div class="sk-toggleable__content fitted"><pre>LinearRegression()</pre></div> </div></div></div></div>



### <a id='toc1_5_6_'></a>[**Task 8c. Evaluate model**](#toc0_)

**Linear Regression Evaluation Metrics**

**Residual (Error)**

$$
\text{Error}_i = \text{Actual} - \text{Predicted}
$$

$$
\varepsilon{}_i = y_i - \hat{y}_i
$$

**Mean Absolute Error**

$$
\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} \left| y_i - \hat{y}_i \right|
$$

**Mean Squared Error**

$$
\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} \left( y_i - \hat{y}_i \right)^2
$$

**Root Mean Squared Error**

$$
\text{RMSE} = \sqrt{\frac{1}{n} \sum_{i=1}^{n} \left(y_i - \hat{y}_i \right)^2}
$$

$$
n = \text{Number of Observations}
\qquad y_i = \text{Actual Value}
\qquad\hat{y}_i = \text{Predicted Value}
$$

### <a id='toc1_5_7_'></a>[**Train data**](#toc0_)

Evaluate your model performance by calculating the residual sum of squares and the explained variance score (R^2). Calculate the Mean Absolute Error, Mean Squared Error, and the Root Mean Squared Error.


```python
print('Training Data Evaluation Metrics')
R2 = model.score(X_train_scaled, y_train)
print(f'Coefficient of Determination:', R2)
y_pred_tr = model.predict(X_train_scaled)
print(f'R^2 Score:', r2_score(y_train, y_pred_tr))
print(f'MAE:', mean_absolute_error(y_train, y_pred_tr))
print(f'MSE:', mean_squared_error(y_train, y_pred_tr))
print(f'RMSE:', np.sqrt(mean_squared_error(y_train, y_pred_tr)))
```

    Training Data Evaluation Metrics
    Coefficient of Determination: 0.8398441560597107
    R^2 Score: 0.8398441560597107
    MAE: 2.186653656415597
    MSE: 17.8896550454961
    RMSE: 4.229616418245997
    

### <a id='toc1_5_8_'></a>[**Test data**](#toc0_)

Calculate the same metrics on the test data. Remember to scale the `X_test` data using the scaler that was fit to the training data. Do not refit the scaler to the testing data, just transform it. Call the results `X_test_scaled`.


```python
X_test_scaled = scaler.transform(X_test)
```


```python
print("Test Data Evaluation Metrics")
R2 = model.score(X_test_scaled, y_test)
y_pred = model.predict(X_test_scaled)
print(f'Coefficient of Determination:', R2)
print(f'R^2 Score:', r2_score(y_test, y_pred))
print(f'MAE:', mean_absolute_error(y_test, y_pred))
print(f'MSE:', mean_squared_error(y_test, y_pred))
print(f'RMSE:', np.sqrt(mean_squared_error(y_test, y_pred)))
```

    Test Data Evaluation Metrics
    Coefficient of Determination: 0.8682593840798523
    R^2 Score: 0.8682593840798523
    MAE: 2.1336444568022985
    MSE: 14.326343246314552
    RMSE: 3.7850156203527816
    

    c:\Users\alexa\anaconda3\envs\google_advanced_data_analytics\Lib\site-packages\sklearn\utils\validation.py:2739: UserWarning: X does not have valid feature names, but LinearRegression was fitted with feature names
      warnings.warn(
    c:\Users\alexa\anaconda3\envs\google_advanced_data_analytics\Lib\site-packages\sklearn\utils\validation.py:2739: UserWarning: X does not have valid feature names, but LinearRegression was fitted with feature names
      warnings.warn(
    

**Note:** The multiple linear regression models performance on both the training set and on the unseen test set is high and shows that the model has little bias and does not overfit the data. The MAE, MSE and RMSE all decreased from the training set on the test set, thereby indicating a better performance and generalisation of the model as the residuals of the model reduces. With regards to the Mean Absolute Error (MAE), of 2.13 on the test set, this shows that the predictions of the fare by the model are off by 2.13 USD, which in our case and the purposes of the model, a MAE of 2 is no more than twice as bad as an error of 1. The Root Mean Squared Error (RMSE) of 3.79 USD shows the typical error with there being a penalty for larger mistakes, and with this score being higher than our MAE, this thereby indicates that the model has some large prediction errors which are likely due to outliers or high fare trips. The goodness-of-fit of the model or coefficient of determination (R^2 Score) shows for the test set that 87% of the variance in fare_amount is explained by the independent variables in the model. With the coefficient of determination being close to 1, it therefore shows that there is a high level of explanatory power in the model.

### <a id='toc1_5_9_'></a>[**Imputing the fare amount for Ratecode = 2**](#toc0_)

From the data dictionary and our previous investigation into the occurance of 52 USD fare amount and its association with the RatecodeID of 2, we know this to be a flat rate fare for trips to JFK Airport. Therefore, we can impute the models predictions with this knowledge and specify that all of the Ratecodes of 2 can be imputed with 52 USD, meaning that these fares do not have to be predicted by the model.

Below we will impute this information into the predictions and then produce regression evaluation metrics in order to check model predictive performance.


```python
preds_adjusted = pd.DataFrame({'RatecodeID': rate_test})
preds_adjusted
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
      <th>RatecodeID</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5818</th>
      <td>1</td>
    </tr>
    <tr>
      <th>18134</th>
      <td>1</td>
    </tr>
    <tr>
      <th>4655</th>
      <td>1</td>
    </tr>
    <tr>
      <th>7378</th>
      <td>1</td>
    </tr>
    <tr>
      <th>13914</th>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
    </tr>
    <tr>
      <th>11108</th>
      <td>1</td>
    </tr>
    <tr>
      <th>7840</th>
      <td>1</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
    </tr>
    <tr>
      <th>16996</th>
      <td>1</td>
    </tr>
    <tr>
      <th>19601</th>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>4540 rows × 1 columns</p>
</div>



By coping the `RatecodeID` and taking a random sample we eliminate any sort of bias that could occour.


```python
preds_adjusted['y_pred'] = y_pred
preds_adjusted.loc[preds_adjusted['RatecodeID'] == 2, 'y_pred'] = 52
preds_adjusted[preds_adjusted['RatecodeID'] == 2].head()
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
      <th>RatecodeID</th>
      <th>y_pred</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>14816</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>22604</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>3684</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>15193</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>7129</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
preds_adjusted
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
      <th>RatecodeID</th>
      <th>y_pred</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5818</th>
      <td>1</td>
      <td>12.356882</td>
    </tr>
    <tr>
      <th>18134</th>
      <td>1</td>
      <td>16.315055</td>
    </tr>
    <tr>
      <th>4655</th>
      <td>1</td>
      <td>6.726839</td>
    </tr>
    <tr>
      <th>7378</th>
      <td>1</td>
      <td>16.227330</td>
    </tr>
    <tr>
      <th>13914</th>
      <td>1</td>
      <td>10.536428</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>11108</th>
      <td>1</td>
      <td>20.691724</td>
    </tr>
    <tr>
      <th>7840</th>
      <td>1</td>
      <td>5.933831</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>7.151351</td>
    </tr>
    <tr>
      <th>16996</th>
      <td>1</td>
      <td>6.695996</td>
    </tr>
    <tr>
      <th>19601</th>
      <td>1</td>
      <td>10.386165</td>
    </tr>
  </tbody>
</table>
<p>4540 rows × 2 columns</p>
</div>




```python
print('Adjusted Predictions Evaluation Metrics')
preds_adjusted = preds_adjusted['y_pred']
print(f'R2 Score:', r2_score(y_test, preds_adjusted))
print(f'MAE:', mean_absolute_error(y_test, preds_adjusted))
print(f'MSE:', mean_squared_error(y_test, preds_adjusted))
print(f'RMSE:', np.sqrt(mean_squared_error(y_test, preds_adjusted)))
```

    Adjusted Predictions Evaluation Metrics
    R2 Score: 0.8993714938178061
    MAE: 1.9848254649982011
    MSE: 10.943007286407553
    RMSE: 3.308021657487682
    

**Note:** Here we can see how the imputation of the RatecodeID of 2 for 52 USD has improved the models predictions, with a goodness-of-fit of the model improving compared to the previous R^2 Score on the test set, with a score of 90% compared to 87% on the test set. Additionally, the MAE score has slightly improved compared to that of the test set but yet again this difference in neglible as with our MAE a 2 is no  more than twice as bad as an error of 1. The RMSE has slightly improved from 3.79 on the test set to 3.30 with the imputations. Therefore, by imputing the fare amount for the RatecodeID of 2 for a value of 52 USD, this leads to improved performance of the model.

**Note:** The `preds_adjusted` will be used for the final predictions, reporting the performance of the model and deployment and real world use as it reflects what is actually delivered. Whereas the `y_pred` will be used for diagnosing model performance, understanding model limitations, comparing models and feature importance analysis as this is the pure machine learning performance.

## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

### <a id='toc1_6_1_'></a>[**Task 9a. Results**](#toc0_)

Use the code cell below to get `actual`,`predicted`, and `residual` for the testing set, and store them as columns in a `results` dataframe.


```python
results = pd.DataFrame(data={'actual': y_test,
                             'predicted': y_pred})
results['residual'] = results['actual'] - results['predicted']
results
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
      <th>actual</th>
      <th>predicted</th>
      <th>residual</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5818</th>
      <td>14.0</td>
      <td>12.356882</td>
      <td>1.643118</td>
    </tr>
    <tr>
      <th>18134</th>
      <td>28.0</td>
      <td>16.315055</td>
      <td>11.684945</td>
    </tr>
    <tr>
      <th>4655</th>
      <td>5.5</td>
      <td>6.726839</td>
      <td>-1.226839</td>
    </tr>
    <tr>
      <th>7378</th>
      <td>15.5</td>
      <td>16.227330</td>
      <td>-0.727330</td>
    </tr>
    <tr>
      <th>13914</th>
      <td>9.5</td>
      <td>10.536428</td>
      <td>-1.036428</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>11108</th>
      <td>21.5</td>
      <td>20.691724</td>
      <td>0.808276</td>
    </tr>
    <tr>
      <th>7840</th>
      <td>5.5</td>
      <td>5.933831</td>
      <td>-0.433831</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9.0</td>
      <td>7.151351</td>
      <td>1.848649</td>
    </tr>
    <tr>
      <th>16996</th>
      <td>7.0</td>
      <td>6.695996</td>
      <td>0.304004</td>
    </tr>
    <tr>
      <th>19601</th>
      <td>8.5</td>
      <td>10.386165</td>
      <td>-1.886165</td>
    </tr>
  </tbody>
</table>
<p>4540 rows × 3 columns</p>
</div>



### <a id='toc1_6_2_'></a>[**Task 9b. Visualize model results**](#toc0_)

Create a scatterplot to visualize `actual` vs. `predicted`.


```python
plt.figure(figsize=(10,10))
sns.scatterplot(x='actual', y='predicted', data=results, s=20, alpha=0.5)
plt.plot([0,60], [0,60], c='red', linewidth=2)
plt.title("Actual vs Predicted Values", fontsize=16)
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_155_0.png)
    


Visualize the distribution of the `residuals` using a histogram.


```python
plt.figure(figsize=(5,3))
sns.histplot(x=results['residual'], binrange=(-20,20), binwidth=1)
plt.title("Residuals Histogram")
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_157_0.png)
    



```python
print(f'Residual Mean:', results['residual'].mean())
```

    Residual Mean: -0.015436821023704222
    

**Note** The distribution of the residuals is normal and has a mean of -0.015. The variance in the dependent variable that is not explained by the model is the residuals, and here it shows a normal distribution around the 0 mark which indicate that the models errors are evenly distributed and unbiased.

Create a scatterplot of `residuals` over `predicted`.


```python
plt.figure(figsize=(10,10))
sns.scatterplot(x='predicted', y='residual', data=results)
plt.axhline(0, c='red')
plt.title("Residuals over Predicted Values Scatterplot")
plt.xlabel("Predicted Value")
plt.ylabel("Residual Value")
plt.show()
```


    
![png](Automatidata_Multiple_Linear_Regression_files/Automatidata_Multiple_Linear_Regression_161_0.png)
    


**Note:** The residuals of the model is evenly distributed around the zero mark except for the sloping lines from the upper left to the lower right which are the imputed values of 62.50 USD and the JFK airport flat rate of 52 USD.

### <a id='toc1_6_3_'></a>[**Task 9c. Coefficients**](#toc0_)

Use the `coef_` attribute to get the model's coefficients. The coefficients are output in the order of the features that were used to train the model. Which feature had the greatest effect on trip fare?


```python
coef = pd.DataFrame({'feature': X_train.columns,
                     'coefficient': model.coef_.flatten()})
coef
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
      <th>feature</th>
      <th>coefficient</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>passenger_count</td>
      <td>0.030821</td>
    </tr>
    <tr>
      <th>1</th>
      <td>mean_distance</td>
      <td>7.133741</td>
    </tr>
    <tr>
      <th>2</th>
      <td>mean_duration</td>
      <td>2.812239</td>
    </tr>
    <tr>
      <th>3</th>
      <td>rush_hour</td>
      <td>0.110234</td>
    </tr>
    <tr>
      <th>4</th>
      <td>VendorID_2</td>
      <td>-0.054370</td>
    </tr>
  </tbody>
</table>
</div>




```python
model.intercept_
```




    np.float64(12.891746241533124)



**Estimated Equation**

$$

\text{fare\_amount}_i=12.89 + 0.03\:(\text{passenger\_count}_i) + 7.13\:(\text{mean\_distance}_i) + 2.81\:(\text{mean\_duration}_i) + 0.11\:(\text{rush\_hour}_i) -0.05\:(\text{VendorID\_2}_i) +\varepsilon{_i}

$$

What do these coefficients mean? How should they be interpreted?

$$
\text{Y} = \beta{}X
$$

*A one unit change in X will induce a $\beta{}$ change in Y*

*Let's start with the variable with the greatest weight on the models predictions*

$$
\beta{_2}\:\text{mean\_distance} = 7.13
$$

$$
\beta{_{7.13}}
$$

The variable that's coefficient had the greatest weight on the multiple linear regression models final predictions was `mean_distance` with a estimated coefficient of 7.13. From the use of the `StandardScaler`, we don't interpret the coefficient results as seen above, with a one unit change in X inducing a coefficient change in Y, instead we have to use the standard deviation. For `mean_distance`, for every additional change in standard deviation, this leads to a mean of 7.13 USD increase in the fare amount. The variables standard deviation can be calculated and then the coefficient divided by this as to make the coefficient interpretation more interpretable, this is unscaling the data.


```python
print(f'mean_distance Standard Deviation:', X_train['mean_distance'].std())
print(f'Unscaled Coefficient:', 7.13374075181764 / X_train['mean_distance'].std())
```

    mean_distance Standard Deviation: 3.574812975256415
    Unscaled Coefficient: 1.9955563553100144
    

Here we can infer that for every 3.57 miles traveled, this leads to a mean of 7.13 USD increase in the fare amount, as the standard deviation was calculated and so the scaled coefficient can be better interpreted. Alternatively, we can infer for the unscaled coefficient for `mean_distance` in this sense for every 1 mile traveled, the fare amount increases by a mean of 2.00 USD.

*Lets do the rest of the coefficients*

$$
\beta{_1}\:\text{passenger\_count} = 0.03
$$


```python
print(f'passenger_count Standard Deviation:', X_train['passenger_count'].std())
print(f'Unscaled Coefficient:', 0.03 / X_train['passenger_count'].std())
```

    passenger_count Standard Deviation: 1.2881538235053889
    Unscaled Coefficient: 0.023289144085573952
    

**Interpretation:** For the scaled interpretation, the standard deviation can be rounded to 1 as there is no such thing as a 1.2 of a person, and so for every 1 passenger, this leads to a 0.03 USD increase in the fare amount. For the unscaled interpretation, for every 1 passenger, this leads to a 0.02 USD increase in the fare amount.

$$
\beta{_3}\:\text{mean\_duration} = 2.81
$$


```python
print(f'mean_duration Standard Deviation:', X_train['mean_duration'].std())
print(f'Unscaled Coefficient:', 2.81 / X_train['mean_duration'].std())
```

    mean_duration Standard Deviation: 10.09994831991223
    Unscaled Coefficient: 0.27821924538564563
    

**Interpretation:** For the scaled interpretation, the standard deviation for `mean_duration` is 10.10 which can be rounded to 10, and so for every 10 minutes during the taxi ride, this leads to the fare amount increasing by a mean of 2.81 USD. For the unscaled interpretation, this is 0.28 and so for every minute increase in the duration of the taxi ride, this leads to a increase in the fare amount by a mean of 0.28 USD.

$$
\beta{_4}\:\text{rush\_hour} = 0.11
$$


```python
print(f'rush_hour Standard Deviation:', X_train['rush_hour'].std())
print(f'Unscaled Coefficient:', 0.11 / X_train['rush_hour'].std())
```

    rush_hour Standard Deviation: 0.45664948029808095
    Unscaled Coefficient: 0.240884977966463
    

**Note:** When interpreting a binary variables and categorical variables, you are interpreting the coefficient for when the variable is in the comparison group, so when there is a rush hour or when it is Vendor 2.

**Interpretation:** The scaled interpretation for the coefficient is as follows, the standard deviation for the variable `rush_hour` is 0.46 which can be rounded to 1, and due to the variable being a binary where 1 means there is a rush hour, we can infer that when the taxi ride is during rush hour times, the fare amount will increase by 0.11 USD. The unscaled coefficient is 0.24, and so taxi rides during rush hour have fares that are 0.24 USD higher, on average compared to non-rush hour trips.

$$
\beta{_5}\:\text{VendorID\_2} = -0.05
$$


```python
print(f'VendorID_2 Standard Deviation:', X_train['VendorID_2'].std())
print(f'Unscaled Coefficient:', -0.05 / X_train['VendorID_2'].std())
```

    VendorID_2 Standard Deviation: 0.49682045811752745
    Unscaled Coefficient: -0.10063997805052553
    

**Interpretation:** For the scaled interpretation, the standard deviation is 0.50 which can be rounded up to 1 and so is when Vendor 2 is True, and so the trips by Vendor 2 have on average 0.05 USD lower fares than the baseline vendor of Vendor 1. The unscaled coefficient is -0.10 and so the Vendor 2 trips are associted with fares that are 0.10 lower than Vendor 1.

$$
\beta{_0}\:\text{Intercept} = 12.89
$$

**Interpretation:** Usually in a linear regression model, the intercept would be the value of the dependent variable when all the independent variables are equal to zero, but this is different in this case due to the use of `StandardScaler`. Given that the predictors were standardised, the intercept represents the expected fare when all the variables are at their mean values, providing a baseline estimate of 12.89 USD for a typical trip.

### <a id='toc1_6_4_'></a>[**Task 9d. Conclusion**](#toc0_)

1. What are the key takeaways from this notebook?



2. What results can be presented from this notebook?

**Answer**

1. The key takeaways from this notebook are that new features were engineered such as `duration`, `pickup_dropoff`, `mean_distance` and `mean_duration` as well as the outliers being imputed with the Interquartile Range method. A mutliple linear regression was conducted and the models evaluation metric showed an increase in predictive performance when the model was predicting on unseen test data. The evaluation metrics of MAE and RMSE showed that the models predictions was reasonably accurate on average with the MAE of 2.13 USD while the higher RMSE of 3.79 USD indicated the presence of large errors that were likely driven by outliers or high fare trips. Additionally, the goodness-of-fit of the model, via the model's R^2 Score, shows that 87% of the variation in fare_amount is explained by the independent variables in the model. Furthermore, the models residuals followed a normal distribution showing that they were evenly distributed around the zero mark indicating that the models residuals are unbiased. The coefficients were interpreted both in their scaled form and unscaled form for easier interpretation. Finally, the models performance was improved with the imputation on the predictions of the `RatecodeID` of 2 equalling a fare amount of 52 USD, resulting in a R^2 Score of 90%, a MAE of 1.98 USD and a RMSE of 3.30 USD. 

2. The results that can be presented from this notebook are the regression evaluation metric results on the test set and prediction imputations as well as the models coefficients and the data visualisations of the models residuals or any other relevant data visualisations.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged. 

## <a id='toc1_7_'></a>[**Appendix**](#toc0_)

### <a id='toc1_7_1_'></a>[**Multiple Linear Regression Results**](#toc0_)


```python
results.head(10)
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
      <th>actual</th>
      <th>predicted</th>
      <th>residual</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5818</th>
      <td>14.0</td>
      <td>12.356882</td>
      <td>1.643118</td>
    </tr>
    <tr>
      <th>18134</th>
      <td>28.0</td>
      <td>16.315055</td>
      <td>11.684945</td>
    </tr>
    <tr>
      <th>4655</th>
      <td>5.5</td>
      <td>6.726839</td>
      <td>-1.226839</td>
    </tr>
    <tr>
      <th>7378</th>
      <td>15.5</td>
      <td>16.227330</td>
      <td>-0.727330</td>
    </tr>
    <tr>
      <th>13914</th>
      <td>9.5</td>
      <td>10.536428</td>
      <td>-1.036428</td>
    </tr>
    <tr>
      <th>308</th>
      <td>23.5</td>
      <td>20.917375</td>
      <td>2.582625</td>
    </tr>
    <tr>
      <th>3061</th>
      <td>39.5</td>
      <td>37.033747</td>
      <td>2.466253</td>
    </tr>
    <tr>
      <th>12401</th>
      <td>57.5</td>
      <td>37.697220</td>
      <td>19.802780</td>
    </tr>
    <tr>
      <th>5662</th>
      <td>24.5</td>
      <td>22.981879</td>
      <td>1.518121</td>
    </tr>
    <tr>
      <th>21767</th>
      <td>8.0</td>
      <td>8.691486</td>
      <td>-0.691486</td>
    </tr>
  </tbody>
</table>
</div>




```python
results.to_csv("Multiple_Linear_Regression_Results.csv", index=False)
```

### <a id='toc1_7_2_'></a>[**Multiple Linear Regression Coefficients**](#toc0_)


```python
coef.loc[len(coef)] = ['intercept', model.intercept_]
```


```python
coef
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
      <th>feature</th>
      <th>coefficient</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>passenger_count</td>
      <td>0.030821</td>
    </tr>
    <tr>
      <th>1</th>
      <td>mean_distance</td>
      <td>7.133741</td>
    </tr>
    <tr>
      <th>2</th>
      <td>mean_duration</td>
      <td>2.812239</td>
    </tr>
    <tr>
      <th>3</th>
      <td>rush_hour</td>
      <td>0.110234</td>
    </tr>
    <tr>
      <th>4</th>
      <td>VendorID_2</td>
      <td>-0.054370</td>
    </tr>
    <tr>
      <th>5</th>
      <td>intercept</td>
      <td>12.891746</td>
    </tr>
  </tbody>
</table>
</div>




```python
coef.to_csv("Multiple_Linear_Regression_Coefficients.csv", index=False)
```

### <a id='toc1_7_3_'></a>[**Models Predictions**](#toc0_)


```python
nyc_preds = X_test[['mean_duration', 'mean_distance']].copy()
nyc_preds['predicted_fare'] = preds_adjusted
nyc_preds
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
      <th>mean_duration</th>
      <th>mean_distance</th>
      <th>predicted_fare</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5818</th>
      <td>13.318000</td>
      <td>2.868000</td>
      <td>12.356882</td>
    </tr>
    <tr>
      <th>18134</th>
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.315055</td>
    </tr>
    <tr>
      <th>4655</th>
      <td>7.250286</td>
      <td>0.881429</td>
      <td>6.726839</td>
    </tr>
    <tr>
      <th>7378</th>
      <td>15.218462</td>
      <td>4.542308</td>
      <td>16.227330</td>
    </tr>
    <tr>
      <th>13914</th>
      <td>12.711765</td>
      <td>1.973529</td>
      <td>10.536428</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>11108</th>
      <td>19.993333</td>
      <td>6.058333</td>
      <td>20.691724</td>
    </tr>
    <tr>
      <th>7840</th>
      <td>5.115000</td>
      <td>0.770000</td>
      <td>5.933831</td>
    </tr>
    <tr>
      <th>8</th>
      <td>7.872963</td>
      <td>1.019259</td>
      <td>7.151351</td>
    </tr>
    <tr>
      <th>16996</th>
      <td>6.027895</td>
      <td>0.993684</td>
      <td>6.695996</td>
    </tr>
    <tr>
      <th>19601</th>
      <td>12.621667</td>
      <td>1.856667</td>
      <td>10.386165</td>
    </tr>
  </tbody>
</table>
<p>4540 rows × 3 columns</p>
</div>




```python
len(preds_adjusted) == len(X_test)
```




    True




```python
nyc_preds.index.equals(X_test.index)
```




    True




```python
nyc_preds.to_csv("MLR Model Predictions.csv", index=False)
```
