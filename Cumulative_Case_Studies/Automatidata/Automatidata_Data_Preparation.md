# <a id='toc1_'></a>[**Automatidata_Data_Preparation**](#toc0_)

**Course 2 - Get Started with Python**

**Table of contents**<a id='toc0_'></a>    
- [**Automatidata_Data_Preparation**](#toc1_)    
  - [**Scenario**](#toc1_1_)    
    - [**Email from Deshawn Washingotn, Data Analysis Manager**](#toc1_1_1_)    
    - [**Email from Luana Rodriquez, Senior Data Analyst**](#toc1_1_2_)    
    - [**Data Dictionary**](#toc1_1_3_)    
    - [**Objectives**](#toc1_1_4_)    
  - [**PACE Stages**](#toc1_2_)    
  - [**PACE:Plan**](#toc1_3_)    
    - [**Task 1. Understand the situation**](#toc1_3_1_)    
  - [**PACE: Analyze**](#toc1_4_)    
    - [**Task 2a. Build dataframe**](#toc1_4_1_)    
    - [**Task 2b. Understand the data - Inspect the data**](#toc1_4_2_)    
    - [**Task 2c. Understand the data - Investigate the variables**](#toc1_4_3_)    
  - [**PACE: Construct**](#toc1_5_)    
  - [**PACE: Execute**](#toc1_6_)    
    - [**Given your efforts, what can you summarize for DeShawn and the data team?**](#toc1_6_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[**Scenario**](#toc0_)

You are the newest member of Automatidata's data analytics team. Your team is still in the early stages of their project for the New York City Taxi & Limousine Commission
(TLC).

Previously, you were asked to complete a project proposal by your supervisor, Deshawn Washington. You have received notice that your project proposal has been approved
and that TLC has given the Automatidata team access to their data for research purposes. Congratulations! To get clear insights, TLC's data must be analyzed, key variables
identified, and the dataset ensured it is ready for analysis.

You discover two new emails in your inbox: one from your supervisor, Deshawn Washington, and one from your teammate, Luana Rodriguez. Review the emails, then follow
the provided instructions to complete the PACE strategy document, the code notebook, and the executive summary.

### <a id='toc1_1_1_'></a>[**Email from Deshawn Washingotn, Data Analysis Manager**](#toc0_)

**Subject:** Help with coding notebook?

**From:** "Deshawn Washington," Deshawn@automatidata.com

**Cc:** "Luana Rodriquez" Luana@automatidata.com

Good morning team,

I have a couple of updates on the TLC project. The project proposal that you completed previously has been approved. Thanks for all of your great work so far. Additionally, I
just received an email from our Senior Project Manager, Uli King, that TLC has given our team access to their data.

Before we begin the process of Exploratory Data Analysis (EDA), we could really use your help with coding and prepping the data. During your interview you mentioned that
you worked with Python during the Google Career Certificate program. That experience sounds applicable here.

Luana (Cc'd) started a Jupyter notebook with the relevant dataset from TLC (attached). She is busy in the final stages of another project currently. I'm sure she could use
your assistance in completing the coding and setting up the notebook for the TLC project.

Luana, do you mind sharing the details?

Humblest regards,

Deshawn Washington

Data Analysis Manager

Automatidata

### <a id='toc1_1_2_'></a>[**Email from Luana Rodriquez, Senior Data Analyst**](#toc0_)

**Subject:** RE: Help with coding notebook?

**From:** "Luana Rodriquez" Luana@automatidata.com

**Cc:** "Deshawn Washington," Deshawn@automatidata.com

Nice to meet you (virtually)! 

Hope you have enjoyed your first few weeks! 

The project proposal you helped prepare covered the major points of this project, so I’ll get right to how you can assist the team. There are a number of us making adjustments to the machine learning developed for the last client, so your help is greatly appreciated!

Until we finish the prior project, there is no need to do a full EDA on this data. We will get to that soon. Do you mind reviewing the TLC data we received for the team? It would be fantastic if you could include a summary of the column Dtypes, data value nonnull counts, relevant and irrelevant columns, along with anything else code related you think is worth sharing in the notebook? It would be really helpful if you can create meaningful variables by combining or modifying the structures given. 

Thanks,

Luana Rodriquez

Senior Data Analyst

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

**The purpose** of this project is to investigate and understand the data provided.

**The goal** is to use a dataframe contructed within Python, perform a cursory inspection of the provided dataset, and inform team members of your findings.

In this activity, you will examine data provided and prepare it for analysis.  This activity will help ensure the information is,

1.   Ready to answer questions and yield insights

2.   Ready for visualizations

3.   Ready for future hypothesis testing and statistical methods

*This activity has three parts:*

**Part 1:** Understand the situation 
* Prepare to understand and organize the provided taxi cab dataset and information.

**Part 2:** Understand the data

* Create a pandas dataframe for data learning, future exploratory data analysis (EDA), and statistical activities.

* Compile summary information about the data to inform next steps.

**Part 3:** Understand the variables

* Use insights from your examination of the summary data to guide deeper investigation into specific variables.

Follow the instructions and answer the following questions to complete the activity. Then, you will complete an Executive Summary using the questions listed on the PACE Strategy Document.

## <a id='toc1_2_'></a>[**PACE Stages**](#toc0_)

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## <a id='toc1_3_'></a>[**PACE:Plan**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response:

### <a id='toc1_3_1_'></a>[**Task 1. Understand the situation**](#toc0_)

*   How can you best prepare to understand and organize the provided taxi cab information? 

**Answer**

By examining the data dictionary and exploring the dataset, and to start inspecting it with Python to obtain initial observations. These initial observations about the data can be relayed to Deshawn Washington and be used to guide EDA. The next steps would be to learn more about the data and to check for anomalies with EDA.

## <a id='toc1_4_'></a>[**PACE: Analyze**](#toc0_)

Consider the questions in your PACE Strategy Document to reflect on the Analyze stage.

### <a id='toc1_4_1_'></a>[**Task 2a. Build dataframe**](#toc0_)

Create a pandas dataframe for data learning, and future exploratory data analysis (EDA) and statistical activities.

**Code the following,**

*   import pandas as `pd`. pandas is used for buidling dataframes.

*   import numpy as `np`. numpy is imported with pandas

*   `df = pd.read_csv('Datasets\NYC taxi data.csv')`

**Note:** pair the data object name `df` with pandas functions to manipulate data, such as `df.groupby()`.

**Note:** As shown in this cell, the dataset has been automatically loaded in for you. You do not need to download the .csv file, or provide more code, in order to access the dataset and proceed with this lab. Please continue with this activity by completing the following instructions.


```python
#Import libraries and packages listed above
import pandas as pd
import numpy as np

# Load dataset into dataframe
df = pd.read_csv('2017_Yellow_Taxi_Trip_Data.csv')
print("done")
```

    done
    

### <a id='toc1_4_2_'></a>[**Task 2b. Understand the data - Inspect the data**](#toc0_)

View and inspect summary information about the dataframe by coding the following:

1. `df.head(10)`
2. `df.info()`
3. `df.describe()`

Consider the following two questions:

**Question 1:** When reviewing the `df.info()` output, what do you notice about the different variables? Are there any null values? Are all of the variables numeric? Does anything else stand out?

**Question 2:** When reviewing the `df.describe()` output, what do you notice about the distributions of each variable? Are there any questionable values?

**Answer**

Q1. From the `.info()` output there is no null data and there are non-numeric variables with two of them being datetime

Q2. From the `.describe()` output shows strong right-skewed fare variables with extreme outliers, negative monetary values and potentially miscoded entries such as `RatecodeID` having a maximum value of 99. Additionally, the `trip_distance` is normally between 1-3 miles but has a maximum value of over 33 miles. Therefore, the data has data quality issues and requires cleaning and handling of outliers.


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



### <a id='toc1_4_3_'></a>[**Task 2c. Understand the data - Investigate the variables**](#toc0_)

Sort and interpret the data table for two variables:`trip_distance` and `total_amount`.

**Answer the following three questions:**

**Question 1:** Sort your first variable (`trip_distance`) from maximum to minimum value, do the values seem normal?

**Question 2:** Sort by your second variable (`total_amount`), are any values unusual?

**Question 3:** Are the resulting rows similar for both sorts? Why or why not?

**Answer**

Q1. No these values do not seem normal as 33 miles is a far distance to go for a single trip.

Q2. Yes the unusual values are the negative total amounts and the extreme amounts for a single trip such as the 1200 USD and 450 USD total amounts.

Q3. Yes both of the rows for the sorting of `total_amounts` both descending and ascending are similar in the fact that they both display outlier/unusual values.


```python
# Sort the data by trip distance from maximum to minimum value
df.sort_values(by=['trip_distance'], ascending=False)
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
      <th>9280</th>
      <td>51810714</td>
      <td>2</td>
      <td>06/18/2017 11:33:25 PM</td>
      <td>06/19/2017 12:12:38 AM</td>
      <td>2</td>
      <td>33.96</td>
      <td>5</td>
      <td>N</td>
      <td>132</td>
      <td>265</td>
      <td>2</td>
      <td>150.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>150.30</td>
    </tr>
    <tr>
      <th>13861</th>
      <td>40523668</td>
      <td>2</td>
      <td>05/19/2017 8:20:21 AM</td>
      <td>05/19/2017 9:20:30 AM</td>
      <td>1</td>
      <td>33.92</td>
      <td>5</td>
      <td>N</td>
      <td>229</td>
      <td>265</td>
      <td>1</td>
      <td>200.01</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>51.64</td>
      <td>5.76</td>
      <td>0.3</td>
      <td>258.21</td>
    </tr>
    <tr>
      <th>6064</th>
      <td>49894023</td>
      <td>2</td>
      <td>06/13/2017 12:30:22 PM</td>
      <td>06/13/2017 1:37:51 PM</td>
      <td>1</td>
      <td>32.72</td>
      <td>3</td>
      <td>N</td>
      <td>138</td>
      <td>1</td>
      <td>1</td>
      <td>107.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>55.50</td>
      <td>16.26</td>
      <td>0.3</td>
      <td>179.06</td>
    </tr>
    <tr>
      <th>10291</th>
      <td>76319330</td>
      <td>2</td>
      <td>09/11/2017 11:41:04 AM</td>
      <td>09/11/2017 12:18:58 PM</td>
      <td>1</td>
      <td>31.95</td>
      <td>4</td>
      <td>N</td>
      <td>138</td>
      <td>265</td>
      <td>2</td>
      <td>131.00</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>131.80</td>
    </tr>
    <tr>
      <th>29</th>
      <td>94052446</td>
      <td>2</td>
      <td>11/06/2017 8:30:50 PM</td>
      <td>11/07/2017 12:00:00 AM</td>
      <td>1</td>
      <td>30.83</td>
      <td>1</td>
      <td>N</td>
      <td>132</td>
      <td>23</td>
      <td>1</td>
      <td>80.00</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>18.56</td>
      <td>11.52</td>
      <td>0.3</td>
      <td>111.38</td>
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
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>5207</th>
      <td>66879879</td>
      <td>1</td>
      <td>08/07/2017 3:42:56 PM</td>
      <td>08/07/2017 3:43:48 PM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>233</td>
      <td>233</td>
      <td>3</td>
      <td>2.50</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>3.30</td>
    </tr>
    <tr>
      <th>319</th>
      <td>14024301</td>
      <td>1</td>
      <td>02/22/2017 4:01:44 AM</td>
      <td>02/22/2017 4:01:53 AM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>90</td>
      <td>90</td>
      <td>3</td>
      <td>2.50</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>3.80</td>
    </tr>
    <tr>
      <th>246</th>
      <td>78660848</td>
      <td>1</td>
      <td>09/18/2017 8:50:53 PM</td>
      <td>09/18/2017 8:51:03 PM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>145</td>
      <td>145</td>
      <td>2</td>
      <td>2.50</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>3.80</td>
    </tr>
    <tr>
      <th>15084</th>
      <td>68075265</td>
      <td>1</td>
      <td>08/11/2017 6:16:12 PM</td>
      <td>08/11/2017 6:17:43 PM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>249</td>
      <td>249</td>
      <td>3</td>
      <td>3.00</td>
      <td>1.0</td>
      <td>0.5</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>0.3</td>
      <td>4.80</td>
    </tr>
    <tr>
      <th>13359</th>
      <td>3055315</td>
      <td>1</td>
      <td>01/12/2017 7:19:36 AM</td>
      <td>01/12/2017 7:19:56 AM</td>
      <td>1</td>
      <td>0.00</td>
      <td>5</td>
      <td>N</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>75.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>18.65</td>
      <td>18.00</td>
      <td>0.3</td>
      <td>111.95</td>
    </tr>
  </tbody>
</table>
<p>22699 rows × 18 columns</p>
</div>




```python
# Sort the data by total amount and print the top 20 values
df.sort_values(by=['total_amount'], ascending=False)['total_amount'].head(20)
```




    8476     1200.29
    20312     450.30
    13861     258.21
    12511     233.74
    15474     211.80
    6064      179.06
    16379     157.06
    3582      152.30
    11269     151.82
    9280      150.30
    1928      137.80
    10291     131.80
    6708      126.00
    11608     123.30
    908       121.56
    7281      120.96
    18130     119.31
    13621     115.94
    13359     111.95
    29        111.38
    Name: total_amount, dtype: float64




```python
# Sort the data by total amount and print the bottom 20 values
df.sort_values(by=['total_amount'], ascending=False).tail(20)
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
      <th>14283</th>
      <td>37675840</td>
      <td>1</td>
      <td>05/03/2017 7:44:28 PM</td>
      <td>05/03/2017 7:44:38 PM</td>
      <td>1</td>
      <td>0.00</td>
      <td>5</td>
      <td>N</td>
      <td>146</td>
      <td>146</td>
      <td>3</td>
      <td>0.01</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>0.31</td>
    </tr>
    <tr>
      <th>19067</th>
      <td>58713019</td>
      <td>1</td>
      <td>07/10/2017 2:40:09 PM</td>
      <td>07/10/2017 2:40:59 PM</td>
      <td>1</td>
      <td>0.10</td>
      <td>5</td>
      <td>N</td>
      <td>261</td>
      <td>13</td>
      <td>3</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>0.30</td>
    </tr>
    <tr>
      <th>10506</th>
      <td>26005024</td>
      <td>2</td>
      <td>03/30/2017 3:14:26 AM</td>
      <td>03/30/2017 3:14:28 AM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>264</td>
      <td>193</td>
      <td>1</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th>4402</th>
      <td>108016954</td>
      <td>2</td>
      <td>12/20/2017 4:06:53 PM</td>
      <td>12/20/2017 4:47:50 PM</td>
      <td>1</td>
      <td>7.06</td>
      <td>1</td>
      <td>N</td>
      <td>263</td>
      <td>169</td>
      <td>2</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th>22566</th>
      <td>19022898</td>
      <td>2</td>
      <td>03/07/2017 2:24:47 AM</td>
      <td>03/07/2017 2:24:50 AM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>264</td>
      <td>193</td>
      <td>1</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th>5722</th>
      <td>49670364</td>
      <td>2</td>
      <td>06/12/2017 12:08:55 PM</td>
      <td>06/12/2017 12:08:57 PM</td>
      <td>1</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>264</td>
      <td>193</td>
      <td>1</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th>1646</th>
      <td>57337183</td>
      <td>2</td>
      <td>07/05/2017 11:02:23 AM</td>
      <td>07/05/2017 11:03:00 AM</td>
      <td>1</td>
      <td>0.04</td>
      <td>1</td>
      <td>N</td>
      <td>79</td>
      <td>79</td>
      <td>3</td>
      <td>-2.50</td>
      <td>0.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-3.30</td>
    </tr>
    <tr>
      <th>314</th>
      <td>105454287</td>
      <td>2</td>
      <td>12/13/2017 2:02:39 AM</td>
      <td>12/13/2017 2:03:08 AM</td>
      <td>6</td>
      <td>0.12</td>
      <td>1</td>
      <td>N</td>
      <td>161</td>
      <td>161</td>
      <td>3</td>
      <td>-2.50</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-3.80</td>
    </tr>
    <tr>
      <th>5758</th>
      <td>833948</td>
      <td>2</td>
      <td>01/03/2017 8:15:23 PM</td>
      <td>01/03/2017 8:15:39 PM</td>
      <td>1</td>
      <td>0.02</td>
      <td>1</td>
      <td>N</td>
      <td>170</td>
      <td>170</td>
      <td>3</td>
      <td>-2.50</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-3.80</td>
    </tr>
    <tr>
      <th>18565</th>
      <td>43859760</td>
      <td>2</td>
      <td>05/22/2017 3:51:20 PM</td>
      <td>05/22/2017 3:52:22 PM</td>
      <td>1</td>
      <td>0.10</td>
      <td>1</td>
      <td>N</td>
      <td>230</td>
      <td>163</td>
      <td>3</td>
      <td>-3.00</td>
      <td>0.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-3.80</td>
    </tr>
    <tr>
      <th>5448</th>
      <td>28459983</td>
      <td>2</td>
      <td>04/06/2017 12:50:26 PM</td>
      <td>04/06/2017 12:52:39 PM</td>
      <td>1</td>
      <td>0.25</td>
      <td>1</td>
      <td>N</td>
      <td>90</td>
      <td>68</td>
      <td>3</td>
      <td>-3.50</td>
      <td>0.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-4.30</td>
    </tr>
    <tr>
      <th>10281</th>
      <td>55302347</td>
      <td>2</td>
      <td>06/05/2017 5:34:25 PM</td>
      <td>06/05/2017 5:36:29 PM</td>
      <td>2</td>
      <td>0.00</td>
      <td>1</td>
      <td>N</td>
      <td>238</td>
      <td>238</td>
      <td>4</td>
      <td>-2.50</td>
      <td>-1.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-4.30</td>
    </tr>
    <tr>
      <th>4423</th>
      <td>97329905</td>
      <td>2</td>
      <td>11/16/2017 8:13:30 PM</td>
      <td>11/16/2017 8:14:50 PM</td>
      <td>2</td>
      <td>0.06</td>
      <td>1</td>
      <td>N</td>
      <td>237</td>
      <td>237</td>
      <td>4</td>
      <td>-3.00</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-4.30</td>
    </tr>
    <tr>
      <th>20317</th>
      <td>75926915</td>
      <td>2</td>
      <td>09/09/2017 10:59:51 PM</td>
      <td>09/09/2017 11:02:06 PM</td>
      <td>1</td>
      <td>0.24</td>
      <td>1</td>
      <td>N</td>
      <td>116</td>
      <td>116</td>
      <td>4</td>
      <td>-3.50</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-4.80</td>
    </tr>
    <tr>
      <th>8204</th>
      <td>91187947</td>
      <td>2</td>
      <td>10/28/2017 8:39:36 PM</td>
      <td>10/28/2017 8:41:59 PM</td>
      <td>1</td>
      <td>0.41</td>
      <td>1</td>
      <td>N</td>
      <td>236</td>
      <td>237</td>
      <td>3</td>
      <td>-3.50</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-4.80</td>
    </tr>
    <tr>
      <th>11204</th>
      <td>58395501</td>
      <td>2</td>
      <td>07/09/2017 7:20:59 AM</td>
      <td>07/09/2017 7:23:50 AM</td>
      <td>1</td>
      <td>0.64</td>
      <td>1</td>
      <td>N</td>
      <td>50</td>
      <td>48</td>
      <td>3</td>
      <td>-4.50</td>
      <td>0.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-5.30</td>
    </tr>
    <tr>
      <th>14714</th>
      <td>109276092</td>
      <td>2</td>
      <td>12/24/2017 10:37:58 PM</td>
      <td>12/24/2017 10:41:08 PM</td>
      <td>5</td>
      <td>0.40</td>
      <td>1</td>
      <td>N</td>
      <td>164</td>
      <td>161</td>
      <td>4</td>
      <td>-4.00</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-5.30</td>
    </tr>
    <tr>
      <th>17602</th>
      <td>24690146</td>
      <td>2</td>
      <td>03/24/2017 7:31:13 PM</td>
      <td>03/24/2017 7:34:49 PM</td>
      <td>1</td>
      <td>0.46</td>
      <td>1</td>
      <td>N</td>
      <td>87</td>
      <td>45</td>
      <td>4</td>
      <td>-4.00</td>
      <td>-1.0</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-5.80</td>
    </tr>
    <tr>
      <th>20698</th>
      <td>14668209</td>
      <td>2</td>
      <td>02/24/2017 12:38:17 AM</td>
      <td>02/24/2017 12:42:05 AM</td>
      <td>1</td>
      <td>0.70</td>
      <td>1</td>
      <td>N</td>
      <td>65</td>
      <td>25</td>
      <td>4</td>
      <td>-4.50</td>
      <td>-0.5</td>
      <td>-0.5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-5.80</td>
    </tr>
    <tr>
      <th>12944</th>
      <td>29059760</td>
      <td>2</td>
      <td>04/08/2017 12:00:16 AM</td>
      <td>04/08/2017 11:15:57 PM</td>
      <td>1</td>
      <td>0.17</td>
      <td>5</td>
      <td>N</td>
      <td>138</td>
      <td>138</td>
      <td>4</td>
      <td>-120.00</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>-0.3</td>
      <td>-120.30</td>
    </tr>
  </tbody>
</table>
</div>




```python
# How many of each payment type are represented in the data?
df['payment_type'].value_counts()
```




    payment_type
    1    15265
    2     7267
    3      121
    4       46
    Name: count, dtype: int64



According to the data dictionary, the payment method was encoded as follows:

1 = Credit card  
2 = Cash  
3 = No charge  
4 = Dispute  
5 = Unknown  
6 = Voided trip


```python
# What is the average tip for trips paid for with credit card?
cc_avg_tip = df[df['payment_type'] == 1]['tip_amount'].mean()
print(f'Average tip for trips paid by credit card:', cc_avg_tip)

# What is the average tip for trips paid for with cash?
cash_avg_tip = df[df['payment_type'] == 2]['tip_amount'].mean()
print(f'Average tip for trips paid by cash:', cash_avg_tip)
```

    Average tip for trips paid by credit card: 2.7298001965280054
    Average tip for trips paid by cash: 0.0
    


```python
# How many times is each vendor ID represented in the data?
df['VendorID'].value_counts()
```




    VendorID
    2    12626
    1    10073
    Name: count, dtype: int64




```python
# What is the mean total amount for each vendor?
df.groupby(['VendorID'])['total_amount'].mean()
```




    VendorID
    1    16.298119
    2    16.320382
    Name: total_amount, dtype: float64




```python
# Filter the data for credit card payments only

credit_card_df = df[df['payment_type'] == 1]

# Filter the credit-card-only data for passenger count only
credit_card_df['passenger_count'].value_counts()
```




    passenger_count
    1    10977
    2     2168
    5      775
    3      600
    6      451
    4      267
    0       27
    Name: count, dtype: int64




```python
# Calculate the average tip amount for each passenger count (credit card payments only)
credit_card_df.groupby(['passenger_count'])['tip_amount'].mean()
```




    passenger_count
    0    2.610370
    1    2.714681
    2    2.829949
    3    2.726800
    4    2.607753
    5    2.762645
    6    2.643326
    Name: tip_amount, dtype: float64



## <a id='toc1_5_'></a>[**PACE: Construct**](#toc0_)

**Note**: The Construct stage does not apply to this workflow. The PACE framework can be adapted to fit the specific requirements of any project. 

## <a id='toc1_6_'></a>[**PACE: Execute**](#toc0_)

Consider the questions in your PACE Strategy Document and those below to craft your response.

### <a id='toc1_6_1_'></a>[**Given your efforts, what can you summarize for DeShawn and the data team?**](#toc0_)

*Note for Learners: Your notebook should contain data that can address Luana's requests. Which two variables are most helpful for building a predictive model for the client: NYC TLC?*

**Answer**

The two variables that are most helpful for building a predictive model for NYC TLC are `total_amount` and `trip_distance`, due to these variables displaying the picture of a taxi cab ride.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.
