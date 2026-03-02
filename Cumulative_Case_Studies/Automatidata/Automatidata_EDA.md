# <a id='toc1_'></a>[**Automatidata_EDA**](#toc0_)

**Course 3 - Go Beyond the Numbers: Translate Data into Insights**

**Table of contents**<a id='toc0_'></a>    
- [**Automatidata_EDA**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Luana Rodriguez, Senior Data Analyst**](#toc1_1_1_)    
    - [**Email from Udo Bankole, Director of Data Analysis**](#toc1_1_2_)    
    - [**Data Dictionary**](#toc1_1_3_)    
    - [**Objectives**](#toc1_1_4_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE: Plan**](#toc1_3_)    
    - [**Task 1. Imports, links, and loading**](#toc1_3_1_)    
  - [**PACE: Analyze**](#toc1_4_)    
    - [**Task 2a. Data exploration and cleaning**](#toc1_4_1_)    
    - [**Task 2b. Assess whether dimensions and measures are correct**](#toc1_4_2_)    
    - [**Task 2c. Select visualization type(s)**](#toc1_4_3_)    
  - [**PACE: Construct**](#toc1_5_)    
    - [**Task 3. Data visualization**](#toc1_5_1_)    
    - [**Boxplots**](#toc1_5_2_)    
      - [**Scatter plot**](#toc1_5_2_1_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Task 4a. Results and evaluation**](#toc1_6_1_)    
    - [**Task 4b. Conclusion**](#toc1_6_2_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

Your team is still in the early stages of their project for the New York City Taxi and Limousine Commission (TLC). So far, you’ve completed a project proposal and used Python to inspect and organize the TLC dataset.

You check your inbox and notice a new message from Luana Rodriguez, the Senior Data Analyst at Automatidata. Luana is pleased with the work you have already completed and requests your assistance with some exploratory data analysis (EDA) and data visualization. You also notice a follow-up email from Udo Bankole, the Director of Data Analysis. Udo suggests including an executive summary of your analysis to share with teammates. 

### <a id='toc1_1_1_'></a>[**Email from Luana Rodriguez, Senior Data Analyst**](#toc0_)

**Subject:** New York City TLC EDA & Vizes

**From:** "Luana, Rodriguez" Luana@automatidata.com

**Cc:** "Deshawn Washington" Deshawn@automatidata.com, "Udo Bankole" Udo@automatidata.com

Hi there,

Thanks for the amazing work you’ve done so far. 

We’re ready to perform EDA on the taxi data from the New York City TLC to get a general understanding of what taxi ridership looks like. Has Deshawn told you what the management team expects when it comes to EDA? If not, think of it as a “show your work” kind of report. They will want to see a Python notebook showing the structuring and cleaning you did, as well as any matplotlib/seaborn visualizations you plotted to help us understand the data. I would suggest at the very least a box plot of the ride durations and some time series plots, like a breakdown by quarter or month? Whatever you think makes most sense. 

Additionally, the management team has recently asked all EDA to include Tableau visualizations. We’ve found these to be particularly helpful in status reports to the client and board members. Make sure it is easy to understand to someone who isn’t data savvy, and remember that the assistant director at the New York City TLC is a person with visual impairments. I understand you have some Tableau experience? Let me know if you need help with this. 

By the way, I Cc’d our director, Udo, who is on the management team and will be reviewing/approving our analysis before the project manager reports it back to the client. @Udo, I just want to keep you informed on the progress! 

Thanks! 

Luana Rodriguez

Senior Data Analyst

Automatidata

### <a id='toc1_1_2_'></a>[**Email from Udo Bankole, Director of Data Analysis**](#toc0_)

**Subject:** RE: New York City TLC EDA & Vizes

**From:** "Udo Bankole" Udo@automatidata.com

**Cc:** "Deshawn Washington" Deshawn@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com

Thank you, Luana! 

Welcome to the team, so glad to have you. 

Along with the Tableau visualization and notebook, it would be really helpful if you included an executive summary of your analysis attached via email. 

I appreciate your help! 

Udo Bankole

Director of Data Analysis

Automatidata

### <a id='toc1_1_3_'></a>[**Data Dictionary**](#toc0_)

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

### <a id='toc1_1_4_'></a>[**Objectives**](#toc0_)

**The purpose** of this project is to conduct exploratory data analysis on a provided data set. Your mission is to continue the investigation you began in C2 and perform further EDA on this data with the aim of learning more about the variables.

**The goal** is to clean data set and create a visualization.

*This activity has 4 parts:*

**Part 1:** Imports, links, and loading

**Part 2:** Data Exploration
*   Data cleaning


**Part 3:** Building visualizations

**Part 4:** Evaluate and share results

Follow the instructions and answer the questions below to complete the activity. Then, you will complete an Executive Summary using the questions listed on the PACE Strategy Document.

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE: Plan**](#toc0_)

In this stage, consider the following questions where applicable to complete your code response:

1. Identify any outliers: 


*   What methods are best for identifying outliers?
*   How do you make the decision to keep or exclude outliers from any future models?


**Answer**

The methods that are best for identifying outliers are by looking at the values past three standard deviations of the mean and visualising the outliers in a boxplot. The decision on whether to keep or exclude the outliers is dependent on three options of to delete, reassign or leave them and whether they violate the model assumptions. In most cases the outliers are either left alone or reassigned rather than deleted.

### <a id='toc1_3_1_'></a>[**Task 1. Imports, links, and loading**](#toc0_)
Go to Tableau Public
The following link will help you complete this activity. Keep Tableau Public open as you proceed to the next steps. 

Link to supporting materials: 
Tableau Public: https://public.tableau.com/s/ 

For EDA of the data, import the data and packages that would be most helpful, such as pandas, numpy and matplotlib. 



```python
# Import packages and libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import datetime as dt
```


```python
# Load dataset into dataframe
df = pd.read_csv('2017_Yellow_Taxi_Trip_Data.csv')
```

## <a id='toc1_4_'></a>[**PACE: Analyze**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

### <a id='toc1_4_1_'></a>[**Task 2a. Data exploration and cleaning**](#toc0_)

Decide which columns are applicable

The first step is to assess your data. Check the Data Source page on Tableau Public to get a sense of the size, shape and makeup of the data set. Then answer these questions to yourself: 

Given our scenario, which data columns are most applicable? 
Which data columns can I eliminate, knowing they won’t solve our problem scenario? 

Consider functions that help you understand and structure the data. 

*    `head()`
*    `describe()`
*    `info()`
*    `groupby()`
*    `sortby()`

What do you do about missing data (if any)? 

Are there data outliers? What are they and how might you handle them? 

What do the distributions of your variables tell you about the question you're asking or the problem you're trying to solve?

**Answer**

There is no missing data in the dataset, but there are data outliers in `trip_distance`, `RateCodeID`, `fare_amount` and `total_amount`, with them being possible data quality issues and the best way to deal with these would be to reassign them. The distributions of the variables are right skewed, showing that there is a small amount of more extreme outliers.

Start by discovering, using head and size. 


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
      <td>03/25/2017 8:55:43 AM</td>
      <td>03/25/2017 9:09:47 AM</td>
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
      <td>04/11/2017 2:53:28 PM</td>
      <td>04/11/2017 3:19:58 PM</td>
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
      <td>12/15/2017 7:26:56 AM</td>
      <td>12/15/2017 7:34:08 AM</td>
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
      <td>05/07/2017 1:17:59 PM</td>
      <td>05/07/2017 1:48:14 PM</td>
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
      <td>04/15/2017 11:32:20 PM</td>
      <td>04/15/2017 11:49:03 PM</td>
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
    <tr>
      <th>5</th>
      <td>23345809</td>
      <td>2</td>
      <td>03/25/2017 8:34:11 PM</td>
      <td>03/25/2017 8:42:11 PM</td>
      <td>6</td>
      <td>2.30</td>
      <td>1</td>
      <td>N</td>
      <td>161</td>
      <td>236</td>
      <td>1</td>
      <td>9.0</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>2.06</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>12.36</td>
    </tr>
    <tr>
      <th>6</th>
      <td>37660487</td>
      <td>2</td>
      <td>05/03/2017 7:04:09 PM</td>
      <td>05/03/2017 8:03:47 PM</td>
      <td>1</td>
      <td>12.83</td>
      <td>1</td>
      <td>N</td>
      <td>79</td>
      <td>241</td>
      <td>1</td>
      <td>47.5</td>
      <td>1.0</td>
      <td>0.5</td>
      <td>9.86</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>59.16</td>
    </tr>
    <tr>
      <th>7</th>
      <td>69059411</td>
      <td>2</td>
      <td>08/15/2017 5:41:06 PM</td>
      <td>08/15/2017 6:03:05 PM</td>
      <td>1</td>
      <td>2.98</td>
      <td>1</td>
      <td>N</td>
      <td>237</td>
      <td>114</td>
      <td>1</td>
      <td>16.0</td>
      <td>1.0</td>
      <td>0.5</td>
      <td>1.78</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>19.58</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8433159</td>
      <td>2</td>
      <td>02/04/2017 4:17:07 PM</td>
      <td>02/04/2017 4:29:14 PM</td>
      <td>1</td>
      <td>1.20</td>
      <td>1</td>
      <td>N</td>
      <td>234</td>
      <td>249</td>
      <td>2</td>
      <td>9.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>9.80</td>
    </tr>
    <tr>
      <th>9</th>
      <td>95294817</td>
      <td>1</td>
      <td>11/10/2017 3:20:29 PM</td>
      <td>11/10/2017 3:40:55 PM</td>
      <td>1</td>
      <td>1.60</td>
      <td>1</td>
      <td>N</td>
      <td>239</td>
      <td>237</td>
      <td>1</td>
      <td>13.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>2.75</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.55</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.size
```




    408582



Use describe... 


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



And info. 


```python
df.info()
```

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
    

There is no missing data according to the output from the `.info()` function

### <a id='toc1_4_2_'></a>[**Task 2b. Assess whether dimensions and measures are correct**](#toc0_)

On the data source page in Tableau, double check the data types for the applicable columns you selected on the previous step. Pay close attention to the dimensions and measures to assure they are correct. 

In Python, consider the data types of the columns. *Consider:* Do they make sense? 

Review the link provided in the previous activity instructions to create the required Tableau visualization. 

### <a id='toc1_4_3_'></a>[**Task 2c. Select visualization type(s)**](#toc0_)

Select data visualization types that will help you understand and explain the data.

Now that you know which data columns you’ll use, it is time to decide which data visualization makes the most sense for EDA of the TLC dataset. What type of data visualization(s) would be most helpful? 

* Line graph
* Bar chart
* Box plot
* Histogram
* Heat map
* Scatter plot
* A geographic map

**Answer**

The types of visualisations that would be the most helpful for NYC TLC are box plots to determine outliers and where the majority of the data points reside as well as histograms to see the distributions of the variables. Additionally, scatter plots will be helpful by visualising the trends and patterns of the variables as well as highlighting outliers. Finally, bar charts will be helpful to viusalise the average number of trips and total revenue for months and weekdays.

## <a id='toc1_5_'></a>[**PACE: Construct**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Construct stage.

### <a id='toc1_5_1_'></a>[**Task 3. Data visualization**](#toc0_)

You’ve assessed your data, and decided on which data variables are most applicable. It’s time to plot your visualization(s)!

### <a id='toc1_5_2_'></a>[**Boxplots**](#toc0_)

Perform a check for outliers on relevant columns such as trip distance and trip duration. Remember, some of the best ways to identify the presence of outliers in data are box plots and histograms. 

**Note:** Remember to convert your date columns to datetime in order to derive total trip duration.  


```python
df['tpep_pickup_datetime'] = pd.to_datetime(df['tpep_pickup_datetime'])
df['tpep_dropoff_datetime'] = pd.to_datetime(df['tpep_dropoff_datetime'])
```

**trip distance**


```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['trip_distance'])
plt.title("trip_distance")
plt.show()
```


    
<img width="414" height="160" alt="Automatidata_EDA_49_0" src="https://github.com/user-attachments/assets/b64722a5-f2d7-4d8d-b6b2-6dc42b1822a8" />

    



```python
plt.figure(figsize=(5,3))
sns.histplot(x=df['trip_distance'], binrange=(0, 35), binwidth=1)
plt.title('trip_distance Histogram')
plt.show()
```


    
<img width="472" height="314" alt="Automatidata_EDA_50_0" src="https://github.com/user-attachments/assets/ca74e8b6-a18a-4e25-898d-99008b347937" />

    


The majority of the trips were journeys of less than 2 miles, with the number of travels falling down steeply as the distance traveled increases over 2 miles.

**total amount**


```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['total_amount'])
plt.title('total_amount')
plt.show()
```


    
<img width="412" height="160" alt="Automatidata_EDA_53_0" src="https://github.com/user-attachments/assets/cf19c9e8-afb6-4942-9ed4-78a15257140c" />

    



```python
plt.figure(figsize=(5,3))
sns.histplot(x=df['total_amount'], binrange=(-10, 100), binwidth=5)
plt.title('total_amount Histogram')
plt.show()
```


    
<img width="472" height="314" alt="Automatidata_EDA_54_0" src="https://github.com/user-attachments/assets/6a8b4b64-5b13-4964-bc8b-cf5ae06c95f1" />

    


The total amount for each journey has a distribution that is right-skewed with the majority of journeys costing between 5-15 USD.

**tip amount**


```python
plt.figure(figsize=(5,1))
sns.boxplot(x=df['tip_amount'])
plt.title('tip_amount')
plt.show()
```


    
<img width="412" height="160" alt="Automatidata_EDA_57_0" src="https://github.com/user-attachments/assets/758b2fdd-2baf-4b2d-805c-93e879fd0142" />

    



```python
plt.figure(figsize=(5,3))
sns.histplot(x=df['tip_amount'], binrange=(0, 30), binwidth=1)
plt.title('tip_amount Histogram')
plt.show()
```


    
<img width="472" height="314" alt="Automatidata_EDA_58_0" src="https://github.com/user-attachments/assets/b18e9437-da80-478f-9192-83c2800f3013" />

    


The histogram shows that the distribution for the tip amount is right-skewed, with nearly all of the tips being in the 0-3 USD range.

**tip_amount by vendor**


```python
plt.figure(figsize=(12,5))
sns.histplot(data=df, x='tip_amount', binrange=(0,30), binwidth=1, hue='VendorID', multiple='stack', palette='pastel')
plt.title('tip_amount by Vendor Histogram')
plt.show()
```


    
<img width="1014" height="468" alt="Automatidata_EDA_61_0" src="https://github.com/user-attachments/assets/a073be58-82dd-4692-b367-0022907a051a" />

    


There are no noticeable differences in the distribution of tips between the two types of vendors, with vendor 2 having more a slightly more share of the journeys in the dataset and thus this proportion is approximately upheld throughout all of the tip amounts.

Next, zoom in on the upper end of the range of tips to check whether vendor one gets noticeably more of the most generous tips.


```python
tips = df[df['tip_amount'] > 10]
plt.figure(figsize=(12, 5))
ax = sns.histplot(data=tips, x='tip_amount', binrange=(10,30), binwidth=1, hue='VendorID', multiple='stack', palette='pastel')
ax.set_xticks(range(10, 31, 1))
plt.title('tip_amount above $10 by Vendor Histogram')
plt.show()
```


    
<img width="1005" height="468" alt="Automatidata_EDA_64_0" src="https://github.com/user-attachments/assets/4d04feba-10c3-4ec8-a36b-f5624714ee33" />

    


The distribution of the tip amounts by vendors is maintained with the same proportions even at the larger tip amounts with the exception of the extreme values which came from few journeys.

**Mean tips by passenger count**

Examine the unique values in the `passenger_count` column.


```python
df['passenger_count'].value_counts()
```




    passenger_count
    1    16117
    2     3305
    5     1143
    3      953
    6      693
    4      455
    0       33
    Name: count, dtype: int64



Majority of the rides were by a single occupant, and there is also 33 rides with an occupancy of 0 which doesn't make sense. These would be excluded unless there is an appropriate explanation for them.


```python
avg_tips_pc = df.groupby(['passenger_count'])[['tip_amount']].mean()
avg_tips_pc
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
      <th>tip_amount</th>
    </tr>
    <tr>
      <th>passenger_count</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.135758</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.848920</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.856378</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.716768</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.530264</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1.873185</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1.720260</td>
    </tr>
  </tbody>
</table>
</div>




```python
avg_tips_pc_sort = avg_tips_pc.drop(0, axis=0)
plt.figure(figsize=(5,3))
ax = sns.barplot(data=avg_tips_pc_sort, x='passenger_count', y='tip_amount')
ax.axhline(df['tip_amount'].mean(), ls='--', color='red', label='Mean tip_amount')
plt.xlabel('Passenger Count')
plt.ylabel('Tip Amount')
plt.title('Average Tips Amount by Passenger Count')
plt.show()
```


    
<img width="467" height="314" alt="Automatidata_EDA_70_0" src="https://github.com/user-attachments/assets/8518e955-12ae-419b-a250-cbfbac9c9187" />

    


The mean tip amount varies very slightly by the passenger count, with there being a drop for 4 passengers but this is expected due to 4 passengers count was one of the least amount of passengers in the dataset.

**Create month and day columns**


```python
df['month'] = df['tpep_pickup_datetime'].dt.month_name().str.slice(stop=3)
df['day'] = df['tpep_pickup_datetime'].dt.day_name()
```

**Plot total ride count by month**

Begin by calculating total ride count by month.


```python
rides_by_month = df['month'].value_counts()
rides_by_month
```




    month
    Mar    2049
    Oct    2027
    Apr    2019
    May    2013
    Jan    1997
    Jun    1964
    Dec    1863
    Nov    1843
    Feb    1769
    Sep    1734
    Aug    1724
    Jul    1697
    Name: count, dtype: int64



Reorder the results to put the months in calendar order.


```python
month_order = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
```


```python
rides_by_month = rides_by_month.reindex(index=month_order)
rides_by_month
```




    month
    Jan    1997
    Feb    1769
    Mar    2049
    Apr    2019
    May    2013
    Jun    1964
    Jul    1697
    Aug    1724
    Sep    1734
    Oct    2027
    Nov    1843
    Dec    1863
    Name: count, dtype: int64




```python
rides_by_month.index
```




    Index(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct',
           'Nov', 'Dec'],
          dtype='object', name='month')




```python
plt.figure(figsize=(8,5))
sns.barplot(x=rides_by_month.index, y=rides_by_month)
plt.title('Total Rides per Month')
plt.show()
```


    
<img width="704" height="468" alt="Automatidata_EDA_80_0" src="https://github.com/user-attachments/assets/b01d2a1e-47b8-491e-b0a5-80220fc32e1b" />

    


The total rides per month is fairly consistent with their being drops in the months of July, August and September as well as in February.

**Plot total ride count by day**

Repeat the above process, but now calculate the total rides by day of the week.


```python
rides_by_day = df['day'].value_counts()
day_order = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
rides_by_day = rides_by_day.reindex(index=day_order)
rides_by_day
```




    day
    Monday       2931
    Tuesday      3198
    Wednesday    3390
    Thursday     3402
    Friday       3413
    Saturday     3367
    Sunday       2998
    Name: count, dtype: int64




```python
plt.figure(figsize=(8,5))
sns.barplot(x=rides_by_day.index, y=rides_by_day)
plt.title('Total Rides by Weekday')
plt.show()
```


    
<img width="704" height="468" alt="Automatidata_EDA_84_0" src="https://github.com/user-attachments/assets/ac06fcfd-3d18-4e6d-8a23-a58f9bd58d95" />

    


Wednesday to Saturday has the most amount of daily rides with Sunday and Monday having the least.

**Plot total revenue by day of the week**

Repeat the above process, but now calculate the total revenue by day of the week.


```python
tr_day = df.groupby(['day'])[['total_amount']].sum()
tr_day = tr_day.reindex(index=day_order)
tr_day
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
      <th>total_amount</th>
    </tr>
    <tr>
      <th>day</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Monday</th>
      <td>49574.37</td>
    </tr>
    <tr>
      <th>Tuesday</th>
      <td>52527.14</td>
    </tr>
    <tr>
      <th>Wednesday</th>
      <td>55310.47</td>
    </tr>
    <tr>
      <th>Thursday</th>
      <td>57181.91</td>
    </tr>
    <tr>
      <th>Friday</th>
      <td>55818.74</td>
    </tr>
    <tr>
      <th>Saturday</th>
      <td>51195.40</td>
    </tr>
    <tr>
      <th>Sunday</th>
      <td>48624.06</td>
    </tr>
  </tbody>
</table>
</div>




```python
plt.figure(figsize=(8,5))
sns.barplot(data=tr_day, x='day', y='total_amount', order=day_order)
plt.xlabel('Weekday')
plt.ylabel('Total Revenue (USD)')
plt.title('Total Revenue by Day')
plt.show()
```


    
<img width="713" height="468" alt="Automatidata_EDA_88_0" src="https://github.com/user-attachments/assets/9675a92f-e7ba-43ed-96cc-f19e8dfd02a3" />

    


Thursday had the highest total revenue out of all the days with Sunday and Monday having the least. It is interesting to note that Saturday only had 35 fewer journeys than Thursday but yet its total revenue was 6,000 USD less than Thursday's.

**Plot total revenue by month**


```python
tr_month = df.groupby(['month'])[['total_amount']].sum()
tr_month = tr_month.reindex(index=month_order)
tr_month
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
      <th>total_amount</th>
    </tr>
    <tr>
      <th>month</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Jan</th>
      <td>31735.25</td>
    </tr>
    <tr>
      <th>Feb</th>
      <td>28937.89</td>
    </tr>
    <tr>
      <th>Mar</th>
      <td>33085.89</td>
    </tr>
    <tr>
      <th>Apr</th>
      <td>32012.54</td>
    </tr>
    <tr>
      <th>May</th>
      <td>33828.58</td>
    </tr>
    <tr>
      <th>Jun</th>
      <td>32920.52</td>
    </tr>
    <tr>
      <th>Jul</th>
      <td>26617.64</td>
    </tr>
    <tr>
      <th>Aug</th>
      <td>27759.56</td>
    </tr>
    <tr>
      <th>Sep</th>
      <td>28206.38</td>
    </tr>
    <tr>
      <th>Oct</th>
      <td>33065.83</td>
    </tr>
    <tr>
      <th>Nov</th>
      <td>30800.44</td>
    </tr>
    <tr>
      <th>Dec</th>
      <td>31261.57</td>
    </tr>
  </tbody>
</table>
</div>




```python
plt.figure(figsize=(8,5))
sns.barplot(data=tr_month, x='month', y='total_amount', order=month_order)
plt.xlabel('Month')
plt.ylabel('Total Revenue (USD)')
plt.title('Total Revenue by Month')
plt.show()
```


    
<img width="713" height="468" alt="Automatidata_EDA_92_0" src="https://github.com/user-attachments/assets/a7ddf3b4-3c7b-426c-8334-a77eef13d233" />

    


The total revenue by month follows the similar pattern of the monthly total rides, with the drop in July, August, September and February, with May being the highest month for total revenue.

#### <a id='toc1_5_2_1_'></a>[**Scatter plot**](#toc0_)

You can create a scatterplot in Tableau Public, which can be easier to manipulate and present showing the relationship between total_amount and trip_distance. Consider adding the Tableau visualization to your executive summary, and adding key insights from your findings on those two variables.

**Plot mean trip distance by drop-off location**


```python
df['DOLocationID'].nunique()
```




    216




```python
drop_off = df.groupby(['DOLocationID'])[['trip_distance']].mean()
drop_off = drop_off.sort_values(by='trip_distance')
drop_off
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
      <th>DOLocationID</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>207</th>
      <td>1.200000</td>
    </tr>
    <tr>
      <th>193</th>
      <td>1.390556</td>
    </tr>
    <tr>
      <th>237</th>
      <td>1.555494</td>
    </tr>
    <tr>
      <th>234</th>
      <td>1.727806</td>
    </tr>
    <tr>
      <th>137</th>
      <td>1.818852</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
    </tr>
    <tr>
      <th>51</th>
      <td>17.310000</td>
    </tr>
    <tr>
      <th>11</th>
      <td>17.945000</td>
    </tr>
    <tr>
      <th>210</th>
      <td>20.500000</td>
    </tr>
    <tr>
      <th>29</th>
      <td>21.650000</td>
    </tr>
    <tr>
      <th>23</th>
      <td>24.275000</td>
    </tr>
  </tbody>
</table>
<p>216 rows × 1 columns</p>
</div>




```python
plt.figure(figsize=(15,6))
ax = sns.barplot(data=drop_off, x='DOLocationID', y='trip_distance', order=drop_off.index, palette='husl')
ax.set_xticks(range(0, len(drop_off) + 1, 10))
ax.set_xticklabels(range(0, len(drop_off) + 1, 10))
plt.xlabel('Drop-Off Location ID')
plt.ylabel('Avg Trip Distance')
plt.title('Mean Trip Distance by Drop-Off Locations')
plt.show();
```

    C:\Users\alexa\AppData\Local\Temp\ipykernel_25676\2149935871.py:2: FutureWarning: 
    
    Passing `palette` without assigning `hue` is deprecated and will be removed in v0.14.0. Assign the `x` variable to `hue` and set `legend=False` for the same effect.
    
      ax = sns.barplot(data=drop_off, x='DOLocationID', y='trip_distance', order=drop_off.index, palette='husl')
    


    
<img width="1229" height="545" alt="Automatidata_EDA_99_1" src="https://github.com/user-attachments/assets/701099ac-9c57-4377-a1fe-a8328e9b0134" />

    


This bar chart represents a characteristic curve that is related to the cumulative density function of a normal distribution, essentially it indicates that the drop-off locations are relatively evenly distributed over the area. This is beneficial to us as the dataset doesn't contain any coordinates and therefore there was no way of testing the distribution of locations.

**Histogram of rides by drop-off location**

First, check to whether the drop-off locations IDs are consecutively numbered. For instance, does it go 1, 2, 3, 4..., or are some numbers missing (e.g., 1, 3, 4...). If numbers aren't all consecutive, the histogram will look like some locations have very few or no rides when in reality there's no bar because there's no location. 


```python
df['DOLocationID'].max() - len(set(df['DOLocationID']))
```




    49



There are 49 numbers that do not represent a drop-off location

To eliminate the spaces in the historgram that these missing numbers would create, sort the unique drop-off location values, then convert them to strings. This will make the histplot function display all bars directly next to each other. 


```python
drop_off_sorted = df['DOLocationID'].sort_values()
drop_off_sorted = drop_off_sorted.astype(str)
plt.figure(figsize=(15, 6))
ax = sns.histplot(x=drop_off_sorted, bins=range(0, df['DOLocationID'].max() + 1, 1))
ax.set_xticks(range(0, df['DOLocationID'].max() + 1, 10))
ax.set_xticklabels(range(0, df['DOLocationID'].max() + 1, 10))
plt.xlabel('Drop-Off Locations')
plt.ylabel('Count')
plt.title('Rides by Drop-Off Locations Histogram')
plt.show()
```


    
<img width="1251" height="545" alt="Automatidata_EDA_106_0" src="https://github.com/user-attachments/assets/af03ff72-e6fd-4bf3-808a-5a75a425e2b1" />

    


Out of all of the drop-off locations there are locations which recieve a disproportionate amount of drop-offs compared to the rest of the locations. This could be due to common trips such as to the airports and train stations and to popular tourist destinations such as Time Square, therefore it would be useful to know the location that each location ID corresponds with.

## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the PACE Strategy Document to reflect on the Execute stage.

### <a id='toc1_6_1_'></a>[**Task 4a. Results and evaluation**](#toc0_)

Having built visualizations in Tableau and in Python, what have you learned about the dataset? What other questions have your visualizations uncovered that you should pursue? 

***Pro tip:*** Put yourself in your client's perspective, what would they want to know? 

Use the following code fields to pursue any additional EDA based on the visualizations you've already plotted. Also use the space to make sure your visualizations are clean, easily understandable, and accessible. 

***Ask yourself:*** Did you consider color, contrast, emphasis, and labeling?

I have learned .... that there are many outlier/extreme values in the dataset as well as right-skew distributions. Additionally, the tip amount across the different vendors had the same distribution across the vendor types relative to the vendor types proportion in the dataset, with this distribution being maintained even at larger tip amounts. The average tip amount by passenger count varies slightly by the passenger count with their being a slight dip with 4 passengers, but this is expected due to the low passenger count of 4 passengers in the dataset. The total rides per month was fairly consistent with March and October having the most monthly rides and drops in July, August, September and February. I contrast, the total rides per day had Wednesday through to Saturday having the most amount of daily rides with Sunday and Monday having the least. Total revenue by day had Thursday with the highest amount of total revenue with Sunday and Monday having the least. Total revenue by month showed a similar pattern to the monthly total rides with drops occurring in July, August, September and February, with May having the highest amount of total revenue. Finally, the drop-off locations are evenly distributed over the area of New York, with the Histogram showing that some of the locations receive a disproportionate amount of drop-offs compared to the other locations and this could be due to common trips such as to the airport or tourist destinations.

My other questions are .... why is May and Thursday the highest amount of total revenue? Why are there trip distances of 0 and what could they be? Why are their extreme values in trip distance such as over 33 miles? What do the location ID's refer to? Why is their a big drop in total revenue between Thursday and Saturday when there is a small difference in their total rides?

My client would likely want to know ... what variables contribute the most to predicting taxi fares? Is drop-off location ID important to predicting taxi fares? My client would also likely want to know the trip duration of each trip which can be derived from the drop-off and pick-up times.



```python
df['trip_duration'] = (df['tpep_dropoff_datetime'] - df['tpep_pickup_datetime'])
```


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
      <th>fare_amount</th>
      <th>extra</th>
      <th>mta_tax</th>
      <th>tip_amount</th>
      <th>tolls_amount</th>
      <th>improvement_surcharge</th>
      <th>total_amount</th>
      <th>month</th>
      <th>day</th>
      <th>trip_duration</th>
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
      <td>13.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>2.76</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.56</td>
      <td>Mar</td>
      <td>Saturday</td>
      <td>0 days 00:14:04</td>
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
      <td>16.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>4.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>20.80</td>
      <td>Apr</td>
      <td>Tuesday</td>
      <td>0 days 00:26:30</td>
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
      <td>6.5</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>1.45</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>8.75</td>
      <td>Dec</td>
      <td>Friday</td>
      <td>0 days 00:07:12</td>
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
      <td>20.5</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>6.39</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>27.69</td>
      <td>May</td>
      <td>Sunday</td>
      <td>0 days 00:30:15</td>
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
      <td>16.5</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>17.80</td>
      <td>Apr</td>
      <td>Saturday</td>
      <td>0 days 00:16:43</td>
    </tr>
    <tr>
      <th>5</th>
      <td>23345809</td>
      <td>2</td>
      <td>2017-03-25 20:34:11</td>
      <td>2017-03-25 20:42:11</td>
      <td>6</td>
      <td>2.30</td>
      <td>1</td>
      <td>N</td>
      <td>161</td>
      <td>236</td>
      <td>...</td>
      <td>9.0</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>2.06</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>12.36</td>
      <td>Mar</td>
      <td>Saturday</td>
      <td>0 days 00:08:00</td>
    </tr>
    <tr>
      <th>6</th>
      <td>37660487</td>
      <td>2</td>
      <td>2017-05-03 19:04:09</td>
      <td>2017-05-03 20:03:47</td>
      <td>1</td>
      <td>12.83</td>
      <td>1</td>
      <td>N</td>
      <td>79</td>
      <td>241</td>
      <td>...</td>
      <td>47.5</td>
      <td>1.0</td>
      <td>0.5</td>
      <td>9.86</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>59.16</td>
      <td>May</td>
      <td>Wednesday</td>
      <td>0 days 00:59:38</td>
    </tr>
    <tr>
      <th>7</th>
      <td>69059411</td>
      <td>2</td>
      <td>2017-08-15 17:41:06</td>
      <td>2017-08-15 18:03:05</td>
      <td>1</td>
      <td>2.98</td>
      <td>1</td>
      <td>N</td>
      <td>237</td>
      <td>114</td>
      <td>...</td>
      <td>16.0</td>
      <td>1.0</td>
      <td>0.5</td>
      <td>1.78</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>19.58</td>
      <td>Aug</td>
      <td>Tuesday</td>
      <td>0 days 00:21:59</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8433159</td>
      <td>2</td>
      <td>2017-02-04 16:17:07</td>
      <td>2017-02-04 16:29:14</td>
      <td>1</td>
      <td>1.20</td>
      <td>1</td>
      <td>N</td>
      <td>234</td>
      <td>249</td>
      <td>...</td>
      <td>9.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>9.80</td>
      <td>Feb</td>
      <td>Saturday</td>
      <td>0 days 00:12:07</td>
    </tr>
    <tr>
      <th>9</th>
      <td>95294817</td>
      <td>1</td>
      <td>2017-11-10 15:20:29</td>
      <td>2017-11-10 15:40:55</td>
      <td>1</td>
      <td>1.60</td>
      <td>1</td>
      <td>N</td>
      <td>239</td>
      <td>237</td>
      <td>...</td>
      <td>13.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>2.75</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.55</td>
      <td>Nov</td>
      <td>Friday</td>
      <td>0 days 00:20:26</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 21 columns</p>
</div>



### <a id='toc1_6_2_'></a>[**Task 4b. Conclusion**](#toc0_)
*Make it professional and presentable*

You have visualized the data you need to share with the director now. Remember, the goal of a data visualization is for an audience member to glean the information on the chart in mere seconds.

*Questions to ask yourself for reflection:*
Why is it important to conduct Exploratory Data Analysis? Why are the data visualizations provided in this notebook useful?


EDA is important because ... it helps us to understand the dataset, identify and understand its outliers, conduct data cleaning, producing insights and preparing the data for modelling.

Visualizations helped me understand ... how the variables are distributed as well as how other variables interact with each other and visualising the outliers in the data so they can be dealt with.

You’ve now completed professional data visualizations according to a business need. Well done! 

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.

