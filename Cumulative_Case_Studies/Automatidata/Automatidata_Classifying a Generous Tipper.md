# **Automatidata_Classifying a Generous Tipper**

**Course 6 - The Nuts and Bolts of Machine Learning**

## **Scenario**

You are the newest member of Automatidata’s data analytics team. Your team is close to completing their project for the New York City Taxi & Limousine Commission (TLC). Previously, you completed a project proposal and used Python to explore and analyze the TLC dataset, create data visualizations, and conduct an A/B test. Most recently, you built an MLR model for fare amounts based on a variety of variables. 

The New York City TLC is impressed with your work so far. Now, they want your team to identify which variables or factors influence the amount of gratuity a rider gives a driver. Your work will help TLC stakeholders make informed business decisions that will increase gratuities and subsequently improve driver satisfaction. 

At a meeting with New York City TLC stakeholders, your team suggests building a random forest model to predict whether or not a rider will be a generous tipper (>= 20%). At the end of the meeting, Titus Nelson, the Operations Manager at the New York City TLC, says that he will share the suggestion with his organization's leadership team. 

A few days after the meeting, you receive an email from Juliana Soto, a Department Head at the New York City TLC. Juliana says that TLC leadership likes the idea of using a random forest model to predict gratuity and asks the team to share more details about the model. You also receive a follow-up email from Udo Bankole, the Director of Data Analysis at Automatidata. Udo asks you to build the random forest model and to prepare an executive summary to share your results. 

### **Email from Juliana Soto, Finance and Administration Department Head (NYC TLC)**

**Subject:** NYC TLC Approval of Algorithm

**From:** "Juliana Soto" Juliana.Soto@tlc.nyc

**Cc:** "Udo Bankole" Udo@automatidata.com, "Uli King" Uli@automatidata.com, "Deshawn Washington" Deshawn@automatidata.com, "Luana, Rodriguez" Luana@automatidata.com, "Titus Nelson" Titus.Nelson@tlc.nyc

Hello Automatidata Team,

Thank you for providing the details for the final phase of the prediction algorithm we have requested. I apologize for missing many of the weekly project meetings, but Titus has kept me informed of your progress. We discussed in detail your proposal for using a random forest model for prediction, and we are in agreement with you. 

If you would, please commence with the creation of the algorithm. It would be very helpful to provide a summary of what data indicators the algorithm is basing its results on and an idea of the confidence your team has in the accuracy of the result.  

Thank you for your great work,

Juliana Soto

Finance and Administration Department Head

New York City Taxi & Limousine Commision

*Learn more about [TLC's accessible vehicle initiatives](https://www1.nyc.gov/site/tlc/about/accessibility.page)*

### **Email from Udo Bankole, Director of Data Analysis (Automatidata)**

**Subject:** RE: TLC NYC Approval of Algorithm

**From:** "Udo Bankole" Udo@automatidata.com

**Cc:** "Luana, Rodriguez" Luana@automatidata.com

Hello data pros!

You have done great work so far. We are excited to find out what else you can discover in the data and for you to help us make data-driven business decisions.

If you would please build the random forest model we discussed using the data New York City TLC has provided. As you’re aware, you have already cleaned and run this data through a MLR model, but you always need to validate your variables and data. So please revisit the dataset.

Once complete, please send an executive summary to Deshawn and myself of what wording you plan to send to the client. Be sure to include what Juliana requested, a summary of the variables used, and an indication of how we can test the accuracy of the model. 

I look forward to exploring your build! 

Udo Bankole

Director of Data Analysis

Automatidata

### **Data Dictionary**

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

### **Objectives**

**The purpose** of this model is to find ways to generate more revenue for taxi cab drivers.

**The goal** of this model is to predict whether or not a customer is a generous tipper.

**Part 1:** Ethical considerations 
* Consider the ethical implications of the request 

* Should the objective of the model be adjusted?

**Part 2:** Feature engineering

* Perform feature selection, extraction, and transformation to prepare the data for modeling

**Part 3:** Modeling

* Build the models, evaluate them, and advise on next steps

## **PACE Stages**

Throughout these project notebooks, you'll see references to the problem-solving framework PACE. The following notebook components are labeled with the respective PACE stage: Plan, Analyze, Construct, and Execute.

## **PACE: Plan**

Consider the questions in your PACE Strategy Document to reflect on the Plan stage.

In this stage, consider the following questions:

1.   What are you being asked to do?


2.   What are the ethical implications of the model? What are the consequences of your model making errors?
     *   What is the likely effect of the model when it predicts a false negative (i.e., when the model says a customer will give a tip, but they actually won't)?
  
     *   What is the likely effect of the model when it predicts a false positive (i.e., when the model says a customer will not give a tip, but they actually will)?  
  
  
3.   Do the benefits of such a model outweigh the potential problems?
  
4.   Would you proceed with the request to build this model? Why or why not?
 
5.   Can the objective be modified to make it less problematic?

**Answer**

1. I am being asked to build a tree based machine learning model to predict on whether a customer will leave a tip for the ride.

2. The ethical implications of the model is that when the model predicts a false negative, it will lead to the taxi driver not getting a tip for the journey they thought they were going to get one for, and so will decrease the revenue for the driver. On the other hand, if the model predicts a false positive, this could lead to the taxi driver either not accepting the journey due to being indicated that there is no tip or to the driver accepting the journey anyway and recieving a tip.

3. Yes, the benefits of the model do infact outweigh the potential issues of the model as it will lead to an increase in the taxi drivers revenue, better experience for both the driver and passenger and will incentivise customers to leave tips for drivers if it increases the likelihood of the driver accepting the journey.

4. Yes I would proceed with the request to build this model as I think it will be beneficial to the taxi drivers of TLC NYC, especially in todays economic enviornment with rising inflation and cost of living, and so by building this model I would be helping the drivers to generate more revenue.

5. Yes, the objective being stated as to generate more revenue for the taxi drivers can be misinterpreted as seeing what maximum price a customer would pay for a ride and so could give the impression of greed. Therefore, the objective can be modified as to make it less problematic/controversial by stating that the objective is to generate more revenue for the taxi drivers via predicting whether a customer will leave a tip or not.

Suppose you were to modify the modeling objective so, instead of predicting people who won't tip at all, you predicted people who are particularly generous&mdash;those who will tip 20% or more? Consider the following questions:

1.  What features do you need to make this prediction?

2.  What would be the target variable?  

3.  What metric should you use to evaluate your model? Do you have enough information to decide this now?

**Asnwer**

1. The features I would need in order to make the prediction of who will tip 20% or more are `tip_amount`, `trip_distance`, `RateCodeID` and `passenger_count`.

2. The target variable will be `tip_amount` but could be featured engineered to be `tip_amount_20` where it is the tip amounts of 20% or more.

3. The metrics I should use in order to evaluate my model is a confusion matrix, precision, accuracy, recall and f1-score. Additionally, after further investigation or if the needs arise I could use different or additional evalutation metrics such as f-beta score, ROC-AUC and so on.

### **Task 1. Imports and data loading**

Import packages and libraries needed to build and evaluate random forest and XGBoost classification models.


```python
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, recall_score, precision_score, f1_score, confusion_matrix, ConfusionMatrixDisplay, classification_report, roc_auc_score, RocCurveDisplay
from xgboost import XGBClassifier
from xgboost import plot_importance
import pickle
```


```python
pd.set_option('display.max_columns', None)
```

Begin by reading in the data. There are two dataframes: one containing the original data, the other containing the mean durations, mean distances, and predicted fares from the previous course's project called nyc_preds_means.csv.

**Note:** `Pandas` reads in the dataset as `df0`, now inspect the first five rows. As shown in this cell, the dataset has been automatically loaded in for you. You do not need to download the .csv file, or provide more code, in order to access the dataset and proceed with this lab. Please continue with this activity by completing the following instructions.


```python
df0 = pd.read_csv('2017_Yellow_Taxi_Trip_Data.csv')
```

### **Prerequisits**

#### **Additional Data**

The additional data required for this project is the Multiple Linear Regression predictions for the `fare_amount`.

These predictions were made but only for the test set and not for the entire dataset, therefore the predictions need to be computed again for the whole dataset.

To save time, the `X` and `y` data will be imported in from the previous multiple linear regression notebook.


```python
X_MLR = pd.read_csv('MLR_X_data.csv')
y_MLR = pd.read_csv('MLR_y_data.csv')
```

#### **Linear Regression**


```python
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
```


```python
X_tr, X_val, y_tr, y_val = train_test_split(X_MLR, y_MLR, test_size=0.2, random_state=0)
```


```python
scaler = StandardScaler().fit(X_tr)
X_tr_Scaled = scaler.transform(X_tr)
model = LinearRegression()
model.fit(X_tr_Scaled, y_tr)
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




```python
X_scaled = scaler.transform(X_MLR)
```


```python
y_preds = model.predict(X_scaled)
```

#### **Prediction Imputation**

Now we will impute the fare amount for Ratecode = 2


```python
pred_adjusted = pd.DataFrame({'RatecodeID': df0['RatecodeID']})
pred_adjusted['y_pred'] = y_preds
pred_adjusted.loc[pred_adjusted['RatecodeID'] == 2, 'y_pred'] = 52
pred_adjusted[pred_adjusted['RatecodeID'] == 2].head()
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
      <th>11</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>110</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>161</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>247</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
    <tr>
      <th>379</th>
      <td>2</td>
      <td>52.0</td>
    </tr>
  </tbody>
</table>
</div>



#### **Prediction data**

Now we generate the ful prediction dataframe ready for our modelling.


```python
pred_adjusted = pred_adjusted['y_pred']
```


```python
nyc_preds_mlr = X_MLR[['mean_duration', 'mean_distance']].copy()
nyc_preds_mlr['predicted_fare'] = pred_adjusted
nyc_preds_mlr.head()
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
      <th>0</th>
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.434692</td>
    </tr>
    <tr>
      <th>1</th>
      <td>24.470000</td>
      <td>3.108889</td>
      <td>16.052301</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7.250286</td>
      <td>0.881429</td>
      <td>7.053754</td>
    </tr>
    <tr>
      <th>3</th>
      <td>30.250000</td>
      <td>3.700000</td>
      <td>18.731923</td>
    </tr>
    <tr>
      <th>4</th>
      <td>14.620000</td>
      <td>4.435000</td>
      <td>15.846545</td>
    </tr>
  </tbody>
</table>
</div>



Now some quick sanity checks


```python
len(pred_adjusted) == len(X_MLR)
```




    True




```python
nyc_preds_mlr.index.equals(X_MLR.index)
```




    True




```python
nyc_preds_mlr.to_csv('NYC_Preds_MLR.csv', index=False)
```

*`NYC_Preds_MLR.csv` is also available in the appendix*

Inspect the first few rows of `df0`.


```python
df0.head()
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
  </tbody>
</table>
</div>



Inspect the first few rows of `nyc_preds_mlr`.


```python
nyc_preds_mlr.head()
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
      <th>0</th>
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.434692</td>
    </tr>
    <tr>
      <th>1</th>
      <td>24.470000</td>
      <td>3.108889</td>
      <td>16.052301</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7.250286</td>
      <td>0.881429</td>
      <td>7.053754</td>
    </tr>
    <tr>
      <th>3</th>
      <td>30.250000</td>
      <td>3.700000</td>
      <td>18.731923</td>
    </tr>
    <tr>
      <th>4</th>
      <td>14.620000</td>
      <td>4.435000</td>
      <td>15.846545</td>
    </tr>
  </tbody>
</table>
</div>



#### **Join the two dataframes**

Join the two dataframes using a method of your choice.


```python
df = pd.concat([df0, nyc_preds_mlr], axis=1)
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
      <th>mean_duration</th>
      <th>mean_distance</th>
      <th>predicted_fare</th>
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
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.434692</td>
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
      <td>24.470000</td>
      <td>3.108889</td>
      <td>16.052301</td>
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
      <td>7.250286</td>
      <td>0.881429</td>
      <td>7.053754</td>
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
      <td>30.250000</td>
      <td>3.700000</td>
      <td>18.731923</td>
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
      <td>14.620000</td>
      <td>4.435000</td>
      <td>15.846545</td>
    </tr>
  </tbody>
</table>
</div>



## **PACE: Analyze**

Consider the questions in your PACE Strategy Documentto reflect on the Analyze stage.

### **Task 2. Feature engineering**

You have already prepared much of this data and performed exploratory data analysis (EDA) in previous courses. 

Call `info()` on the new combined dataframe.


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 22699 entries, 0 to 22698
    Data columns (total 21 columns):
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
     18  mean_duration          22699 non-null  float64
     19  mean_distance          22699 non-null  float64
     20  predicted_fare         22699 non-null  float64
    dtypes: float64(11), int64(7), object(3)
    memory usage: 3.6+ MB
    

You know from your EDA that customers who pay cash generally have a tip amount of $0. To meet the modeling objective, you'll need to sample the data to select only the customers who pay with credit card. 

Copy `df` and assign the result to a variable called `df1`. Then, use a Boolean mask to filter `df1` so it contains only customers who paid with credit card.


```python
df1 = df.copy()
df1 = df1[df1['payment_type'] == 1]
```

##### **Target**

Notice that there isn't a column that indicates tip percent, which is what you need to create the target variable. You'll have to engineer it. 

Add a `tip_percent` column to the dataframe by performing the following calculation:  
<br/>  


$$
tip\ percent = \frac{tip\ amount}{total\ amount - tip\ amount}
$$  

Round the result to three places beyond the decimal. **This is an important step.** It affects how many customers are labeled as generous tippers. In fact, without performing this step, approximately 1,800 people who do tip ≥ 20% would be labeled as not generous. 

To understand why, you must consider how floats work. Computers make their calculations using floating-point arithmetic (hence the word "float"). Floating-point arithmetic is a system that allows computers to express both very large numbers and very small numbers with a high degree of precision, encoded in binary. However, precision is limited by the number of bits used to represent a number, which is generally 32 or 64, depending on the capabilities of your operating system. 

This comes with limitations in that sometimes calculations that should result in clean, precise values end up being encoded as very long decimals. Take, for example, the following calculation:



```python
1.1 + 2.2
```




    3.3000000000000003



Notice the three that is 16 places to the right of the decimal. As a consequence, if you were to then have a step in your code that identifies values ≤ 3.3, this would not be included in the result. Therefore, whenever you perform a calculation to compute a number that is then used to make an important decision or filtration, round the number. How many degrees of precision you round to is your decision, which should be based on your use case. 

Refer to this [guide for more information related to floating-point arithmetic](https://floating-point-gui.de/formats/fp/).  


```python
df1['tip_percent'] = (df1['tip_amount'] / (df1['total_amount'] - df1['tip_amount'])).round(3)
```

Now create another column called `generous`. This will be the target variable. The column should be a binary indicator of whether or not a customer tipped ≥ 20% (0=no, 1=yes).

1. Begin by making the `generous` column a copy of the `tip_percent` column.
2. Reassign the column by converting it to Boolean (True/False).
3. Reassign the column by converting Boolean to binary (1/0).


```python
df1['generous'] = df1['tip_percent']
df1['generous'] = (df1['generous'] >= 0.2).astype(int)
df1['generous'].head()
```




    0    1
    1    1
    2    0
    3    1
    5    1
    Name: generous, dtype: int64



#### **Create day column**

Next, you're going to be working with the pickup and dropoff columns.

Convert the `tpep_pickup_datetime` and `tpep_dropoff_datetime` columns to datetime.


```python
df1['tpep_pickup_datetime'] = pd.to_datetime(df1['tpep_pickup_datetime'])
df1['tpep_dropoff_datetime'] = pd.to_datetime(df1['tpep_dropoff_datetime'])
```

Create a `day` column that contains only the day of the week when each passenger was picked up. Then, convert the values to lowercase.


```python
df1['day'] = df1['tpep_pickup_datetime'].dt.day_name().str.lower()
```

#### **Create time of day columns**

Next, engineer four new columns that represent time of day bins. Each column should contain binary values (0=no, 1=yes) that indicate whether a trip began (picked up) during the following times:

`am_rush` = [06:00&ndash;10:00)  
`daytime` = [10:00&ndash;16:00)  
`pm_rush` = [16:00&ndash;20:00)  
`nighttime` = [20:00&ndash;06:00)  

To do this, first create the four columns. For now, each new column should be identical and contain the same information: the hour (only) from the `tpep_pickup_datetime` column.


```python
df1['am_rush'] = df1['tpep_pickup_datetime'].dt.hour
df1['daytime'] = df1['tpep_pickup_datetime'].dt.hour
df1['pm_rush'] = df1['tpep_pickup_datetime'].dt.hour
df1['nighttime'] = df1['tpep_pickup_datetime'].dt.hour
```

You'll need to write four functions to convert each new column to binary (0/1). Begin with `am_rush`. Complete the function so if the hour is between [06:00–10:00), it returns 1, otherwise, it returns 0.


```python
def am_rush(column):
    if 6 <= column < 10:
        return 1
    else:
        return 0
```

Now, apply the `am_rush()` function to the `am_rush` series to perform the conversion. Print the first five values of the column to make sure it did what you expected it to do.

**Note:** Be careful! If you run this cell twice, the function will be reapplied and the values will all be changed to 0.


```python
df1['am_rush'] = df1['am_rush'].apply(am_rush)
df1['am_rush'].head(5)
```




    0    1
    1    0
    2    1
    3    0
    5    0
    Name: am_rush, dtype: int64



Write functions to convert the three remaining columns and apply them to their respective series.


```python
def daytime(column):
    if 10 <= column < 16:
        return 1
    else:
        return 0
```


```python
df1['daytime'] = df1['daytime'].apply(daytime)
df1['daytime'].head()
```




    0    0
    1    1
    2    0
    3    1
    5    0
    Name: daytime, dtype: int64




```python
def pm_rush(column):
    if 16 <= column < 20:
        return 1
    else:
        return 0
```


```python
df1['pm_rush'] = df1['pm_rush'].apply(pm_rush)
df1['pm_rush'].head()
```




    0    0
    1    0
    2    0
    3    0
    5    0
    Name: pm_rush, dtype: int64




```python
def nighttime(column):
    if 20 <= column < 24:
        return 1
    elif 0 <= column < 6:
        return 1
    else:
        return 0
```


```python
df1['nighttime'] = df1['nighttime'].apply(nighttime)
df1['nighttime'].head()
```




    0    0
    1    0
    2    0
    3    0
    5    1
    Name: nighttime, dtype: int64



#### **Create `month` column**

Now, create a `month` column that contains only the abbreviated name of the month when each passenger was picked up, then convert the result to lowercase.


```python
df1['month'] = df1['tpep_pickup_datetime'].dt.month_name().str.lower()
df1['month'] = df1['month'].str.slice(stop=3)
```

Examine the first five rows of your dataframe.


```python
df1.head(5)
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
      <th>mean_duration</th>
      <th>mean_distance</th>
      <th>predicted_fare</th>
      <th>tip_percent</th>
      <th>generous</th>
      <th>day</th>
      <th>am_rush</th>
      <th>daytime</th>
      <th>pm_rush</th>
      <th>nighttime</th>
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
      <td>1</td>
      <td>13.0</td>
      <td>0.0</td>
      <td>0.5</td>
      <td>2.76</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>16.56</td>
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.434692</td>
      <td>0.200</td>
      <td>1</td>
      <td>saturday</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>mar</td>
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
      <td>24.470000</td>
      <td>3.108889</td>
      <td>16.052301</td>
      <td>0.238</td>
      <td>1</td>
      <td>tuesday</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>apr</td>
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
      <td>7.250286</td>
      <td>0.881429</td>
      <td>7.053754</td>
      <td>0.199</td>
      <td>0</td>
      <td>friday</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>dec</td>
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
      <td>30.250000</td>
      <td>3.700000</td>
      <td>18.731923</td>
      <td>0.300</td>
      <td>1</td>
      <td>sunday</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>may</td>
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
      <td>1</td>
      <td>9.0</td>
      <td>0.5</td>
      <td>0.5</td>
      <td>2.06</td>
      <td>0.0</td>
      <td>0.3</td>
      <td>12.36</td>
      <td>11.855484</td>
      <td>2.052258</td>
      <td>10.441380</td>
      <td>0.200</td>
      <td>1</td>
      <td>saturday</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>mar</td>
    </tr>
  </tbody>
</table>
</div>



#### **Drop columns**

Drop redundant and irrelevant columns as well as those that would not be available when the model is deployed. This includes information like payment type, trip distance, tip amount, tip percentage, total amount, toll amount, etc. The target variable (`generous`) must remain in the data because it will get isolated as the `y` data for modeling.


```python
df1 = df1.drop(['Unnamed: 0', 'tpep_pickup_datetime', 'tpep_dropoff_datetime', 'trip_distance',
                'store_and_fwd_flag', 'payment_type', 'fare_amount', 'extra', 'mta_tax', 'tip_amount',
                'tolls_amount', 'improvement_surcharge', 'total_amount', 'tip_percent'], axis=1)
```


```python
df1.head()
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
      <th>RatecodeID</th>
      <th>PULocationID</th>
      <th>DOLocationID</th>
      <th>mean_duration</th>
      <th>mean_distance</th>
      <th>predicted_fare</th>
      <th>generous</th>
      <th>day</th>
      <th>am_rush</th>
      <th>daytime</th>
      <th>pm_rush</th>
      <th>nighttime</th>
      <th>month</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>6</td>
      <td>1</td>
      <td>100</td>
      <td>231</td>
      <td>22.848333</td>
      <td>3.521667</td>
      <td>16.434692</td>
      <td>1</td>
      <td>saturday</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>mar</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>186</td>
      <td>43</td>
      <td>24.470000</td>
      <td>3.108889</td>
      <td>16.052301</td>
      <td>1</td>
      <td>tuesday</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>apr</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>262</td>
      <td>236</td>
      <td>7.250286</td>
      <td>0.881429</td>
      <td>7.053754</td>
      <td>0</td>
      <td>friday</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>dec</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>1</td>
      <td>1</td>
      <td>188</td>
      <td>97</td>
      <td>30.250000</td>
      <td>3.700000</td>
      <td>18.731923</td>
      <td>1</td>
      <td>sunday</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>may</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2</td>
      <td>6</td>
      <td>1</td>
      <td>161</td>
      <td>236</td>
      <td>11.855484</td>
      <td>2.052258</td>
      <td>10.441380</td>
      <td>1</td>
      <td>saturday</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>mar</td>
    </tr>
  </tbody>
</table>
</div>



#### **Variable encoding**

Many of the columns are categorical and will need to be dummied (converted to binary). Some of these columns are numeric, but they actually encode categorical information, such as `RatecodeID` and the pickup and dropoff locations. To make these columns recognizable to the `get_dummies()` function as categorical variables, you'll first need to convert them to `type(str)`. 

1. Define a variable called `cols_to_str`, which is a list of the numeric columns that contain categorical information and must be converted to string: `RatecodeID`, `PULocationID`, `DOLocationID`.
2. Write a for loop that converts each column in `cols_to_str` to string.


```python
cols_to_str = ['VendorID', 'RatecodeID','PULocationID', 'DOLocationID']

for cols in cols_to_str:
    df1[cols] = df1[cols].astype(str)
```

Now convert all the categorical columns to binary.

1. Call `get_dummies()` on the dataframe and assign the results back to a new dataframe called `df2`.


```python
df2 = pd.get_dummies(df1, drop_first=True)
```

##### **Evaluation metric**

Before modeling, you must decide on an evaluation metric. 

1. Examine the class balance of your target variable. 


```python
df2['generous'].value_counts(normalize=True)
```




    generous
    1    0.526368
    0    0.473632
    Name: proportion, dtype: float64



A little over half of the customers in this dataset were "generous" (tipped ≥ 20%). The dataset is very nearly balanced.

To determine a metric, consider the cost of both kinds of model error:
* False positives (the model predicts a tip ≥ 20%, but the customer does not give one)
* False negatives (the model predicts a tip < 20%, but the customer gives more)

False positives are worse for cab drivers, because they would pick up a customer expecting a good tip and then not receive one, frustrating the driver.

False negatives are worse for customers, because a cab driver would likely pick up a different customer who was predicted to tip more&mdash;even when the original customer would have tipped generously.

**The stakes are relatively even. You want to help taxi drivers make more money, but you don't want this to anger customers. Your metric should weigh both precision and recall equally. Which metric is this?**

**Answer**

The evaluation metric that balances precision and recall equally is the f1-score which gives equal importance to both precision and recall.

## **PACE: Construct**

Consider the questions in your PACE Strategy Document to reflect on the Construct stage.

### **Task 3. Modeling**

##### **Split the data**

Now you're ready to model. The only remaining step is to split the data into features/target variable and training/testing data. 

1. Define a variable `y` that isolates the target variable (`generous`).
2. Define a variable `X` that isolates the features.
3. Split the data into training and testing sets. Put 20% of the samples into the test set, stratify the data, and set the random state.


```python
y = df2['generous']

X = df2.copy()
X = X.drop(['generous'], axis=1)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, stratify=y, random_state=42)
```

##### **Random forest**

Begin with using `GridSearchCV` to tune a random forest model.

1. Instantiate the random forest classifier `rf` and set the random state.

2. Create a dictionary `cv_params` of any of the following hyperparameters and their corresponding values to tune. The more you tune, the better your model will fit the data, but the longer it will take. 
 - `max_depth`  
 - `max_features`  
 - `max_samples` 
 - `min_samples_leaf`  
 - `min_samples_split`
 - `n_estimators`  

3. Define a set `scoring` of scoring metrics for GridSearch to capture (precision, recall, F1 score, and accuracy).

4. Instantiate the `GridSearchCV` object `rf1`. Pass to it as arguments:
 - estimator=`rf`
 - param_grid=`cv_params`
 - scoring=`scoring`
 - cv: define the number of you cross-validation folds you want (`cv=_`)
 - refit: indicate which evaluation metric you want to use to select the model (`refit=_`)


**Note:** `refit` should be set to `'f1'`.<font/>
</details>


```python
rf = RandomForestClassifier(random_state=42)

params = {'max_depth': [2, 5, 10, None],
          'max_features': [2, 4, 6],
          'max_samples': [0.25, 0.5, 0.75, 1],
          'min_samples_leaf': [1, 5, 10],
          'min_samples_split': [2, 5, 10, 25],
          'n_estimators': [50, 100, 200]
          }

scoring = ['accuracy', 'precision', 'recall', 'f1']

rf_cv = GridSearchCV(rf, params, scoring=scoring, cv=5, refit='f1')
```

Now fit the model to the training data. 

**Note:** that, depending on how many options you include in your search grid and the number of cross-validation folds you select, this could take a very long time&mdash;even hours. If you use 4-fold validation and include only one possible value for each hyperparameter and grow 300 trees to full depth, it should take about 5 minutes. If you add another value for GridSearch to check for, say, `min_samples_split` (so all hyperparameters now have 1 value except for `min_samples_split`, which has 2 possibilities), it would double the time to ~10 minutes. Each additional parameter would approximately double the time. 


```python
%%time
rf_cv.fit(X_train, y_train)
```

If you want, use `pickle` to save your models and read them back in. This can be particularly helpful when performing a search over many possible hyperparameter values.


```python
path = 'E:/My Portfolio/Cummulative Case Studies/Automatidata/'
```


```python
def write_pickle(path, model_object, save_name:str):
    '''
    save_name is a string.
    '''
    with open(path + save_name + '.pickle', 'wb') as to_write:
        pickle.dump(model_object, to_write)
```


```python
def read_pickle(path, saved_model_name:str):
    '''
    saved_model_name is a string.
    '''
    with open(path + saved_model_name + '.pickle', 'rb') as to_read:
        model = pickle.load(to_read)

        return model
```


```python
write_pickle(path, rf_cv, 'rf_cv')
```


```python
rf_cv = read_pickle(path, 'rf_cv')
```

Examine the best average score across all the validation folds. 


```python
rf_cv.best_score_
```




    np.float64(0.7503107138561352)



Examine the best combination of hyperparameters.


```python
rf_cv.best_params_
```




    {'max_depth': None,
     'max_features': 6,
     'max_samples': 0.25,
     'min_samples_leaf': 10,
     'min_samples_split': 2,
     'n_estimators': 200}



Use the `make_results()` function to output all of the scores of your model. Note that it accepts three arguments. 


```python
def make_results(model_name:str, model_object, metric:str):
    '''
    Arguments:
    model_name (string): what you want the model to be called in the output table
    model_object: a fit GridSearchCV object
    metric (string): precision, recall, f1, or accuracy

    Returns a pandas df with the F1, recall, precision, and accuracy scores
    for the model with the best mean 'metric' score across all validation folds.
    '''

    # Create dictionary that maps input metric to actual metric name in GridSearchCV
    metric_dict = {'precision': 'mean_test_precision',
                 'recall': 'mean_test_recall',
                 'f1': 'mean_test_f1',
                 'accuracy': 'mean_test_accuracy',
                 }

    # Get all the results from the CV and put them in a df
    cv_results = pd.DataFrame(model_object.cv_results_)

    # Isolate the row of the df with the max(metric) score
    best_estimator_results = cv_results.iloc[cv_results[metric_dict[metric]].idxmax(), :]

    # Extract Accuracy, precision, recall, and f1 score from that row
    f1 = best_estimator_results.mean_test_f1
    recall = best_estimator_results.mean_test_recall
    precision = best_estimator_results.mean_test_precision
    accuracy = best_estimator_results.mean_test_accuracy

    # Create table of results
    table = pd.DataFrame({'model': [model_name],
                        'precision': [precision],
                        'recall': [recall],
                        'F1': [f1],
                        'accuracy': [accuracy],
                        },
                       )

    return table
```

Call `make_results()` on the GridSearch object.


```python
results = make_results('rf_cv', rf_cv, 'f1')
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
      <th>model</th>
      <th>precision</th>
      <th>recall</th>
      <th>F1</th>
      <th>accuracy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>rf_cv</td>
      <td>0.687662</td>
      <td>0.825607</td>
      <td>0.750311</td>
      <td>0.710775</td>
    </tr>
  </tbody>
</table>
</div>



This model is a very good classifier across the board. Typically scores of 0.65 or better are considered acceptable, but this is always dependent on our use case.

Use your model to predict on the test data. Assign the results to a variable called `rf_preds`.

For this project, you will use several models to predict on the test data. Remember that this decision comes with a trade-off. What is the benefit of this? What is the drawback?

**Answer**

The advantage of using several models to predict on the test data is that we get to compare the models performance on unseen test data that was not used to train the model. This way, we can see how the model will react to unseen data to see if the model is under or overfitting the training data. Additionally, by doing this we also reduce the risk of selecting a champion model based on the predictive performance on the training data. This does however have some drawbacks, being that once the champion model is selected on the test data, it can't be further tested on unseen data to see its performance. Therefore, you would not have a truly unbiased concept of how the champion model will react on unseen data and so we would not be able to further evaluate the performance of the champion model.


```python
rf_preds = rf_cv.best_estimator_.predict(X_test)
```

Use the below `get_test_scores()` function you will use to output the scores of the model on the test data.


```python
def get_test_scores(model_name:str, preds, y_test_data):
    '''
    Generate a table of test scores.

    In:
    model_name (string): Your choice: how the model will be named in the output table
    preds: numpy array of test predictions
    y_test_data: numpy array of y_test data

    Out:
    table: a pandas df of precision, recall, f1, and accuracy scores for your model
    '''
    accuracy = accuracy_score(y_test_data, preds)
    precision = precision_score(y_test_data, preds)
    recall = recall_score(y_test_data, preds)
    f1 = f1_score(y_test_data, preds)

    table = pd.DataFrame({'model': [model_name],
                        'precision': [precision],
                        'recall': [recall],
                        'F1': [f1],
                        'accuracy': [accuracy]
                        })

    return table
```

1. Use the `get_test_scores()` function to generate the scores on the test data. Assign the results to `rf_test_scores`.
2. Call `rf_test_scores` to output the results.

##### **RF test results**


```python
rf_test_scores = get_test_scores('rf_cv_test', rf_preds, y_test)
results = pd.concat([results, rf_test_scores])
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
      <th>model</th>
      <th>precision</th>
      <th>recall</th>
      <th>F1</th>
      <th>accuracy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>rf_cv</td>
      <td>0.687662</td>
      <td>0.825607</td>
      <td>0.750311</td>
      <td>0.710775</td>
    </tr>
    <tr>
      <th>0</th>
      <td>rf_cv_test</td>
      <td>0.679342</td>
      <td>0.822651</td>
      <td>0.744160</td>
      <td>0.702260</td>
    </tr>
  </tbody>
</table>
</div>



**Question:** How do your test results compare to your validation results?

**Asnwer**

When comparing the model's results from training and on the unseen test set, all of the metrics decreases from the training set by 1%, which is minimal and the model still generalises well.

##### **XGBoost**

 Try to improve your scores using an XGBoost model.

1. Instantiate the XGBoost classifier `xgb` and set `objective='binary:logistic'`. Also set the random state.

2. Create a dictionary `cv_params` of the following hyperparameters and their corresponding values to tune:
 - `max_depth`
 - `min_child_weight`
 - `learning_rate`
 - `n_estimators`

3. Define a set `scoring` of scoring metrics for grid search to capture (precision, recall, F1 score, and accuracy).

4. Instantiate the `GridSearchCV` object `xgb1`. Pass to it as arguments:
 - estimator=`xgb`
 - param_grid=`cv_params`
 - scoring=`scoring`
 - cv: define the number of cross-validation folds you want (`cv=_`)
 - refit: indicate which evaluation metric you want to use to select the model (`refit='f1'`)


```python
xgb = XGBClassifier(objective='binary:logistic', random_state=42)

xgb_params = {'max_depth': [2, 5, 10, None],
              'min_child_weight': [2, 5, 10, 15],
              'learning_rate': [0.1, 0.2, 0.25, 0.5],
              'n_estimators': [50, 100, 150, 200],
              'colsample_bytree': [0.25, 0.5, 0.75],
              }

scoring = ['accuracy', 'precision', 'recall', 'f1']

xgb_cv = GridSearchCV(xgb, xgb_params, scoring=scoring, cv=5, refit='f1')
```

Now fit the model to the `X_train` and `y_train` data.


```python
%%time
xgb_cv.fit(X_train, y_train)
```


```python
write_pickle(path, xgb_cv, 'xgb_cv')
```


```python
xgb_cv = read_pickle(path, 'xgb_cv')
```

Get the best score from this model.


```python
xgb_cv.best_score_
```




    np.float64(0.7481693048283293)



And the best parameters.


```python
xgb_cv.best_params_
```




    {'colsample_bytree': 0.75,
     'learning_rate': 0.1,
     'max_depth': 2,
     'min_child_weight': 5,
     'n_estimators': 100}



##### **XGB CV Results**

Use the `make_results()` function to output all of the scores of your model. Note that it accepts three arguments. 


```python
xgb_cv_results = make_results('xgb_cv', xgb_cv, 'f1')
results = pd.concat([results, xgb_cv_results])
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
      <th>model</th>
      <th>precision</th>
      <th>recall</th>
      <th>F1</th>
      <th>accuracy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>rf_cv</td>
      <td>0.687662</td>
      <td>0.825607</td>
      <td>0.750311</td>
      <td>0.710775</td>
    </tr>
    <tr>
      <th>0</th>
      <td>rf_cv_test</td>
      <td>0.679342</td>
      <td>0.822651</td>
      <td>0.744160</td>
      <td>0.702260</td>
    </tr>
    <tr>
      <th>0</th>
      <td>xgb_cv</td>
      <td>0.694267</td>
      <td>0.811294</td>
      <td>0.748169</td>
      <td>0.712495</td>
    </tr>
  </tbody>
</table>
</div>



Use your model to predict on the test data. Assign the results to a variable called `xgb_preds`.


```python
xgb_preds = xgb_cv.best_estimator_.predict(X_test)
```

##### **XGB test results**

1. Use the `get_test_scores()` function to generate the scores on the test data. Assign the results to `xgb_test_scores`.
2. Call `xgb_test_scores` to output the results.


```python
xgb_test_scores = get_test_scores('xgb_cv_test', xgb_preds, y_test)
results = pd.concat([results, xgb_test_scores])
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
      <th>model</th>
      <th>precision</th>
      <th>recall</th>
      <th>F1</th>
      <th>accuracy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>rf_cv</td>
      <td>0.687662</td>
      <td>0.825607</td>
      <td>0.750311</td>
      <td>0.710775</td>
    </tr>
    <tr>
      <th>0</th>
      <td>rf_cv_test</td>
      <td>0.679342</td>
      <td>0.822651</td>
      <td>0.744160</td>
      <td>0.702260</td>
    </tr>
    <tr>
      <th>0</th>
      <td>xgb_cv</td>
      <td>0.694267</td>
      <td>0.811294</td>
      <td>0.748169</td>
      <td>0.712495</td>
    </tr>
    <tr>
      <th>0</th>
      <td>xgb_cv_test</td>
      <td>0.686975</td>
      <td>0.813939</td>
      <td>0.745087</td>
      <td>0.706846</td>
    </tr>
  </tbody>
</table>
</div>



**Question:** Compare these scores to the random forest test scores. What do you notice? Which model would you choose?

**Answer**

Between the two models performance on the test set their is a 1% difference in all the metrics between them and so both models generalise well to unseen test data. The Precision, F1 and Accuracy are all 1% higher for the XGBoost model compared to the Random Forest model, and the Recall being 1% higher for the Random Forest model compared to the XGBoost model. When it comes to choosing a champion model for the objective of classifying a generous tipper, both of the model's generalise well to unseen test data and have a negligble difference in their evaluation metrics and so must be chosen based on other factos. Therefore, the model that I will choose as my champion model is the Random Forest model and this is because of its predictions can be explained and it doesn't act like a black box model like gradient boosting machines do.

Plot a confusion matrix of the model's predictions on the test data.


```python
cm = confusion_matrix(y_test, rf_preds, labels=rf_cv.classes_)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=rf_cv.classes_)
disp.plot()
plt.title("Random Forest - Test Set")
plt.show()
```


    
<img width="516" height="453" alt="Automatidata_Classifying a Generous Tipper_155_0" src="https://github.com/user-attachments/assets/b5703213-8046-4ec6-8321-e644337a6a5a" />

    


**Question:** What type of errors are more common for your model?

**Answer**

The type of erros that are more common for my model are false positives, this is when the model predicts a tip of 20% or more but the customer does not give one but in return for this the model captures more true positives and negatives.

##### **Feature importance**

Use the `feature_importances_` attribute of the best estimator object to inspect the features of your final model. You can then sort them and plot the most important ones.


```python
importances = rf_cv.best_estimator_.feature_importances_
features = X_test.columns

feat_importance = pd.DataFrame({'Feature': features,
                                'Importance': importances
                                }
                                )
feat_importance = feat_importance.sort_values(by='Importance', ascending=False).head(10)
plt.figure(figsize=(10, 5))
sns.barplot(x='Importance', y='Feature', data=feat_importance)
plt.title("Feature Importance")
plt.xlabel("Mean Decrease in Impurity")
plt.ylabel("Feature")
plt.show()
```


    
<img width="953" height="468" alt="Automatidata_Classifying a Generous Tipper_159_0" src="https://github.com/user-attachments/assets/05c1c6ea-fb5f-468c-88f8-68d6521bec58" />

    


## **PACE: Execute**

Consider the questions in your PACE Strategy Document to reflect on the Execute stage.

### **Task 4. Conclusion**

In this step, use the results of the models above to formulate a conclusion. Consider the following questions:

1. **Would you recommend using this model? Why or why not?**  

2. **What was your model doing? Can you explain how it was making predictions?**   

3. **Are there new features that you can engineer that might improve model performance?**   

4. **What features would you want to have that would likely improve the performance of your model?**   

Remember, sometimes your data simply will not be predictive of your chosen target. This is common. Machine learning is a powerful tool, but it is not magic. If your data does not contain predictive signal, even the most complex algorithm will not be able to deliver consistent and accurate predictions. Do not be afraid to draw this conclusion. Even if you cannot use the model to make strong predictions, was the work done in vain? Consider any insights that you could report back to stakeholders.

**Answer**

1. Yes I would recommend using this model to classify a generous tipper for the NYC TLC as it has a F1 score of 75% on training data and 74% on unseen test data, thereby demonstrating its ability to generalise well on unseen data. This model's other evaluation metrics, such as Precision, Recall and Accuracy are also indicative of a good predictor and so I would recommend this model for NYC TLC's objective.

2. The model is a Random Forest model, which is an ensemble learning method that uses multiple decision trees via bagging for its predictions in order to improve robustness and reduce overfitting. Baggins is bootsrapped aggregation, where the data is sampled with replacement (bootstrapped) for the learners and their predictions are aggregated to make one final robust prediction. When making a prediction for classification objectives, the final prediction of the Random Forest model is the class that was selected by the majority of decision trees in the ensemble.

    From the feature importance of the model we can see that `VendorID_2` was the most influential variables in the models predictions, thereby indicating that the TPEP provider of VeriFone Inc. played a significant role in the tipping behaviour of the customers. This could be an indication of the difference in service or quality associated with the different vendor, and this should be investigated with statistical tests to find out the statistical differences between the vendors. Additionally, the other top features from the feature importance such as `passenger_count`, `mean_duration`, `predicted_fare` and `mean_distance` all indicate that the characteristics of the journey and its fare size influence the models predictions of a customer being classified as a generous tipper.

3. Yes new features can be enginered to improve the models performance by generating more predictive power, some features could be engineered from features interacting with each other to increase the predictive signal of the data. Another set of features that could be engineered are ones that indicate whether the trip's distance was short, medium or far as to present which type of trip journey distance led to the customer being classified as a generous tipper.

4. The features that I would like to have as to improve the performance of the model is data on the past tipping behaviour on each customer, maybe a feature stating the number of tips given, average tip amount given or a binary variable stating whether the tips the customer has given in the past has been equal to or more than 20% per trip. This will help immensely for improving the models predictions and give the data more predictive signal for classifying a generous tipper.

**Congratulations!** You've completed this lab. However, you may not notice a green check mark next to this item on Coursera's platform. Please continue your progress regardless of the check mark. Just click on the "save" icon at the top of this notebook to ensure your work has been logged.

## **Appendix**

### **Model's Predictive Performance**


```python
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
      <th>model</th>
      <th>precision</th>
      <th>recall</th>
      <th>F1</th>
      <th>accuracy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>rf_cv</td>
      <td>0.687662</td>
      <td>0.825607</td>
      <td>0.750311</td>
      <td>0.710775</td>
    </tr>
    <tr>
      <th>0</th>
      <td>rf_cv_test</td>
      <td>0.679342</td>
      <td>0.822651</td>
      <td>0.744160</td>
      <td>0.702260</td>
    </tr>
    <tr>
      <th>0</th>
      <td>xgb_cv</td>
      <td>0.694267</td>
      <td>0.811294</td>
      <td>0.748169</td>
      <td>0.712495</td>
    </tr>
    <tr>
      <th>0</th>
      <td>xgb_cv_test</td>
      <td>0.686975</td>
      <td>0.813939</td>
      <td>0.745087</td>
      <td>0.706846</td>
    </tr>
  </tbody>
</table>
</div>




```python
results.to_csv('Models_Predictive_Performance.csv', index=False)
```

### **Model's Predictions**


```python
preds = X_test[['VendorID_2', 'passenger_count', 'mean_duration', 'predicted_fare', 'mean_distance']].copy()
preds['generous'] = rf_preds
preds.head()
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
      <th>VendorID_2</th>
      <th>passenger_count</th>
      <th>mean_duration</th>
      <th>predicted_fare</th>
      <th>mean_distance</th>
      <th>generous</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>6331</th>
      <td>True</td>
      <td>1</td>
      <td>8.544400</td>
      <td>7.626360</td>
      <td>1.163600</td>
      <td>1</td>
    </tr>
    <tr>
      <th>7244</th>
      <td>False</td>
      <td>1</td>
      <td>15.618195</td>
      <td>13.752420</td>
      <td>3.191516</td>
      <td>0</td>
    </tr>
    <tr>
      <th>16119</th>
      <td>False</td>
      <td>1</td>
      <td>9.001667</td>
      <td>7.828887</td>
      <td>1.025476</td>
      <td>0</td>
    </tr>
    <tr>
      <th>9202</th>
      <td>False</td>
      <td>1</td>
      <td>8.757000</td>
      <td>7.800785</td>
      <td>1.166500</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2909</th>
      <td>False</td>
      <td>1</td>
      <td>10.688333</td>
      <td>7.727461</td>
      <td>0.860278</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
preds.to_csv('Model_Predictions.csv', index=False)
```

### **MLR Prediction Data**


```python
nyc_preds_mlr.to_csv('NYC_Preds_MLR.csv', index=False)
```
