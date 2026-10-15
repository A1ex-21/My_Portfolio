# US-Iran Conflict: An Econometric Analysis

By Alexander Thompson, BSc (Hons)

September 2026

## Table of Contents
- [US-Iran Conflict: An Econometric Analysis](#us-iran-conflict-an-econometric-analysis)
  - [Table of Contents](#table-of-contents)
  - [About the Author](#about-the-author)
  - [Executive Summary](#executive-summary)
  - [Introduction](#introduction)
  - [Data Dictionary](#data-dictionary)
  - [Data Engineering](#data-engineering)
    - [Extraction](#extraction)
    - [Transformation](#transformation)
      - [Timeline of Events](#timeline-of-events)
    - [Loading](#loading)
  - [Econometric Analysis](#econometric-analysis)
    - [Regression of Brent Return](#regression-of-brent-return)
      - [Interpretation of the Coefficient Estimates of the Regression](#interpretation-of-the-coefficient-estimates-of-the-regression)
      - [Hypothesis Tests for individual significance](#hypothesis-tests-for-individual-significance)
        - [Escalation Two-tailed T-test](#escalation-two-tailed-t-test)
        - [Supply\_Disruption Two-tailed T-test](#supply_disruption-two-tailed-t-test)
        - [Deescalation Two-tailed T-test](#deescalation-two-tailed-t-test)
    - [Goodness-of-fit](#goodness-of-fit)
    - [White Test for Heteroscedasticity](#white-test-for-heteroscedasticity)
    - [Breusch-Godfrey LM Test for AR(2) Correlation in the Residuals](#breusch-godfrey-lm-test-for-ar2-correlation-in-the-residuals)
    - [Durbin-Watson Test for Autocorrelation](#durbin-watson-test-for-autocorrelation)
    - [Jarque-Bera Test for Normality in the Residuals](#jarque-bera-test-for-normality-in-the-residuals)
    - [Tests for Multicollinearity](#tests-for-multicollinearity)
      - [Variance Inflation Factor](#variance-inflation-factor)
      - [Wald test of S\&P 500 and VIX](#wald-test-of-sp-500-and-vix)
    - [Chow Test for a Structural Break](#chow-test-for-a-structural-break)
    - [Significance of the conflict on Brent oil returns](#significance-of-the-conflict-on-brent-oil-returns)
    - [Effect of the US Dollar between pre-conflict and conflict periods](#effect-of-the-us-dollar-between-pre-conflict-and-conflict-periods)
    - [Ramsey RESET Test for Misspecification](#ramsey-reset-test-for-misspecification)
    - [Final Model Diagnostics](#final-model-diagnostics)
    - [Overall Conclusion](#overall-conclusion)
    - [Policy and Government Use](#policy-and-government-use)
    - [Recommendations](#recommendations)
    - [Practical Implications](#practical-implications)
  - [References](#references)
  - [Appendix](#appendix)

<div style="page-break-after: always;"></div>

## About the Author

**Alexander Thompson, BSc (Hons)** *is a data scientist and economics graduate specialising in financial markets, geopolitical risk analysis and time-series modelling. Combining a strong foundation in economic theory with advanced technical expertise in Python, machine learning and big data engineering, this project demonstrates a rigorous quantitative workflow, from live API data extraction to robust regression diagnostics and econometric modelling to evaluate complex economic shocks.*

* **Connect:** 
  * [LinkedIn](www.linkedin.com/in/alexander-thompson-25336b231)
  * [My Portfolio](https://github.com/A1ex-21/My_Portfolio)

## Executive Summary

The purpose of this analysis is to deliver a rigorous econometric investigation into the pricing dynamics and volatile behaviour of Brent crude oil returns under exogenous geopolitical shocks, specifically focusing on the US-Iran conflict. Automated Python-based data pipelines were combined with time series econometric modelling to deliver robust policy insights. The empirical results indicate that exogenous geopolitical shocks associated with the US-Iran conflict exert a measurable influence on Brent crude oil returns. Military escalation events are associated with statistically significant increases in Brent returns, while the estimated effects of supply disruptions and de-escalation events are not statistically significant. Notably, the relationship between the US Dollar and Brent returns undergoes a significant structural shift during active conflict periods. The interaction term, USD-Conflict reveals that market sensitivity to currency movements significantly intensifies when geopolitical risk is elevated, thereby demonstrating that currency hedging dynamics shift during wartime shocks. Risk managers and energy traders should abandon static currency hedges during geopolitical crises, adjusting exposures dynamically as US dollar sensitivity shifts during conflict phases. Furthermore, energy dependent firms should deploy pre-emptive hedging strategies rather than reacting to supply disruption shocks after they materialise.

* **Econometric & Diagnostic Rigor:** Models were formally validated to ensure unbiased inference, incorporating rigorous diagnostic checks including White's test for heteroscedasticity, Breusch-Godfrey and Durbin-Watson tests for high order serial correlation and residual normality testing. 
* **Structural Break & Dummy Modelling:** Utilised complex binary indicator modelling to isolate the distinct market impacts of military escalations, supply disruptions and de-escalation announcements in the Middle East.

## Introduction

The US-Iran conflict has had an immense impact on both geopolitics and the global economy through the military action in the Middle East and the following disruption of traffic via the Strait of Hormuz. This in turn has led to the crude oil markets and subsequent energy markets to experience substantial price volatility. The U.S. Energy Information Administration, the principal agency responsible for collecting, analysing and disseminating energy information, reported that Brent crude oil prices had risen sharply during the first quarter of 2026. This represented an increase from approximately \$61 per barrel to \$118 per barrel, the biggest increase on inflation-adjusted data going back to 1988. [(*Troderman and Keyserling, 2026*)](https://www.eia.gov/todayinenergy/detail.php?id=67424)

Crude oil is one of the most important commodities in the global economy today, with its price being highly sensitive to changes in its expected supply, demand and geopolitical risk. In major oil producing regions, such as the Middle East, both political and military instability have an immediate effect on the global oil and energy markets, particularly when these events threaten the production capacity or transportation routes of crude oil. The EIA, also reported that the price of crude oil increased more rapidly after the majority of the shipping traffic halted passing the Strait of Hormuz due to the risk of damage from Iranian attacks by the IRGC to tankers passing through the strait. [(*Troderman and Keyserling, 2026*)](https://www.eia.gov/todayinenergy/detail.php?id=67424). Due to this disruption, major oil producing countries such as Saudi Arabia, shut its oil production.

This analysis will be investigating whether the different types of developments during the conflict were statistically significantly associated with the daily Brent crude oil returns. Instead of treating all of the developments as equivalent to each other, they are divided into 3 categories, escalation, oil supply disruption and de-escalation. This allows us to observe whether the oil markets responded differently to any military escalation, events disrupting the supply of oil and its subsequent transportation and any events that reduced geopolitical uncertainty and supply risk.

For the analysis, a multiple linear regression model will be used for which the daily return on Brent crude oil is the dependent variable. The explanatory variables are three dummy variables representing the different types of developments during the conflict, daily change of USD, S&P 500, VIX and the previous day's Brent return. These are included as control variables to take into account for the broader financial-market movements and short-term persistence in oil returns.

**Objective:** To determine whether the coefficients on the development dummy variables is statistically significant to the daily returns of Brent crude oil.

Particular attention will be focused on whether these events that involve the direct threats to oil supply and its transportation are associated with greater changes in the Brent crude oil returns rather than other forms of escalation. These results will thereby be interpreted as statistical associations rather than just definitive causal effects due to the nature of oil prices to respond to other economic, financial and geopolitical developments that are not fully captured by the model.

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 \text{Escalation}_t + \beta_2 \text{SupplyDisruption}_t + \beta_3 \text{Deescalation}_t + \beta_4 r_{t}^{\text{USD}} + \beta_5 r_{t}^{\text{SP500}} + \beta_6 \Delta \text{VIX}_t + \beta_7 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$

<div style="page-break-after: always;"></div>

## Data Dictionary

| Variable | Type | Description | Construction / Measurement | Source |
|---|---|---|---|---|
| `date` | Date | Trading date for each observation. | Daily date index used to merge the market and event datasets. | FRED / EIA / manually compiled event chronology |
| `brent_price` | Continuous | Daily Brent crude oil spot price. | U.S. dollars per barrel. | EIA / FRED series `DCOILBRENTEU` |
| `brent_return` | Continuous | Daily percentage return on Brent crude oil. This is the dependent variable in the regression model. | `100 × [ln(brent_price_t) - ln(brent_price_t-1)]` | Constructed from `brent_price` |
| `escalation` | Dummy / Binary | Indicates whether a major U.S.–Iran conflict escalation event occurred on a given trading day. | `1` = escalation event; `0` = no escalation event. | Manually constructed from documented conflict-event dates |
| `supply_disruption` | Dummy / Binary | Indicates whether an event directly threatened or disrupted oil production, exports, shipping, infrastructure, or important transport routes such as the Strait of Hormuz. | `1` = supply-disruption event; `0` = no supply-disruption event. | Manually constructed from documented event dates |
| `deescalation` | Dummy / Binary | Indicates whether a significant de-escalation, diplomatic, ceasefire, or supply-restoration event occurred. | `1` = de-escalation event; `0` = no de-escalation event. | Manually constructed from documented event dates |
| `usd_index` | Continuous | Daily value of the Nominal Broad U.S. Dollar Index. | Index level. | FRED series `DTWEXBGS` |
| `usd_return` | Continuous | Daily percentage return on the U.S. dollar index. | `100 × [ln(usd_index_t) - ln(usd_index_t-1)]` | Constructed from `usd_index` |
| `sp500` | Continuous | Daily closing level of the S&P 500 Index. | Index closing level. | FRED series `SP500` |
| `sp500_return` | Continuous | Daily percentage return on the S&P 500. | `100 × [ln(sp500_t) - ln(sp500_t-1)]` | Constructed from `sp500` |
| `vix` | Continuous | Daily closing level of the CBOE Volatility Index. | VIX index level. | FRED series `VIXCLS` |
| `vix_change` | Continuous | Daily change in the VIX. | `vix_t - vix_t-1` | Constructed from `vix` |
| `brent_return_l1` | Continuous | One-day lag of the Brent crude oil return. Used to control for short-term persistence or reversal in oil-price movements. | `brent_return.shift(1)` | Constructed from `brent_return` |

## Data Engineering

Let's collect our continuous data from FRED using the FRED API.


```python
import numpy as np
import pandas as pd
import requests
from functools import  reduce
import json
import os
from dotenv import load_dotenv
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
import statsmodels.formula.api as smf
import statsmodels.api as sm
from statsmodels.stats.diagnostic import het_white, acorr_breusch_godfrey, linear_reset
from statsmodels.stats.stattools import durbin_watson, jarque_bera
from statsmodels.stats.outliers_influence import variance_inflation_factor
```
<div style="page-break-after: always;"></div>

### Extraction


```python
load_dotenv()

api_key = os.getenv("FRED_API_KEY")

def get_series(series_id, col_name):
    start = '2025-01-01'
    end = '2026-09-15'
    url = 'https://api.stlouisfed.org/fred/series/observations'
    params = {'series_id': series_id,
              'api_key': api_key,
              'file_type': 'json',
              'observation_start': start,
              'observation_end': end,
              'frequency': 'd'}
    r = requests.get(url, params=params)
    data = r.json()
    df = pd.DataFrame(data['observations'])
    df = df[['date', 'value']]
    df['date'] = pd.to_datetime(df['date'])
    df['value'] = pd.to_numeric(df['value'], errors='coerce')
    df = df.rename(columns={'value': col_name})
    return df
```


```python
brent = get_series('DCOILBRENTEU', 'brent_price')
usd = get_series('DTWEXBGS', 'usd_index')
sp500 = get_series('SP500', 'sp500')
vix = get_series('VIXCLS', 'vix')
```

### Transformation

Now we must transform our data so it is ready for analysis, we will start by collating all the dataframes together into one coherent dataframe.


```python
dfs = [brent, usd, sp500, vix]
df = reduce(lambda left, right: pd.merge(left, right, on='date', how='inner'), dfs)
```


```python
df.head(5)
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
      <th>date</th>
      <th>brent_price</th>
      <th>usd_index</th>
      <th>sp500</th>
      <th>vix</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-01</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-02</td>
      <td>76.14</td>
      <td>129.4598</td>
      <td>5868.55</td>
      <td>17.93</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-03</td>
      <td>76.72</td>
      <td>129.4535</td>
      <td>5942.47</td>
      <td>16.13</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-06</td>
      <td>77.27</td>
      <td>128.5380</td>
      <td>5975.38</td>
      <td>16.04</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-07</td>
      <td>77.84</td>
      <td>128.6130</td>
      <td>5909.03</td>
      <td>17.82</td>
    </tr>
  </tbody>
</table>
</div>



The reason for the null values in our first row of observations is due to the 1st of January being a public and bank holiday and so no data is collected for that day. Therefore, we can remove the null values in the first row, but before doing so, let's check for any other null values.


```python
df.isna().sum()
```




    date            0
    brent_price    14
    usd_index      18
    sp500          19
    vix             5
    dtype: int64



These null values are appropriate to drop as it is trading day data we are looking at.


```python
df = df.dropna()
```


```python
df.isna().sum()
```




    date           0
    brent_price    0
    usd_index      0
    sp500          0
    vix            0
    dtype: int64




```python
df.sort_values('date', ascending=True, inplace=True)
df.reset_index(drop=True, inplace=True)
```


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 417 entries, 0 to 416
    Data columns (total 5 columns):
     #   Column       Non-Null Count  Dtype         
    ---  ------       --------------  -----         
     0   date         417 non-null    datetime64[ns]
     1   brent_price  417 non-null    float64       
     2   usd_index    417 non-null    float64       
     3   sp500        417 non-null    float64       
     4   vix          417 non-null    float64       
    dtypes: datetime64[ns](1), float64(4)
    memory usage: 16.4 KB
    

Now the null values are removed let's create the new variables for the model

**Brent Return**

$$
r_t^{\text{Brent}} = 100 \times [\ln(P_t) - \ln(P_{t-1})]
$$


```python
df['brent_return'] = np.log(df['brent_price']).diff()*100
```

**USD Return**

$$
 r_{t}^{\text{USD}} = 100 \times [\ln(\text{USD}_t) - \ln(\text{USD}_{t-1})]
$$


```python
df['usd_return'] = np.log(df['usd_index']).diff()*100
```

**S&P 500 Return**

$$
 r_{t}^{\text{SP500}} = 100 \times [\ln(\text{SP500}_t) - \ln(\text{SP500}_{t-1})]
$$


```python
df['sp500_return'] = np.log(df['sp500']).diff()*100
```

**VIX Change**

$$
\Delta \text{VIX}_t = \text{VIX}_t - \text{VIX}_{t-1}
$$


```python
df['vix_change'] = df['vix'].diff()
```
<div style="page-break-after: always;"></div>

**Brent Returns Lagged**

$$
r_{t-1}^{\text{Brent}} = 100 \times [\ln(P_{t-1}) - \ln(P_{t-2})]
$$


```python
df['brent_return_l1'] = df['brent_return'].shift(1)
```

**Why use the Log return?**

We use the log return because we want to measure the percentage returns and not the absolute change in their index and price levels. While using simple percentage returns is perfectly reasonable and statistically defensible for this task, log returns are the better choice to do this for a variety of reasons.

To begin with, log returns scale independently and so when there are price movements in Brent crude oil, the log returns put those movements into a comparable scale. This also helps with the fact that there are different units for the variables and so making all of these into log returns makes their movements more comparable.

Log returns have time additivity, where they are additive across time periods in order to get the log return over a longer time period. In contrast, simple returns do not have this property and to calculate over a period of time you have to compound them multiplicatively.

In addition to this, log returns also possess better statistical properties such as normality. With log returns ranging from minus infinity to plus infinity, this therefore makes the distribution much more symmetric and closer to a normal distribution.

Finally, when you take the first difference of natural logs, it scales down any large changes and linearises exponential growth trends. This therefore stabilises the variance, which reduces heteroskedasticity and helps to mitigate explosive patterns found in financial time series data like stock indexes and commodity prices.


```python
df.head(5)
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
      <th>date</th>
      <th>brent_price</th>
      <th>usd_index</th>
      <th>sp500</th>
      <th>vix</th>
      <th>brent_return</th>
      <th>usd_return</th>
      <th>sp500_return</th>
      <th>vix_change</th>
      <th>brent_return_l1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-02</td>
      <td>76.14</td>
      <td>129.4598</td>
      <td>5868.55</td>
      <td>17.93</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-03</td>
      <td>76.72</td>
      <td>129.4535</td>
      <td>5942.47</td>
      <td>16.13</td>
      <td>0.758868</td>
      <td>-0.004866</td>
      <td>1.251729</td>
      <td>-1.80</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-06</td>
      <td>77.27</td>
      <td>128.5380</td>
      <td>5975.38</td>
      <td>16.04</td>
      <td>0.714335</td>
      <td>-0.709716</td>
      <td>0.552282</td>
      <td>-0.09</td>
      <td>0.758868</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-07</td>
      <td>77.84</td>
      <td>128.6130</td>
      <td>5909.03</td>
      <td>17.82</td>
      <td>0.734966</td>
      <td>0.058331</td>
      <td>-1.116600</td>
      <td>1.78</td>
      <td>0.714335</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-08</td>
      <td>77.37</td>
      <td>129.0785</td>
      <td>5918.25</td>
      <td>17.70</td>
      <td>-0.605633</td>
      <td>0.361285</td>
      <td>0.155911</td>
      <td>-0.12</td>
      <td>0.734966</td>
    </tr>
  </tbody>
</table>
</div>



Now let's remove these null values


```python
df.dropna(inplace=True)
df.reset_index(drop=True, inplace=True)
```


```python
df.head(5)
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
      <th>date</th>
      <th>brent_price</th>
      <th>usd_index</th>
      <th>sp500</th>
      <th>vix</th>
      <th>brent_return</th>
      <th>usd_return</th>
      <th>sp500_return</th>
      <th>vix_change</th>
      <th>brent_return_l1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-06</td>
      <td>77.27</td>
      <td>128.5380</td>
      <td>5975.38</td>
      <td>16.04</td>
      <td>0.714335</td>
      <td>-0.709716</td>
      <td>0.552282</td>
      <td>-0.09</td>
      <td>0.758868</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-07</td>
      <td>77.84</td>
      <td>128.6130</td>
      <td>5909.03</td>
      <td>17.82</td>
      <td>0.734966</td>
      <td>0.058331</td>
      <td>-1.116600</td>
      <td>1.78</td>
      <td>0.714335</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-08</td>
      <td>77.37</td>
      <td>129.0785</td>
      <td>5918.25</td>
      <td>17.70</td>
      <td>-0.605633</td>
      <td>0.361285</td>
      <td>0.155911</td>
      <td>-0.12</td>
      <td>0.734966</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-10</td>
      <td>79.76</td>
      <td>129.8664</td>
      <td>5827.04</td>
      <td>19.54</td>
      <td>3.042302</td>
      <td>0.608548</td>
      <td>-1.553164</td>
      <td>1.84</td>
      <td>-0.605633</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-13</td>
      <td>82.69</td>
      <td>130.0413</td>
      <td>5836.22</td>
      <td>19.19</td>
      <td>3.607655</td>
      <td>0.134586</td>
      <td>0.157417</td>
      <td>-0.35</td>
      <td>3.042302</td>
    </tr>
  </tbody>
</table>
</div>



Now let's create the dummy variables

#### Timeline of Events

First we need to establish a timeline of events, in order to create the dummy variables.

By doing some research we know that the conflict started on `28th February 2026`, with the United States's Operation Epic Fury. This date was on a Saturday, and so we are going set a precedent that any events happening on non-trading days will be assigned to the nearest trading day.

Here is the timeline of events

| Event Date | Assigned Trading Date | Event |
|---|---|---|
| **28 February 2026** | **2 March 2026** | Initial conflict date. |
| **2 March 2026** | **2 March 2026** | Hezbollah in Lebanon enters the war by firing rockets at Israel. Israel retaliates and invades and occupies southern Lebanon. |
| **8 March 2026** | **9 March 2026** | Iran names Mojtaba Khamenei, the son of Ali Khamenei, as the new Supreme Leader of Iran. |
| **7 April 2026** | **7 April 2026** | A two-week ceasefire begins alongside initial negotiations. |
| **13 April 2026** | **13 April 2026** | President Trump begins a blockade of Iranian ports. |
| **21 April 2026** | **21 April 2026** | President Trump announces that the ceasefire will be extended indefinitely. |
| **3 May 2026** | **4 May 2026** | President Trump announces **Project Freedom**, intended to guide ships through the Strait of Hormuz. The operation is paused on 5 May following developments with Saudi Arabia. |
| **5 May 2026** | **5 May 2026** | Iran launches attacks against regional states and commercial shipping, while the United States conducts strikes against Iranian targets. |
| **7 June 2026** | **8 June 2026** | Iran fires at Israel for the first time since the ceasefire, Israel retaliates. |
| **14 June 2026** | **15 June 2026** | President Trump announces that an interim agreement has been reached with Iran and is expected to be signed within days. |
| **17 June 2026** | **17 June 2026** | President Trump and Iranian President Masoud Pezeshkian sign the Memorandum of Understanding (MoU). |
| **18 June 2026** | **18 June 2026** | The United States ends its naval blockade. |
| **21 June 2026** | **22 June 2026** | The United States issues **General Licence X**, authorising transactions related to Iranian crude oil and petroleum products. |
| **26 June 2026** | **26 June 2026** | Iran begins attacking commercial vessels. The United States launches its first post-MoU strikes against Iran. |
| **7 July 2026** | **7 July 2026** | Iran is accused of striking three ships in the Strait of Hormuz. The United States launches airstrikes on Iran and reinstates sanctions on Iranian oil sales, rescinding the General Licence X. |
| **8 July 2026** | **8 July 2026** | President Trump declares that the MoU is over. |
| **12 July 2026** | **13 July 2026** | The U.S. military states that it has struck more than 140 targets in Iran following an Iranian strike on a container ship in the Strait of Hormuz. Tehran states that the Strait is closed until calm is restored, while the United States states that it remains open. |
| **14 July 2026** | **14 July 2026** | The United States reinstates the naval blockade. |
| **17 July 2026** | **17 July 2026** | US hit Iranian surveillance sites, military logistic infrastructure underground weapon storages and maritime capabilities. |
| **18 July 2026** | **20 July 2026** | Iran attacked US allied Gulf states and Jordan after another night of US strikes, with a Kuwait oil facility being hit. |
| **19 July 2026** | **20 July 2026** | US launched strikes after an Iranian attack killed two military personnel and two tankers in the strait were reported as exploded/immobilised.
| **20 July 2026** | **20 July 2026** | Houthis announced a naval blockade against Saudi Arabia, threatening a major oil exportation route, while the US continued strikes on Iran's maritime capabilities. |
| **21 July 2026** | **21 July 2026** | Three oil tankers carrying Saudi Oil reversed course after the Houthi's warning, while the US continued with strikes against Iran. |
| **22 July 2026** | **22 July 2026** | Trump announced that the US would strike Iranian infrastructure in response to attacks on vessels, further strikes continued. |
| **23 July 2026** | **23 July 2026** | US strikes Iranian military command centres, drone storage facilities, communication networks, coastal surveillance sites and maritime capabilities. |
| **1 August 2026** | **3 August 2026** | President Trump announces that he has cancelled a planned attack because the parameters of a potential agreement have been reached. Iran denies this several days later. |
| **17 August 2026** | **17 August 2026** | The 60-day timeline established under the MoU for reaching a final agreement expires. |
| **19 August 2026** | **19 August 2026** | President Trump announces **Economic D-Day** against Iran. |
| **24 August 2026** | **24 August 2026** | Treasury Secretary Scott Bessent announces **Operation Economic Outcast**, including additional sanctions, sectoral designations, suspension of general licences and other restrictions. |
| **1 September 2026** | **1 September 2026** | The United States and Iran exchange attacks again at levels approaching those seen in mid-July. |
| **22 September 2026** | **22 September 2026** | President Trump threatens to annihilate Iran at the UN General Assembly and discusses the decision between further military strikes and pursuing a peace agreement. |
| **23 September 2026** | **23 September 2026** | Iranian President Masoud Pezeshkian states at the UN General Assembly that Iran is ready for dialogue and diplomacy without accepting the language of force.|

[(*Abdallah and Azhari, 2026*)](https://www.investing.com/news/commodities-news/yemens-houthis-declare-naval-blockade-against-saudi-arabia--statement-4800903)
[(*Alashray and Martina, 2026*)](https://theprint.in/world/us-renews-strikes-on-iran-after-two-military-personnel-were-killed-by-iranian-attack/2990290/)
[(*Amiri 2026*)](https://apnews.com/article/iran-pezeshkian-united-nations-general-assembly-trump-war-210d432587bb8dc2d7303ca4c8ea67b6)
[(*Anna, 2026*)](https://apnews.com/article/iran-us-timeline-trump-hormuz-war-ceasefire-04da58cbae991183f8b52ef5bf615963)
[(*Blanchard et al., 2026*)](https://www.congress.gov/crs-product/R48887)
[(*Choukeir and Abouhassira, 2026*)](https://theprint.in/world/iran-hits-gulf-states-and-jordan-after-seventh-night-of-us-strikes/2990111/)
[(*Choukeir, Elwelly and Martina, 2026*)](https://theprint.in/world/more-red-sea-shipments-disrupted-as-rubio-says-iran-not-serious-about-talks/2993499/)
[(*Reuters, 2026*)](https://www.reuters.com/world/trump-us-will-attack-iranian-bridge-power-plant-every-ship-targeted-hormuz-2026-07-22/)
[(*Tan and Verma, 2026*)](https://www.reuters.com/world/middle-east/two-tankers-carrying-saudi-crude-make-u-turns-red-sea-after-houthi-warning-2026-07-21/)
[(*The Times of Israel, 2026*)](https://www.timesofisrael.com/liveblog_entry/iran-guards-says-ships-transiting-hormuz-with-us-backing-involved-in-accident/)
[(*U.S. Central Command, 2026*)](https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4549624/centcom-finishes-latest-wave-of-strikes-against-iran/)
[(*U.S. Central Command, 2026*)](https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4550818/us-finishes-latest-strikes-against-iran/)
[(*U.S. Central Command, 2026*)](https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4552008/us-forces-complete-11th-night-of-strikes-against-iran/)
[(*U.S. Central Command, 2026*)](https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4554671/us-concludes-13th-night-of-strikes-on-iranian-military-targets/)
[(*Schifrin and Barnhart, 2026*)](https://www.pbs.org/newshour/show/at-un-general-assembly-irans-president-responds-to-trumps-annihilation)

**Escalation**

Now we have the timeline of events that are matched with their assigned trading days, we can create a list of escalation dates for our variable.


```python
escalation_dates = pd.to_datetime(["2026-03-02",
"2026-03-09",
"2026-04-13",
"2026-05-05",
"2026-06-08",
"2026-06-26",
"2026-07-07",
"2026-07-08",
"2026-07-13",
"2026-07-14",
"2026-07-17",
"2026-07-20",
"2026-07-21",
"2026-07-22",
"2026-07-23",
"2026-08-19",
"2026-08-24",
"2026-09-01",
"2026-09-22",])
```


```python
df['escalation'] = df['date'].isin(escalation_dates).astype(int)
```

**De-escalation**


```python
deescalation_dates = pd.to_datetime(["2026-04-07",
"2026-04-21",
"2026-06-15",
"2026-06-17",
"2026-06-18",
"2026-06-22",
"2026-08-03",])
```


```python
df['deescalation'] = df['date'].isin(deescalation_dates).astype(int)
```

**Supply Disruption**


```python
supply_disruption_dates = pd.to_datetime(["2026-05-04",
"2026-05-05",
"2026-06-18",
"2026-06-22",
"2026-06-26",
"2026-07-07",
"2026-07-13",
"2026-07-14",
"2026-07-20",
"2026-07-21",])
```


```python
df['supply_disruption']= df['date'].isin(supply_disruption_dates).astype(int)
```


```python
df1 = df[['date', 'brent_return', 'escalation', 'supply_disruption', 'deescalation', 'usd_return', 'sp500_return', 'vix_change', 'brent_return_l1']]
```


```python
df1 = df1.reset_index(drop=True)
```


```python
df1[['escalation', 'deescalation', 'supply_disruption']].sum()
```




    escalation           18
    deescalation          7
    supply_disruption     9
    dtype: int64




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
      <th>date</th>
      <th>brent_return</th>
      <th>escalation</th>
      <th>supply_disruption</th>
      <th>deescalation</th>
      <th>usd_return</th>
      <th>sp500_return</th>
      <th>vix_change</th>
      <th>brent_return_l1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-06</td>
      <td>0.714335</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>-0.709716</td>
      <td>0.552282</td>
      <td>-0.09</td>
      <td>0.758868</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-07</td>
      <td>0.734966</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.058331</td>
      <td>-1.116600</td>
      <td>1.78</td>
      <td>0.714335</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-08</td>
      <td>-0.605633</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.361285</td>
      <td>0.155911</td>
      <td>-0.12</td>
      <td>0.734966</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-10</td>
      <td>3.042302</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.608548</td>
      <td>-1.553164</td>
      <td>1.84</td>
      <td>-0.605633</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-13</td>
      <td>3.607655</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.134586</td>
      <td>0.157417</td>
      <td>-0.35</td>
      <td>3.042302</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.to_csv("US-Iran Brent Returns.csv", index=False)
```

### Loading


```python
df = pd.read_csv("US-Iran Brent Returns.csv")
```


```python
df['date'] = pd.to_datetime(df['date'])
```
<div style="page-break-after: always;"></div>

## Econometric Analysis

Now we have our data prepared and loaded, we can now begin the econometric analysis.

To begin with, let's first regress Brent Return on all the independent variables.

### Regression of Brent Return

**Functional Form**

$$
R_t = \beta_0 + \beta_1 X_{1t} + \beta_2 X_{2t} + \beta_3 X_{3t} + \beta_4 X_{4t} + \beta_5 X_{5t} + \beta_6 X_{6t} + \beta_7 X_{7t} + \varepsilon_t
$$

**Regression Model**

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 \text{Escalation}_t + \beta_2 \text{SupplyDisruption}_t + \beta_3 \text{Deescalation}_t + \beta_4 r_{t}^{\text{USD}} + \beta_5 r_{t}^{\text{SP500}} + \beta_6 \Delta \text{VIX}_t + \beta_7 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$

**Estimated Model**

$$
\widehat{R}_{t}^{\text{Brent}} = \hat{\beta}_0 + \hat{\beta}_1 \text{Escalation}_t + \hat{\beta}_2 \text{SupplyDisruption}_t + \hat{\beta}_3 \text{Deescalation}_t + \hat{\beta}_4 r_{t}^{\text{USD}} + \hat{\beta}_5 r_{t}^{\text{SP500}} + \hat{\beta}_6 \Delta \text{VIX}_t + \hat{\beta}_7 r_{t-1}^{\text{Brent}} + e_t
$$


```python
model = smf.ols(formula=""" brent_return ~ escalation + supply_disruption + deescalation + usd_return +
                            sp500_return + vix_change + brent_return_l1""", data=df).fit()
```


```python
model.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>brent_return</td>   <th>  R-squared:         </th> <td>   0.095</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.079</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   6.092</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th> <td>8.84e-07</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:40</td>     <th>  Log-Likelihood:    </th> <td> -1054.3</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   2125.</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   407</td>      <th>  BIC:               </th> <td>   2157.</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     7</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>      <td>nonrobust</td>    <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
          <td></td>             <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>         <td>    0.1193</td> <td>    0.159</td> <td>    0.753</td> <td> 0.452</td> <td>   -0.192</td> <td>    0.431</td>
</tr>
<tr>
  <th>escalation</th>        <td>    2.7388</td> <td>    0.908</td> <td>    3.015</td> <td> 0.003</td> <td>    0.953</td> <td>    4.525</td>
</tr>
<tr>
  <th>supply_disruption</th> <td>   -0.9508</td> <td>    1.298</td> <td>   -0.732</td> <td> 0.464</td> <td>   -3.503</td> <td>    1.602</td>
</tr>
<tr>
  <th>deescalation</th>      <td>   -1.2209</td> <td>    1.250</td> <td>   -0.976</td> <td> 0.329</td> <td>   -3.679</td> <td>    1.237</td>
</tr>
<tr>
  <th>usd_return</th>        <td>    2.5099</td> <td>    0.511</td> <td>    4.907</td> <td> 0.000</td> <td>    1.504</td> <td>    3.515</td>
</tr>
<tr>
  <th>sp500_return</th>      <td>   -0.3087</td> <td>    0.322</td> <td>   -0.958</td> <td> 0.339</td> <td>   -0.942</td> <td>    0.325</td>
</tr>
<tr>
  <th>vix_change</th>        <td>   -0.0841</td> <td>    0.166</td> <td>   -0.505</td> <td> 0.614</td> <td>   -0.411</td> <td>    0.243</td>
</tr>
<tr>
  <th>brent_return_l1</th>   <td>    0.0139</td> <td>    0.048</td> <td>    0.288</td> <td> 0.773</td> <td>   -0.081</td> <td>    0.109</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>40.954</td> <th>  Durbin-Watson:     </th> <td>   2.009</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td> 155.936</td>
</tr>
<tr>
  <th>Skew:</th>          <td>-0.328</td> <th>  Prob(JB):          </th> <td>1.38e-34</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.931</td> <th>  Cond. No.          </th> <td>    32.6</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.



**Estimated Equation**

$$
\widehat{R}_{t}^{\text{Brent}} = 0.119 + 2.739 \text{Escalation}_t - 0.951 \text{SupplyDisruption}_t - 1.221 \text{Deescalation}_t + 2.510 r_{t}^{\text{USD}} - 0.309 r_{t}^{\text{SP500}} - 0.084 \Delta \text{VIX}_t + 0.014 r_{t-1}^{\text{Brent}} + e_t
$$

<div style="page-break-after: always;"></div>

#### Interpretation of the Coefficient Estimates of the Regression

$$
Y = \beta X
$$

*Where a one unit change in X will result in a $\beta$ change in Y*

**Intercept**

$$
\hat{\beta}_0 = 0.12
$$

The interpretation of the intercept of the estimated equation is the value of the dependent variable, Brent Return when all of the independent variables are equal to zero. When represented graphically, it is the point at which the regression line intersects with the y-axis. In our case, the estimated intercept from our model can be interpreted as, when all independent variables are equal to zero, the expected daily Brent crude oil return is approximately 0.12%

**Escalation**

$$
\hat{\beta}_1 \text{Escalation}_t
$$

$$
\hat{\beta}_1 = 2.739
$$

When there is an escalation in the conflict, the expected daily return of Brent crude oil will increase by approximately 2.74%.

**Supply Disruption**

$$
\hat{\beta}_2 \text{SupplyDisruption}_t
$$

$$
\hat{\beta}_2 = -0.951
$$

During the conflict, when a disruption is made to the supply of crude oil, the expected daily return of Brent crude oil will decrease by 0.95%.

**Deescalation**

$$
\hat{\beta}_3 \text{Deescalation}_t
$$

$$
\hat{\beta}_3 = -1.221
$$

A de-escalation in the conflict will result in the daily return of Brent crude oil to be decreased by 1.22%.

**USD Return**

$$
\hat{\beta}_4 r_{t}^{\text{USD}}
$$

$$
\hat{\beta}_4 = 2.510
$$

A 1% increase in the daily return of the US dollar will result in a 2.51% increase in the daily return of Brent crude oil.

**SP500 Return**

$$
\hat{\beta}_5 r_{t}^{\text{SP500}}
$$

$$
\hat{\beta}_5 = -0.309
$$

When a 1% increase occurs in the daily return of the S&P 500, this results in a 0.31% decrease in the daily return of Brent crude oil.

**VIX Change**

$$
\hat{\beta}_6 \Delta \text{VIX}_t
$$

$$
\hat{\beta}_6 = -0.084
$$

When a 1% increase occurs in the daily VIX, then this will lead to a 0.08% decrease in the daily return of Brent crude oil.

**Lagged Brent Return**

$$
\hat{\beta}_7 r_{t-1}^{\text{Brent}}
$$

$$
\hat{\beta}_7 = 0.014
$$

A 1% point increase in the Brent crude oil's return from the previous trading day is associated with a 0.01% point increase in today's Brent crude oil return.

Let's investigate further.

***From the regression results, would you say that the variables escalation, supply_disruption and deescalation are individually relevant in explaining daily Brent crude oil returns?***

To answer this question, we will conduct the appropriate statistical tests, specifying all the steps involved and interpreting the test results.

<div style="page-break-after: always;"></div>

#### Hypothesis Tests for individual significance

When investigating the individual significance of an independent variable it is appropriate to conduct a t-test. This t-test will be two-tailed as we are stating that escalation does not equal to 0 in our alternative hypothesis.

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**T-Critical Approach**

If t* doesn't fall into Acceptance Region ($t_{critical}$) $\rightarrow$ Reject $H_0$

If t* falls into Acceptance Region ($t_{critical}$) $\rightarrow$ Fail to Reject $H_0$

##### Escalation Two-tailed T-test

To begin with let's state our hypothesis

$$
H_0: \beta_1 = 0
$$

$$
H_1: \beta_1 ≠ 0
$$

*The null hypothesis states that escalation is not statistically significant from 0 and is therefore not individually relevant in explaining daily Brent crude oil returns.*

**Significance Level ($\alpha$)** = 5% (0.05)

Here we will do both the P-Value approach and the T-Critical Approach.

$$
p = 0.003
$$

$$
t^* = \frac{\hat{\beta}_1 - \beta_{1}} {SE(\hat{\beta}_1)} = \frac{2.7388}{0.908} = 3.015
$$

We have our values from our regression, now let's find the t-critical

$$
\frac{\alpha}{2} = 0.025
$$

$$
\pm t_{0.025, df}
$$

$$
df = 407
$$

$$
t_{critical} = \pm t_{0.025, df} = \pm t_{0.025, 407} = \pm 1.960
$$

*Critical Values are taken from the statistical tables reproduced in the Appendix.*

*Source: Statistical Tables, Appendix D, Table D.2*

*Since the degrees of freedom are 407 which is not listed in the statistical table, the $df = \infty$ row is used as a large sample approximation.*

$$
t^* < -1.960
\quad \text{or} \quad
t^* > 1.960
$$

**Conclusion**

For the variable escalation, the P-Value is 0.003 and the t-statistic being 3.015, thereby we can reject the null hypothesis at the 5% significance level. In doing so, we conclude that there is evidence that **escalation is statistically significant** and is individually relevant in explaining the daily Brent crude oil returns.

##### Supply_Disruption Two-tailed T-test

**Hypothesis**

$$
H_0: \beta_2 = 0
$$

$$
H_1: \beta_2 ≠ 0
$$

**Values**

$$
p = 0.464
$$

$$
t^* = \frac{\hat{\beta}_2 - \beta_{2}} {SE(\hat{\beta}_2)} = \frac{-0.9508}{1.298} = -0.732
$$

$$
t_{critical} = \pm 1.960
$$

$$
\alpha = 0.05
$$

<div style="page-break-after: always;"></div>

**Conclusion**

For the variable supply_disruption, the P-Value is 0.464 which is greater than 0.05 and the t-statistic is -0.732 which falls into the t-critical region. Therefore, we fail to reject the null hypothesis at the 5% significance level and there is insufficient statistical evidence to imply that supply_disruption is individually relevant in explaining daily Brent oil returns.

##### Deescalation Two-tailed T-test

**Hypothesis**

$$
H_0: \beta_3 = 0
$$

$$
H_1: \beta_3 ≠ 0
$$

**Values**

$$
p = 0.329
$$

$$
t^* = \frac{\hat{\beta}_3 - \beta_{3}} {SE(\hat{\beta}_3)} = \frac{-1.2209}{1.250} = -0.976
$$

$$
t_{critical} = \pm 1.960
$$

$$
\alpha = 0.05
$$

**Conclusion**

For the variable deescalation, the associated P-Value is 0.329 and the t-statistic is -0.976. Knowing the decision rule, the P-Value is greater than 0.05 and the t-statistic falls into the t-critical acceptance region and so we fail to reject the null hypothesis at the 5% significance level. In doing so we observe that there is no statistically significant evidence to imply that deescalation is individually relevant in explaining the daily Brent oil returns.

***What is the Goodness-of-fit of the Model? What other factors could explain daily Brent returns?***

### Goodness-of-fit

When commenting on the Goodness-of-fit of the Model, we need to look at the $R^2$ from the regression summary. The Goodness-of-fit measures how well the independent variables explain the dependent variable. The value of $R^2$ is between 0 and 1, with 1 being the best possible fit.


```python
print(f"R-Squared: {model.rsquared:.4f}")
```

    R-Squared: 0.0948
    

The model has an $R^2$ of 0.0948, which indicates that approximately 9.48% of the variation in daily Brent crude oil returns is explained by escalation, supply disruption, de-escalation, US Dollar returns, S&P 500 returns, changes in the VIX and lagged Brent returns. An $R^2$ of 9.48% may seem to be low, but for daily financial returns it is not automatically a problem, this is due daily returns being noisy and are affected by many unpredictable factors and so low $R^2$ values are common.

The remaining variation in the model may reflect on additional factors that are not captured by the model such as the oil market volatility which would be captured by the CBOE Crude Oil ETF Volatility Index or OVX. This would capture the oil-specific uncertainty rather than the broad equity market uncertainty that is currently captured by the VIX. Another additional factor could be the OPEC or OPEC+ announcements and production decisions with the changes in production quotas, voluntary cuts or signals about future output can move Brent sharply. Other factors that could explain the variation in daily Brent oil returns are production decisions, crude oil inventory surprises, changes in global oil demand expectations and supply disruptions that are occurring outside the US-Iran conflict. The daily returns are also inherently volatile and can respond quickly to unexpected market information, which may help to explain the low $R^2$ score.

***Using the residuals from the estimated Brent crude oil returns regression, let's test whether the model suffers from heteroscedasticity using the White test.***

### White Test for Heteroscedasticity

**Auxiliary Regression**

When testing for heteroscedasticity, the objective is to observe if the residuals in the model have constant variance or whether the variance is changing and so to do this we are going to use the auxiliary regression. For the approximation of the variance, we will use the square variance as a proxy and so the independent variables is the square value for the residuals. This proxy for the variance will be used on the constant and then include all the independent variables, then all squared variables and then cross terms.

<div style="page-break-after: always;"></div>

$$
\begin{aligned}
\hat{\varepsilon}_t^2
={}&
\alpha_0
+\alpha_1 Escalation_t
+\alpha_2 SupplyDisruption_t
+\alpha_3 Deescalation_t
+\alpha_4 r_t^{USD}
+\alpha_5 r_t^{SP500}
+\alpha_6 \Delta VIX_t
+\alpha_7 r_{t-1}^{Brent}
\\[4pt]
&+\alpha_8 Escalation_t^2
+\alpha_9 SupplyDisruption_t^2
+\alpha_{10} Deescalation_t^2
+\alpha_{11}(r_t^{USD})^2
+\alpha_{12}(r_t^{SP500})^2
+\alpha_{13}(\Delta VIX_t)^2
+\alpha_{14}(r_{t-1}^{Brent})^2
\\[4pt]
&+\alpha_{15}(Escalation_t \times SupplyDisruption_t)
+\alpha_{16}(Escalation_t \times Deescalation_t)
+\alpha_{17}(Escalation_t \times r_t^{USD})
\\
&+\alpha_{18}(Escalation_t \times r_t^{SP500})
+\alpha_{19}(Escalation_t \times \Delta VIX_t)
+\alpha_{20}(Escalation_t \times r_{t-1}^{Brent})
\\
&+\alpha_{21}(SupplyDisruption_t \times Deescalation_t)
+\alpha_{22}(SupplyDisruption_t \times r_t^{USD})
\\
&+\alpha_{23}(SupplyDisruption_t \times r_t^{SP500})
+\alpha_{24}(SupplyDisruption_t \times \Delta VIX_t)
\\
&+\alpha_{25}(SupplyDisruption_t \times r_{t-1}^{Brent})
+\alpha_{26}(Deescalation_t \times r_t^{USD})
\\
&+\alpha_{27}(Deescalation_t \times r_t^{SP500})
+\alpha_{28}(Deescalation_t \times \Delta VIX_t)
\\
&+\alpha_{29}(Deescalation_t \times r_{t-1}^{Brent})
+\alpha_{30}(R_t^{USD} \times r_t^{SP500})
\\
&+\alpha_{31}(R_t^{USD} \times \Delta VIX_t)
+\alpha_{32}(R_t^{USD} \times r_{t-1}^{Brent})
\\
&+\alpha_{33}(R_t^{SP500} \times \Delta VIX_t)
+\alpha_{34}(R_t^{SP500} \times r_{t-1}^{Brent})
\\
&+\alpha_{35}(\Delta VIX_t \times r_{t-1}^{Brent})
+v_t
\end{aligned}
$$

**Hypothesis**

$$
H_0: \operatorname{Var}(\varepsilon_t \mid X_t) = \sigma^2
$$

$$
H_1: \operatorname{Var}(\varepsilon_t \mid X_t) \neq \sigma^2
$$

This can be expressed as:

$$
H_0: \alpha_1 = \alpha_2 = \cdots = \alpha_{35} = 0 \quad \rightarrow \quad \text{No heteroscedasticity}
$$

$$
H_1: H_0 \text{ is false} \quad \rightarrow \quad \text{Heteroscedasticity}
$$

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**$\chi^2_{critical}$ Approach**

If the Lagrange Multiplier Test Statistic > $\chi^2_{critical} \rightarrow$ Reject $H_0$

If the Lagrange Multiplier Test Statistic ≤ $\chi^2_{critical} \rightarrow$ Fail to Reject $H_0$


```python
white_test = het_white(model.resid, model.model.exog)

white_results = {"LM Statistic": white_test[0],
                 "LM P-value": white_test[1],
                 "F Statistic": white_test[2],
                 "F P-Value": white_test[3]}

white_results
```




    {'LM Statistic': np.float64(85.59937001427298),
     'LM P-value': np.float64(3.0026790939947224e-07),
     'F Statistic': np.float64(3.3262593827770464),
     'F P-Value': np.float64(3.4269004637829926e-08)}



**Test Statistic and Distribution**

$$
LM = n.R^2_{aux}
$$

$$
LM = nR^2
\overset{H_0}{\sim}
\chi^2_{\alpha,\,k-1}
$$

Where:

- $n$ = Number of Observations  
- $R^2$ = R-Squared of the Auxiliary Regression  
- $\alpha$ = Significance Level of $5\% = 0.05$  
- $k$ = Number of Parameters $= 36$

In the full theoretical auxiliary regression there are 36 parameters, but in actuality there may be less than this due to the inclusion of the event dummy variables. A dummy variable squared is equal to the original dummy variable and so are duplicates of the variables. After removing those redundant variables we will have 33 parameters, but the exact degrees of freedom can be lower if any of the interaction terms are perfectly collinear or always zero. Statsmodels handles this by using the rank of the auxiliary regression matrix, and we can write some code in order to get the exact ranking and degrees of freedom.


```python
x = model.model.exog

i, j = np.triu_indices(x.shape[1])

white_exog = x[:, i] * x[:, j]

rank = np.linalg.matrix_rank(white_exog)

df_white = rank - 1

print("Auxiliary regression rank:", rank)
print("White test degrees of freedom:", df_white)
```
    Auxiliary regression rank: 31
    White test degrees of freedom: 30
    

$$
LM = nR_{\text{aux}}^2
$$

Under the null hypothesis:

$$
LM
\overset{H_0}{\sim}
\chi^2_{\alpha, 30}
$$

Where:

- $n$ = Number of observations
- $R_{\text{aux}}^2$ = R-squared from the White auxiliary regression
- $df = 30$ = Number of independent slope restrictions
- $\alpha = 0.05$

Now we have our exact degrees of freedom, we can use this to obtain the $\chi^2_{critical}$.

*Source: Statistical Tables, Appendix D, Table D.4*

$$
\chi^2_{critical} = \chi^2_{\alpha, 30} = \chi^2_{0.05, 30} = 43.773
$$

$$
LM = 85.599
$$

$$
p = 3.003 \times 10^{-7}
$$

**Conclusion**

For this White test for heteroscedasticity, the Lagrange Multiplier statistic is 85.599 and so is greater than the chi-squared critical of 43.773. Additionally, the Lagrange Multiplier's associated P-Value is smaller than 0.05, and so based on these two statistics, we reject the null hypothesis at the 5% significance level. Therefore, we can conclude that there is statistical evidence of heteroscedasticity in the residuals, meaning that the variance of the error term is not constant across observations.

### Breusch-Godfrey LM Test for AR(2) Correlation in the Residuals

Using the residuals from the estimated Brent crude oil returns, let's investigate whether there is second order serial correlation using the Breusch-Godfrey LM test.

**Auxiliary Regression**

$$
\begin{aligned}
\hat{\varepsilon}_t
={}&
\alpha_0
+\alpha_1 Escalation_t
+\alpha_2 SupplyDisruption_t
+\alpha_3 Deescalation_t
+\alpha_4 r_t^{USD}
+\alpha_5 r_t^{SP500}
\\[4pt]
&+\alpha_6 \Delta VIX_t
+\alpha_7 r_{t-1}^{Brent}
+\rho_1 \hat{\varepsilon}_{t-1}
+\rho_2 \hat{\varepsilon}_{t-2}
+v_t
\end{aligned}
$$

**Hypothesis**

$$
H_0:
\rho_1 = \rho_2 = 0
$$

$$
H_1:
\text{At least one } \rho_j \neq 0
$$

*The null hypothesis means that there is no serial correlation up to order 2 in the residuals.*

*$\rho$ = Number of lags of $\varepsilon_t$ included in the auxiliary regression*

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**$\chi^2_{critical}$ Approach**

If the Lagrange Multiplier Test Statistic > $\chi^2_{critical} \rightarrow$ Reject $H_0$

If the Lagrange Multiplier Test Statistic ≤ $\chi^2_{critical} \rightarrow$ Fail to Reject $H_0$


```python
bg_test = acorr_breusch_godfrey(model, nlags=2)

bg_results = {"LM Statistic": bg_test[0],
              "LM P-Value": bg_test[1],
              "F Statistic": bg_test[2],
              "F P-Value": bg_test[3]}
bg_results
```




    {'LM Statistic': np.float64(0.979336090043102),
     'LM P-Value': np.float64(0.6128297923235395),
     'F Statistic': 0.4789991793183573,
     'F P-Value': 0.6197534433427843}



**Test Statistic and Distribution**

$$
LM = nR^2
\overset{H_0}{\sim}
\chi^2_{\alpha,\rho}
$$

Where:

- $n$ = Number of observations  
- $R^2$ = R-squared of the auxiliary regression  
- $\alpha$ = Significance level, where $\alpha = 0.05$  
- $\rho$ = Number of lags of $\varepsilon_t$ included in the auxiliary regression

With our AR(2) test, this is:

$$
LM = nR^2
\overset{H_0}{\sim}
\chi^2_{0.05,2}
$$

$$
\chi^2_{critical} = \chi^2_{0.05,2} = 5.991
$$

*Source: Statistical Tables, Appendix D, Table D.4*

$$
LM = 0.979
$$

$$
p = 0.613
$$

**Conclusion**

For the Breusch-Godfrey test for serial correlation up to order 2 in the residuals of the model, the Lagrange Multiplier statistic is 0.979 and so is less than the chi-square critical of 5.991, and its associated P-Value of 0.613 being greater than 0.05. Therefore, we can state that we fail to reject the null hypothesis at the 5% significance level and there is insufficient evidence to conclude that the residuals exhibit serial correlation up to order 2. This thereby suggests that the model's residuals are not systematically correlated with their first or second lag.

**Robust Standard Errors**

The White test indicates the presence of heteroscedasticity, while the Breusch-Godfrey LM Test provides no evidence of serial correlation up to order 2. Therefore, HC3 heteroscedasticity-robust standard errors are used for subsequent statistical inferences. This does not alter the OLS coefficient estimates, but adjusts the standard errors, t-statistics, P-Values and confidence intervals for heteroscedasticity.

Let's implement the HC3 robust standard errors and make a robust version of the model.


```python
model_robust = model.get_robustcov_results(cov_type="HC3")
```


```python
model_robust.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>brent_return</td>   <th>  R-squared:         </th> <td>   0.095</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.079</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   3.528</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th>  <td>0.00108</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:41</td>     <th>  Log-Likelihood:    </th> <td> -1054.3</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   2125.</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   407</td>      <th>  BIC:               </th> <td>   2157.</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     7</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>         <td>HC3</td>       <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
          <td></td>             <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>         <td>    0.1193</td> <td>    0.148</td> <td>    0.804</td> <td> 0.422</td> <td>   -0.172</td> <td>    0.411</td>
</tr>
<tr>
  <th>escalation</th>        <td>    2.7388</td> <td>    1.378</td> <td>    1.987</td> <td> 0.048</td> <td>    0.029</td> <td>    5.449</td>
</tr>
<tr>
  <th>supply_disruption</th> <td>   -0.9508</td> <td>    2.062</td> <td>   -0.461</td> <td> 0.645</td> <td>   -5.005</td> <td>    3.103</td>
</tr>
<tr>
  <th>deescalation</th>      <td>   -1.2209</td> <td>    2.475</td> <td>   -0.493</td> <td> 0.622</td> <td>   -6.086</td> <td>    3.644</td>
</tr>
<tr>
  <th>usd_return</th>        <td>    2.5099</td> <td>    0.579</td> <td>    4.333</td> <td> 0.000</td> <td>    1.371</td> <td>    3.649</td>
</tr>
<tr>
  <th>sp500_return</th>      <td>   -0.3087</td> <td>    0.401</td> <td>   -0.770</td> <td> 0.442</td> <td>   -1.097</td> <td>    0.479</td>
</tr>
<tr>
  <th>vix_change</th>        <td>   -0.0841</td> <td>    0.250</td> <td>   -0.337</td> <td> 0.736</td> <td>   -0.575</td> <td>    0.407</td>
</tr>
<tr>
  <th>brent_return_l1</th>   <td>    0.0139</td> <td>    0.068</td> <td>    0.203</td> <td> 0.839</td> <td>   -0.121</td> <td>    0.148</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>40.954</td> <th>  Durbin-Watson:     </th> <td>   2.009</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td> 155.936</td>
</tr>
<tr>
  <th>Skew:</th>          <td>-0.328</td> <th>  Prob(JB):          </th> <td>1.38e-34</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.931</td> <th>  Cond. No.          </th> <td>    32.6</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors are heteroscedasticity robust (HC3)



### Durbin-Watson Test for Autocorrelation

Using the Durbin-Watson statistic, let's test whether there is evidence of first-order autocorrelation in the residuals of the daily Brent crude oil return model. Let's see how this diagnostic compares with the conclusion obtained from the Breusch-Godfrey LM Test.

Here the Durbin-Watson critical value approach is demonstrated for completeness, but due to the regression containing a lagged dependent variable, the conventional Durbin-Watson bounds test is not formally valid.

**Auxiliary Regression**

For AR(1)

$$
\varepsilon_t = \alpha_0 + \rho\varepsilon_{t-1} + v_t
$$

For daily Brent returns

$$
\begin{aligned}
\hat{\varepsilon}_t
={}&
\alpha_0
+\alpha_1 Escalation_t
+\alpha_2 SupplyDisruption_t
+\alpha_3 Deescalation_t
+\alpha_4 r_t^{USD}
+\alpha_5 r_t^{SP500}
\\[4pt]
&+\alpha_6 \Delta VIX_t
+\alpha_7 r_{t-1}^{Brent}
+\rho_1 \hat{\varepsilon}_{t-1}
+v_t
\end{aligned}
$$

**Hypothesis**

$$
H_0: \rho = 0
$$

$$
H_1: \rho ≠ 0
$$

*The null hypothesis means there is no autocorrelation of order 1.*

**Test Statistic and Distribution**

$$
\text{D-W} ≈ 2(1-\rho)
$$

$$
\hat{\rho} = 0 \rightarrow \text{D-W} = 2 \rightarrow (\text{No AR(1)})
$$

$$
\hat{\rho} = 1 \rightarrow \text{D-W} = 0 \rightarrow (+)\text{AR(1)}
$$

$$
\hat{\rho} = -1 \rightarrow \text{D-W} = 4 \rightarrow (-)\text{AR(1)}
$$

**D-W Tables**

| Positive AR(1) | Inconclusive | No AR(1) | Inconclusive | Negative AR(1) |
|---|---|---|---|---|
| $0 < DW < d_L$ | $d_L < DW < d_U$ | $d_U < DW < 4-d_U$ | $4-d_U < DW < 4-d_L$ | $4-d_L < DW < 4$ |


```python
print(f"Durbin-Watson: {durbin_watson(model.resid):.3f}")
```

    Durbin-Watson: 2.009
    

- K = Number of independent variables
- n = Number of observations

$$
k = 7
$$

$$
n = 415
$$

$$
\text{D-W} = 2.009
$$

Durbin-Watson significance points:

$$
d_L: 1.697
$$

$$
d_U: 1.841
$$

*Source: Statistical Tables, Appendix D, Table D.5*

| $+$ | $?$ | No AR(1) | $?$ | $-$ |
|---|---|---|---|---|
| $0$ to $1.697$ | $1.697$ to $1.841$ | $1.841$ to $2.159$ | $2.159$ to $2.303$ | $2.303$ to $4$ |

Here is where the Durbin-Watson statistic is on the decision region.

$$
0
\qquad
1.697\,(d_L)
\qquad
1.841\,(d_U)
\qquad
\underbrace{2.009}_{D-W}
\qquad
2.159\,(4-d_U)
\qquad
2.303\,(4-d_L)
\qquad
4
$$

As you can see it lies in the No AR(1) Region

**Decision Rule**

- If the D-W Statistic is close to 2.0 $\rightarrow$ No AR(1)
- If the D-W Statistic is significantly < 2.0 $\rightarrow$ Positive Autocorrelation
- If the D-W Statistics is significantly > 2.0 $\rightarrow$ Negative Autocorrelation

**Conclusion**

The Durbin-Watson statistic is 2.009 and so is close to 2.0, thereby we fail to reject the null hypothesis and there is no evidence of autocorrelation up to order 1 in the residuals. Although the Durbin-Watson statistic is close to 2.0, the conventional critical-value decision approach is treated as illustrative only due to the model containing a lagged dependent variable. The Breusch-Godfrey LM test provides the valid formal test of serial correlation for this specification.

### Jarque-Bera Test for Normality in the Residuals

Let's use the Jarque-Bera test, to determine whether the residuals from the daily Brent crude oil return model are normally distributed.

**Hypothesis**

$$
H_0: \hat{\varepsilon} \space \text{has a normal distribution}
$$

$$
H_1: \hat{\varepsilon} \space \text{is not normally distributed}
$$

Alternatively, the hypothesis can be stated in terms of Skewness and Kurtosis

$$
H_0:
S = 0
\quad \text{and} \quad
K = 3
$$

$$
H_1:
S \neq 0
\quad \text{or} \quad
K \neq 3
$$


```python
residuals = model.resid
jb_stat, jb_pvalue, skew, kurtosis = jarque_bera(residuals)

plt.figure(figsize=(10,5))

plt.hist(residuals, bins=20, density=True, edgecolor="black")
plt.title("Histogram of Residuals")
plt.xlabel("Residuals")
plt.ylabel("Density")

stats_text = (f"Mean: {residuals.mean():.4f}\n"
              f"Median: {residuals.median():.4f}\n"
              f"Maximum: {residuals.max():.4f}\n"
              f"Minimum: {residuals.min():.4f}\n"
              f"Std. Dev: {residuals.std():.4f}\n"
              f"Skewness: {skew:.3f}\n"
              f"Kurtosis: {kurtosis:.3f}\n"
              f"Jarque-Bera: {jb_stat:.3f}\n"
              f"Probability: {jb_pvalue:.6f}\n")

plt.text(1.02, 0.95, stats_text, transform=plt.gca().transAxes, verticalalignment="top")
plt.tight_layout()
plt.show()
```


    
<img width="989" height="490" alt="Jarque-Bera Residuals" src="https://github.com/user-attachments/assets/f080eb7b-bdb1-4b21-bada-0e3136c6470f" />

    


**Test Statistic and Distribution**

$$
JB = n \left[\frac{S^2}{6} + \frac{(K-3)^2}{24}\right] \overset{H_0}{\sim}\chi^2_{\alpha, \, 2}
$$

Where:

- $n$ = Number of observations
- $S$ = Skewness
- $K$ = Kurtosis

$$
n = 415
$$

$$
S = -0.328
$$

$$
K = 5.931
$$

$$
JB = 415 \left[\frac{-0.328^2}{6} + \frac{(5.931-3)^2}{24}\right] = 155.936
$$

$$
\chi^2_{critical} = \chi^2_{\alpha, 2} = \chi^2_{0.05, 2} = 5.991
$$

$$
p = 0.000
$$

**Decision Rule**

**P-Value Approach**

- If P-Value < $\alpha \rightarrow$ Reject $H_0$
- If P-Value > $\alpha \rightarrow$ Fail to reject $H_0$

**JB Statistic**

- If JB > $\chi^2_{critical} \rightarrow$ Reject $H_0$
- If JB < $\chi^2_{critical} \rightarrow$ Fail to reject $H_0$

**Conclusion**

From the Jarque-Bera test, the Jarque-Bera test statistic is 155.936 and so is greater than our chi-squared critical of 5.991, and its associated P-Value is less than our significance level of 0.05. Therefore, we reject the null hypothesis at the 5% significance level and can infer that the residuals are not normally distributed. The residuals exhibit negative skewness and excess kurtosis, with a kurtosis of 5.931 in comparison with the normally distributed value of 3, thereby suggesting relatively heavy tails.

***What are the implications of the Jarque-Bera test results on the properties of the OLS Estimator?***

The rejection of the normality of the residuals does not by itself imply that the OLS coefficient estimates are biased or inconsistent. Normality of the error term is not required for OLS in order to estimate the regression coefficients consistently, provided that the other key assumptions such as the zero conditional mean assumption in particular are satisfied. However, the normality assumption is important for the exact finite sample statistical inference and so if the residuals do not have normality, then the usual finite sample t-tests and F-tests may not follow their exact theoretical distributions.

Additionally, since the regression also contains a large sample size of 415 observations, asymptotic theory and Central Limit Theorem make inference less dependent on the normality assumption. Nevertheless, the heavy tailed distribution of the residuals may make the conventional inference less reliable, particularly if there are extreme observations present.

The White test that was carried out previously, identified heteroscedasticity and so heteroscedasticity-robust standard errors should be used for the coefficient inference. While the robust standard errors don't make the residuals normally distributed, they do provide more reliable standard errors, t-statistics, p-values and confidence intervals when the error variance is not constant.

### Tests for Multicollinearity

***Is there evidence of a statistically significant linear relationship between the S&P 500 returns and changes in the VIX? And does this suggest potential multicollinearity between these explanatory variables in the Brent return model?***

Let's examine the relationship between the two explanatory variables and discuss whether multicollinearity may affect the individual significance of their estimated coefficients.

Let's regress S&P 500 returns onto VIX Changes to do a pairwise multicollinearity check.

$$
R_t^{SP500} = \alpha_0 + \alpha_1 \Delta VIX_t + u_t
$$

**Hypothesis**

$$
H_0: \alpha_1 = 0
$$

$$
H_1: \alpha_1 \neq 0
$$

The null hypothesis states that there is no statistically significant relationship


```python
sp500_vix_model = smf.ols(formula="sp500_return ~ vix_change", data=df).fit()
sp500_vix_model_robust = sp500_vix_model.get_robustcov_results(cov_type="HC3")
sp500_vix_model_robust.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>sp500_return</td>   <th>  R-squared:         </th> <td>   0.791</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.790</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   572.4</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th> <td>5.24e-80</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:42</td>     <th>  Log-Likelihood:    </th> <td> -282.40</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   568.8</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   413</td>      <th>  BIC:               </th> <td>   576.8</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     1</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>         <td>HC3</td>       <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
       <td></td>         <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>  <td>    0.0600</td> <td>    0.024</td> <td>    2.536</td> <td> 0.012</td> <td>    0.013</td> <td>    0.107</td>
</tr>
<tr>
  <th>vix_change</th> <td>   -0.4602</td> <td>    0.019</td> <td>  -23.926</td> <td> 0.000</td> <td>   -0.498</td> <td>   -0.422</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>26.471</td> <th>  Durbin-Watson:     </th> <td>   1.878</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td>  91.850</td>
</tr>
<tr>
  <th>Skew:</th>          <td> 0.028</td> <th>  Prob(JB):          </th> <td>1.13e-20</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.304</td> <th>  Cond. No.          </th> <td>    2.02</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors are heteroscedasticity robust (HC3)



**Estimated Equation**

$$
\widehat{R}^{SP500}_t = 0.0600 - 0.4602 \Delta VIX_t + e_t
$$

The regression shows a strong negative relationship between the S&P 500 and the changes in VIX, with a 1 point increase in the VIX being associated with a 0.4602 percentage point decrease in the daily S&P 500 return. Additionally, the $R^2$ of the regression shows that 79.1% of the variation in the S&P 500 is explained by the changes in VIX.

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

<div style="page-break-after: always;"></div>

**T-Critical Approach**

If t* doesn't fall into Acceptance Region ($t_{critical}$) $\rightarrow$ Reject $H_0$

If t* falls into Acceptance Region ($t_{critical}$) $\rightarrow$ Fail to Reject $H_0$

**Test Statistic and Distribution**

$$
p = 0.000
$$

$$
t^* = \frac{\hat{\alpha}_1} {SE(\hat{\alpha}_1)} = \frac{-0.4602}{0.019} = -23.926
$$

$$
t_{critical} = \pm 1.960
$$

$$
\alpha = 0.05
$$

*Since the degrees of freedom are 413 which is not listed in the statistical table, the $df = \infty$ row is used as a large sample approximation.*

**Conclusion**

The P-Value is less than 0.05 and the t-test statistic doesn't fall into our t-critical range and so we reject the null hypothesis at the 5% Significance level and there is a statistically significant relationship between S&P 500 returns and changes in the VIX.

#### Variance Inflation Factor

Let's investigate whether there is potential multicollinearity between these variables in the model.

First let's do pairwise variance inflation factor (VIF)

$$
R^2 = 0.791
$$

$$
VIF = \frac{1}{1-R^2} = \frac{1}{1-0.791} = 4.78
$$

The pairwise VIF of 4.78 indicates substantial linear dependence between the S&P 500 returns and changes in the VIX. Although it is slightly below the common VIF benchmark of 5, it is however sufficiently high to suggest potential multicollinearity. The full model VIFs will therefore be examined before reaching a final conclusion about multicollinearity in the Brent return model.

**Full Model VIF**


```python
x = df[["escalation", "supply_disruption", "deescalation", "usd_return", "sp500_return", "vix_change",
        "brent_return_l1"]].copy()
x = sm.add_constant(x)

vif_results = pd.DataFrame({"variable": x.columns,
                            "vif": [variance_inflation_factor(x.values, i)
                                    for i in range(x.shape[1])]})
vif_results = (vif_results.query("variable != 'const'").sort_values("vif", ascending=False).reset_index(drop=True))
vif_results
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
      <th>variable</th>
      <th>vif</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>sp500_return</td>
      <td>4.893446</td>
    </tr>
    <tr>
      <th>1</th>
      <td>vix_change</td>
      <td>4.876593</td>
    </tr>
    <tr>
      <th>2</th>
      <td>supply_disruption</td>
      <td>1.544768</td>
    </tr>
    <tr>
      <th>3</th>
      <td>escalation</td>
      <td>1.478911</td>
    </tr>
    <tr>
      <th>4</th>
      <td>deescalation</td>
      <td>1.119839</td>
    </tr>
    <tr>
      <th>5</th>
      <td>usd_return</td>
      <td>1.045057</td>
    </tr>
    <tr>
      <th>6</th>
      <td>brent_return_l1</td>
      <td>1.030651</td>
    </tr>
  </tbody>
</table>
</div>



$$
VIF_j = \frac{1}{1-R_j^2}
$$

Where:
- $R_j^2$ = Auxiliary regression $R^2$ in which explanatory variable $X_j$ is regressed on all the remaining variables.

**Conclusion**

The full model VIF analysis indicates that multicollinearity is primarily associated with S&P 500 returns and the changes in VIX, which have VIF values of 4.893 and 4.877 respectively. These values are very close to the commonly used threshold of 5 and so suggest a relatively high degree of linear dependence between the two variables while not exceeding the threshold for potentially problematic multicollinearity. All of the other explanatory variables have VIF values close to 1, thereby indicating little evidence of multicollinearity. Therefore, the Brent returns model does not appear to suffer from severe multicollinearity, although the strong relationship between the S&P500 returns and changes in VIX should be considered when interpreting their individual coefficients and statistical significance.

#### Wald test of S&P 500 and VIX

Let's investigate whether the S&P 500 returns and the changes in VIX are jointly significant in explaining the daily Brent crude oil returns?

**Hypothesis**

$$
H_0: \beta_5 = \beta_6 = 0
$$

$$
H_1: \text{At least one of } \beta_5, \beta_6 \neq 0
$$

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**Wald Test Statistic**

If $W$ > $\chi^2_{\alpha, q} \rightarrow$ Reject $H_0$

If $W$ ≤ $\chi^2_{\alpha, q} \rightarrow$ Fail to Reject $H_0$

**Wald Test Statistic**

$$
\begin{aligned}
W = (\hat{\theta}-\theta_0)'
\left[\operatorname{Var}(\hat{\theta})\right]^{-1}
(\hat{\theta}-\theta_0) \overset{H_0}{\sim} \chi_q^2
\end{aligned}
$$

$$
\begin{aligned}
W = \frac{(\hat{\theta}-\theta_0)^2}
{\operatorname{Var}(\hat{\theta})} \overset{H_0}{\sim} \chi_{2}^2
\end{aligned}
$$

With our 5% Significance level:

$$
\begin{aligned}
W = \frac{(\hat{\theta}-\theta_0)^2}
{\operatorname{Var}(\hat{\theta})} \overset{H_0}{\sim} \chi_{0.05, 2}^2
\end{aligned}
$$

**Wald Test Hypothetical Likelihood**

<img width="1245" height="820" alt="Wald_Test_Likelihood" src="https://github.com/user-attachments/assets/4df2d3fc-f3f9-4943-a43e-7f9867ed1e6f" />

***[(Lambert, 2014)](https://www.youtube.com/watch?v=TFKbyXAfr1M)***

If the thetas are far apart then this causes the Wald statistic to be high and if there is a Wald statistic that is a long distance away from zero, then we will reject the null hypothesis.


```python
model_robust.wald_test(["sp500_return = 0", "vix_change = 0"], use_f=False, scalar=True)
```




    <class 'statsmodels.stats.contrast.ContrastResults'>
    <Wald test (chi2): statistic=0.8938323422109, p-value=0.6395975227808386, df_denom=2>



$$
W = 0.894
$$

$$
\chi^2_{0.05, 2} = 5.991
$$

$$
p = 0.64
$$

**Conclusion**

From the Wald test, the Wald test statistic is 0.894 and its associated P-Value is 0.64, both of these statistics infer that we fail to reject the null hypothesis at the 5% significance level. Henceforth, there is insufficient statistical evidence to conclude that the S&P 500 returns and change in the VIX are jointly significant in explaining the daily Brent crude oil returns, while holding the other variables in the model constant.

Even though the S&P 500 returns and the changes in VIX did display a strong linear relationship and have VIF values close to 5, the Wald test showcased that they are not jointly significant in explaining Brent returns in the estimated model. This therefore suggests that their strong relationship with each other does not translate into a statistically significant joint contribution to the dependent variable.

***If we assume that there is multicollinearity between the S&P 500 returns and change in the VIX, how would we resolve this?***

**Solution**

In order to solve the problem of multicollinearity between the S&P 500 returns and the changes in the VIX, I would re-estimate the model through a certain process. I would remove the `sp500_return` and re-estimate the model and obtain its $R^2$ value, and will repeat this process on the original model for `vix_change` and retrieve its $R^2$. I will then compare the two $R^2$ values and the model retaining greater explanatory power would be preferred, while the other could be removed to reduce multicollinearity.

**S&P 500 Model**

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 \text{Escalation}_t + \beta_2 \text{SupplyDisruption}_t + \beta_3 \text{Deescalation}_t + \beta_4 r_{t}^{\text{USD}} + \beta_5 r_{t}^{\text{SP500}} + \beta_6 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$

**VIX Change Model**

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 \text{Escalation}_t + \beta_2 \text{SupplyDisruption}_t + \beta_3 \text{Deescalation}_t + \beta_4 r_{t}^{\text{USD}} + \beta_5 \Delta \text{VIX}_t + \beta_6 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$


```python
sp500_return_model = smf.ols(formula="""brent_return ~ escalation + supply_disruption + deescalation + usd_return + 
                                     sp500_return + brent_return_l1""", data=df).fit()
vix_change_model = smf.ols(formula="""brent_return ~ escalation + supply_disruption + deescalation + usd_return + 
                                   vix_change + brent_return_l1""", data=df).fit()
```


```python
print("S&P 500 Model")
print(f"R^2:", sp500_return_model.rsquared)
print("\nVIX Change Model")
print(f"R^2:", vix_change_model.rsquared)
```

    S&P 500 Model
    R^2: 0.09427146059445046
    
    VIX Change Model
    R^2: 0.09279821971478752
    

**Conclusion**

The model that had the highest $R^2$ was the S&P 500 model with an $R^2$ of 0.094. Therefore, I would keep the S&P 500 returns variable in the model and remove the daily change in VIX from the model.

***What are the consequences of multicollinearity for the OLS Estimator?***

The consequences of multicollinearity for the OLS Estimator is that when there is a presence of imperfect multicollinearity, the OLS Estimators remain unbiased and consistent, provided that the other OLS assumptions are held. However, multicollinearity increases the variances and standard errors of the affected coefficient estimates and so this reduces the precision of the estimates. This also lowers the absolute values of the t-statistics, widens the confidence intervals and can make variables appear individually statistically insignificant even when they are economically relevant variables. Additionally, coefficient estimates may also become unstable and sensitive to small changes in the sample or model specification. Therefore, multicollinearity can make it difficult to determine meaningful conclusion from the model.

### Chow Test for a Structural Break

***Let's implement the Chow test to investigate whether there is a structural break in the parameters of the daily Brent crude oil return model between the pre-conflict and conflict periods.***

We know that the conflict started on the 28th February 2026 and is recorded on its next trading day as 2nd March 2026. Therefore, the 2nd March 2026 would be the structural-break point.

There is one caveat however, the three event dummies are all 0 in the pre-conflict period and therefore those coefficients cannot be estimated in the pre-conflict subsample. So for this Chow test we will use a reduced baseline specification containing the market variables only and test whether these underlying market relationships changed after the conflict began.

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 r_{t}^{\text{USD}} + \beta_2 r_{t}^{\text{SP500}} + \beta_3 \Delta \text{VIX}_t + \beta_4 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$

**Hypothesis**

$$
H_0: \beta_j^{Pre} = \beta_j^{Post} \quad \text{for all } j
$$

$$
H_1: \text{At least one parameter differs between the pre-break and post-break periods}
$$


```python
structural_break = pd.Timestamp("2026-03-02")

pre_break = df.loc[df['date'] < structural_break]

post_break = df[df['date'] >= structural_break]

print(f"Pre-break observations:", len(pre_break))
print(f"Post-break observations:", len(post_break))
```

    Pre-break observations: 281
    Post-break observations: 134
    


```python
chow_formula = """brent_return ~ usd_return + sp500_return + vix_change + brent_return_l1"""
```


```python
pooled_model = smf.ols(formula=chow_formula, data=df).fit()

pre_break_model = smf.ols(formula=chow_formula, data=pre_break).fit()

post_break_model = smf.ols(formula=chow_formula, data=post_break).fit()
```


```python
rss_pooled = pooled_model.ssr
rss_pre_break = pre_break_model.ssr
rss_post_break = post_break_model.ssr

print(f"Pooled RSS: {rss_pooled:.4f}")
print(f"Pre-break RSS: {rss_pre_break:.4f}")
print(f"Post-break RSS: {rss_post_break:.4f}")
```

    Pooled RSS: 4028.0191
    Pre-break RSS: 1053.5311
    Post-break RSS: 2329.0378
    

$$
RSS_{Pooled} = \sum_{t=1}^{n} \hat{\varepsilon}_t^2
$$

$$
RSS_{Pre} = \sum \hat{\varepsilon}_{t,Pre}^{\,2}
$$

$$
RSS_{Post} = \sum \hat{\varepsilon}_{t,Post}^{\,2}
$$

**Test Statistic and Distribution**

$$
\begin{aligned}
F^* = \frac{
\left(RSS_P - RSS_1 - RSS_2\right)/k
}{
\left(RSS_1 + RSS_2\right)/(n-2k)
} \overset{H_0}{\sim} F_{1-\alpha,\;k,\;n-2k}
\end{aligned}
$$

$$
RSS_1 = RSS_{Pre}
$$

$$
RSS_2 = RSS_{Post}
$$

$$
F^* = \frac{\left(4028.0191 - 1053.5311 - 2329.0378\right)/5}{\left(1053.5311 + 2329.0378\right)/(415 - 10)} = 15.45614228 = 15.46
$$

$$
F_{critical} = F_{1-\alpha,\;k,\;n-2k} = F_{0.05, \;5, \;405} = 2.21
$$

*Source: Statistical Tables, Appendix D, Table D.3*

*Since the denominator degrees of freedom are 405 which is not exactly listed in the statistical table, the $df_2 = \infty$ row is used as a large sample approximation.*

**Decision Rule**

**F-Critical Approach**

If the F* > $F_{critical} \rightarrow$ Reject $H_0$

If the F* ≤ $F_{critical} \rightarrow$ Fail to reject $H_0$

**Conclusion**

From the Chow test, the F* is greater than the F-Critical and so we reject the null hypothesis at the 5% significance level. Therefore, there is statistically significant evidence of a structural break in the parameters of the Brent crude oil returns model around the 2nd March 2026. This indicates that the relationship between the Brent returns and the explanatory variables in the reduced market model differ between the pre-break and post-break periods. The result of the Chow test is consistent with the change in the behaviour of Brent crude oil returns around the beginning of the conflict period. However, it is important to bear in mind that the Chow test establishes a structural change around a specified date and does not by itself, establish that the conflict caused this change.

***Note:** The classical Chow test is reported as a test of parameter stability. However, since heteroscedasticity was detected in the residuals, its conventional F-test inference should be interpreted with some caution.*

### Significance of the conflict on Brent oil returns

***Holding all other factors equal, let's investigate if there is any evidence that the US-Iran conflict period has an effect on the daily Brent crude oil returns?***

The first step is to create the dummy variable for the conflict period where it is 1 if it is during the conflict and 0 otherwise.


```python
df['conflict'] = (df['date'] >= pd.Timestamp("2026-03-02")).astype(int)
```


```python
df.head(5)
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
      <th>date</th>
      <th>brent_return</th>
      <th>escalation</th>
      <th>supply_disruption</th>
      <th>deescalation</th>
      <th>usd_return</th>
      <th>sp500_return</th>
      <th>vix_change</th>
      <th>brent_return_l1</th>
      <th>conflict</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-06</td>
      <td>0.714335</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>-0.709716</td>
      <td>0.552282</td>
      <td>-0.09</td>
      <td>0.758868</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-07</td>
      <td>0.734966</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.058331</td>
      <td>-1.116600</td>
      <td>1.78</td>
      <td>0.714335</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-08</td>
      <td>-0.605633</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.361285</td>
      <td>0.155911</td>
      <td>-0.12</td>
      <td>0.734966</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-10</td>
      <td>3.042302</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.608548</td>
      <td>-1.553164</td>
      <td>1.84</td>
      <td>-0.605633</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-13</td>
      <td>3.607655</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.134586</td>
      <td>0.157417</td>
      <td>-0.35</td>
      <td>3.042302</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>



**New Estimated Model**

$$
\widehat{R}_t^{Brent} = \hat{\beta}_0 +\hat{\beta}_1 Escalation_t +\hat{\beta}_2 SupplyDisruption_t +\hat{\beta}_3 Deescalation_t +\hat{\beta}_4 r_t^{USD} +\hat{\beta}_5 r_t^{SP500} +\hat{\beta}_6 \Delta VIX_t \\
+\hat{\beta}_7 r_{t-1}^{Brent} +\hat{\beta}_8 Conflict_t + e_t
$$

**Hypothesis**

$$
H_0: \beta_8 = 0
$$

$$
H_1: \beta_8 \neq 0
$$

The null hypothesis states that being in the conflict period has no statistically significant effect on daily Brent crude oil returns.

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**T-Critical Approach**

If t* doesn't fall into Acceptance Region ($t_{critical}$) $\rightarrow$ Reject $H_0$

If t* falls into Acceptance Region ($t_{critical}$) $\rightarrow$ Fail to Reject $H_0$

<div style="page-break-after: always;"></div>

```python
conflict_model = smf.ols(formula="""brent_return ~ escalation + supply_disruption + deescalation + usd_return +
                                    sp500_return + vix_change + brent_return_l1 + conflict""", data=df).fit()
```


```python
conflict_model_robust = conflict_model.get_robustcov_results(cov_type="HC3")
conflict_model_robust.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>brent_return</td>   <th>  R-squared:         </th> <td>   0.095</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.077</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   3.159</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th>  <td>0.00175</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:42</td>     <th>  Log-Likelihood:    </th> <td> -1054.2</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   2126.</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   406</td>      <th>  BIC:               </th> <td>   2163.</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     8</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>         <td>HC3</td>       <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
          <td></td>             <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>         <td>    0.0753</td> <td>    0.131</td> <td>    0.574</td> <td> 0.566</td> <td>   -0.183</td> <td>    0.333</td>
</tr>
<tr>
  <th>escalation</th>        <td>    2.6271</td> <td>    1.439</td> <td>    1.825</td> <td> 0.069</td> <td>   -0.202</td> <td>    5.457</td>
</tr>
<tr>
  <th>supply_disruption</th> <td>   -0.9502</td> <td>    2.062</td> <td>   -0.461</td> <td> 0.645</td> <td>   -5.005</td> <td>    3.104</td>
</tr>
<tr>
  <th>deescalation</th>      <td>   -1.3324</td> <td>    2.514</td> <td>   -0.530</td> <td> 0.596</td> <td>   -6.275</td> <td>    3.610</td>
</tr>
<tr>
  <th>usd_return</th>        <td>    2.5015</td> <td>    0.584</td> <td>    4.282</td> <td> 0.000</td> <td>    1.353</td> <td>    3.650</td>
</tr>
<tr>
  <th>sp500_return</th>      <td>   -0.3089</td> <td>    0.403</td> <td>   -0.766</td> <td> 0.444</td> <td>   -1.101</td> <td>    0.483</td>
</tr>
<tr>
  <th>vix_change</th>        <td>   -0.0836</td> <td>    0.251</td> <td>   -0.333</td> <td> 0.739</td> <td>   -0.576</td> <td>    0.409</td>
</tr>
<tr>
  <th>brent_return_l1</th>   <td>    0.0135</td> <td>    0.069</td> <td>    0.197</td> <td> 0.844</td> <td>   -0.121</td> <td>    0.148</td>
</tr>
<tr>
  <th>conflict</th>          <td>    0.1567</td> <td>    0.454</td> <td>    0.345</td> <td> 0.730</td> <td>   -0.736</td> <td>    1.049</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>43.681</td> <th>  Durbin-Watson:     </th> <td>   2.008</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td> 163.883</td>
</tr>
<tr>
  <th>Skew:</th>          <td>-0.375</td> <th>  Prob(JB):          </th> <td>2.59e-36</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.986</td> <th>  Cond. No.          </th> <td>    33.0</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors are heteroscedasticity robust (HC3)



**Test Statistic and Distribution**

$$
p = 0.730
$$

$$
t^* = \frac{\hat{\beta}_8 - \beta_{8}} {SE(\hat{\beta}_8)} = \frac{0.1567}{0.454} = 0.345
$$

$$
t_{critical} = \pm 1.960
$$

$$
\alpha = 0.05
$$

*Since the degrees of freedom are 406 which is not listed in the statistical table, the $df = \infty$ row is used as a large sample approximation.*

**Conclusion**

From the t-test, the t* is 0.345 and its associated P-Value is 0.730, and so we fail to reject the null hypothesis at the 5% significance level. Therefore, there is insufficient statistical evidence to infer that the US-Iran conflict period has a significant effect on daily Brent crude oil returns, while holding all the other variables constant.

<div style="page-break-after: always;"></div>

### Effect of the US Dollar between pre-conflict and conflict periods

***Does the effect of the US Dollar returns on daily Brent crude oil returns differ between the pre-conflict and conflict periods?***

First, let's create the interaction term


```python
df['usd_conflict'] = (df['usd_return'] * df['conflict'])
```

**New Estimated Model**

$$
\widehat{R}_t^{Brent} = \hat{\beta}_0 +\hat{\beta}_1 Escalation_t +\hat{\beta}_2 SupplyDisruption_t +\hat{\beta}_3 Deescalation_t +\hat{\beta}_4 r_t^{USD} +\hat{\beta}_5 r_t^{SP500} +\hat{\beta}_6 \Delta VIX_t \\
+\hat{\beta}_7 r_{t-1}^{Brent} +\hat{\beta}_8 Conflict_t + \beta_9 \left(r_t^{USD}\times Conflict_t\right)+ e_t
$$

**Hypothesis**

$$
H_0: \beta_9 = 0
$$

$$
H_1: \beta_9 \neq 0
$$

The null hypothesis states that the effect of the US Dollar returns on daily Brent crude oil returns does not change between the pre-conflict and conflict periods.

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

**T-Critical Approach**

If t* doesn't fall into Acceptance Region ($t_{critical}$) $\rightarrow$ Reject $H_0$

If t* falls into Acceptance Region ($t_{critical}$) $\rightarrow$ Fail to Reject $H_0$


```python
usd_conflict_model = smf.ols(formula="""brent_return ~ escalation + supply_disruption + deescalation + usd_return + 
                                        sp500_return + vix_change + brent_return_l1 + conflict + usd_conflict""", 
                                        data=df).fit()
```


```python
usd_conflict_model_robust = usd_conflict_model.get_robustcov_results(cov_type="HC3")
usd_conflict_model_robust.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>brent_return</td>   <th>  R-squared:         </th> <td>   0.175</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.157</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   4.047</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th> <td>5.54e-05</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:43</td>     <th>  Log-Likelihood:    </th> <td> -1035.0</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   2090.</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   405</td>      <th>  BIC:               </th> <td>   2130.</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     9</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>         <td>HC3</td>       <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
          <td></td>             <th>coef</th>     <th>std err</th>      <th>t</th>      <th>P>|t|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>         <td>    0.0034</td> <td>    0.123</td> <td>    0.028</td> <td> 0.978</td> <td>   -0.238</td> <td>    0.244</td>
</tr>
<tr>
  <th>escalation</th>        <td>    2.3636</td> <td>    1.379</td> <td>    1.714</td> <td> 0.087</td> <td>   -0.347</td> <td>    5.074</td>
</tr>
<tr>
  <th>supply_disruption</th> <td>   -1.2222</td> <td>    2.137</td> <td>   -0.572</td> <td> 0.568</td> <td>   -5.423</td> <td>    2.978</td>
</tr>
<tr>
  <th>deescalation</th>      <td>   -2.0170</td> <td>    2.686</td> <td>   -0.751</td> <td> 0.453</td> <td>   -7.296</td> <td>    3.262</td>
</tr>
<tr>
  <th>usd_return</th>        <td>    0.6335</td> <td>    0.560</td> <td>    1.131</td> <td> 0.259</td> <td>   -0.468</td> <td>    1.735</td>
</tr>
<tr>
  <th>sp500_return</th>      <td>   -0.1261</td> <td>    0.372</td> <td>   -0.339</td> <td> 0.735</td> <td>   -0.856</td> <td>    0.604</td>
</tr>
<tr>
  <th>vix_change</th>        <td>   -0.0690</td> <td>    0.223</td> <td>   -0.310</td> <td> 0.757</td> <td>   -0.507</td> <td>    0.369</td>
</tr>
<tr>
  <th>brent_return_l1</th>   <td>    0.0314</td> <td>    0.066</td> <td>    0.474</td> <td> 0.636</td> <td>   -0.099</td> <td>    0.162</td>
</tr>
<tr>
  <th>conflict</th>          <td>    0.2654</td> <td>    0.433</td> <td>    0.613</td> <td> 0.540</td> <td>   -0.586</td> <td>    1.116</td>
</tr>
<tr>
  <th>usd_conflict</th>      <td>    6.7427</td> <td>    1.511</td> <td>    4.461</td> <td> 0.000</td> <td>    3.772</td> <td>    9.714</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>40.704</td> <th>  Durbin-Watson:     </th> <td>   2.033</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td> 151.783</td>
</tr>
<tr>
  <th>Skew:</th>          <td>-0.333</td> <th>  Prob(JB):          </th> <td>1.10e-33</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.887</td> <th>  Cond. No.          </th> <td>    33.1</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors are heteroscedasticity robust (HC3)



**Test Statistic and Distribution**

$$
p = 0.000
$$

$$
t^* = \frac{\hat{\beta}_9 - \beta_{9}} {SE(\hat{\beta}_9)} = \frac{6.7427}{1.511} = 4.461
$$

$$
t_{critical} = \pm 1.960
$$

$$
\alpha = 0.05
$$

*Since the degrees of freedom are 405 which is not listed in the statistical table, the $df = \infty$ row is used as a large sample approximation.*

**Conclusion**

From the t-test on the interaction term between US Dollar returns and Conflict, the t-test statistic is 4.461 and so is greater than the t-critical values acceptance region, therefore we reject the null hypothesis at the 5% significance level. Furthermore, the associated P-Value is 0.000 which is less than 0.05 and so we have additional support to reject the null hypothesis. We can conclude that there is statistically significant evidence that the effect of the US Dollar returns on the daily Brent crude oil returns differs between the pre-conflict and conflict periods.

The interaction terms coefficient of 6.7427 indicates that the relationship between the US Dollar returns and Brent returns became more positive during the conflict period by approximately 6.74 percentage points relative to the pre-conflict period, while holding the other variables constant.

Before the conflict period, a 1 percentage point increase in the US Dollar returns is associated with approximately a 0.63 percentage point increase in daily Brent crude oil returns. However, during the conflict, the conflict dummy is equal to 1 and so the US Dollar effect become equal to US Dollar returns coefficient plus the interaction terms coefficient. Therefore, a 1 percentage point increase in the US Dollar returns during the conflict is associated with approximately 7.38 percentage point increase in the daily Brent crude oil returns, while holding all other variables constant.

### Ramsey RESET Test for Misspecification

Let's test whether the daily Brent crude oil return model is correctly specified using the Ramsey RESET test.

When conducting a Ramsey RESET test, the functional form of the model needs to include the square of the fitted dependent variable, and this is known as quadratic misspecification.

$$
\begin{aligned}
R_t^{Brent}
={}&
\alpha_0
+\alpha_1 Escalation_t
+\alpha_2 SupplyDisruption_t
+\alpha_3 Deescalation_t
+\alpha_4 R_t^{USD}
\\
&+\alpha_5 R_t^{SP500}
+\alpha_6 \Delta VIX_t
+\alpha_7 R_{t-1}^{Brent}
+\alpha_8 \left(\widehat{R}_t^{Brent}\right)^2
+u_t
\end{aligned}
$$

**Hypothesis**

$$
H_0: \alpha_8 = 0 \rightarrow \text{The model is correctly specified}
$$

$$
H_1: \alpha_8 \neq 0 \rightarrow \text{The model is misspecified}
$$

**Manual Auxiliary Regression**


```python
df_reset = df.copy()

df_reset['fitted_brent_return'] = model.fittedvalues
df_reset['fitted_brent_return_sq'] = (df_reset['fitted_brent_return'] ** 2)

reset_auxiliary_model = smf.ols(formula="""brent_return ~ escalation + supply_disruption + deescalation + usd_return + 
                                            sp500_return + vix_change + brent_return_l1 + fitted_brent_return_sq""",
                                            data=df_reset).fit(cov_type="HC3")
reset_auxiliary_model.summary()
```




<table class="simpletable">
<caption>OLS Regression Results</caption>
<tr>
  <th>Dep. Variable:</th>      <td>brent_return</td>   <th>  R-squared:         </th> <td>   0.095</td>
</tr>
<tr>
  <th>Model:</th>                   <td>OLS</td>       <th>  Adj. R-squared:    </th> <td>   0.077</td>
</tr>
<tr>
  <th>Method:</th>             <td>Least Squares</td>  <th>  F-statistic:       </th> <td>   2.975</td>
</tr>
<tr>
  <th>Date:</th>             <td>Mon, 12 Oct 2026</td> <th>  Prob (F-statistic):</th>  <td>0.00300</td>
</tr>
<tr>
  <th>Time:</th>                 <td>20:58:43</td>     <th>  Log-Likelihood:    </th> <td> -1054.3</td>
</tr>
<tr>
  <th>No. Observations:</th>      <td>   415</td>      <th>  AIC:               </th> <td>   2127.</td>
</tr>
<tr>
  <th>Df Residuals:</th>          <td>   406</td>      <th>  BIC:               </th> <td>   2163.</td>
</tr>
<tr>
  <th>Df Model:</th>              <td>     8</td>      <th>                     </th>     <td> </td>   
</tr>
<tr>
  <th>Covariance Type:</th>         <td>HC3</td>       <th>                     </th>     <td> </td>   
</tr>
</table>
<table class="simpletable">
<tr>
             <td></td>               <th>coef</th>     <th>std err</th>      <th>z</th>      <th>P>|z|</th>  <th>[0.025</th>    <th>0.975]</th>  
</tr>
<tr>
  <th>Intercept</th>              <td>    0.1441</td> <td>    0.172</td> <td>    0.837</td> <td> 0.403</td> <td>   -0.194</td> <td>    0.482</td>
</tr>
<tr>
  <th>escalation</th>             <td>    3.0922</td> <td>    2.138</td> <td>    1.446</td> <td> 0.148</td> <td>   -1.099</td> <td>    7.283</td>
</tr>
<tr>
  <th>supply_disruption</th>      <td>   -1.1433</td> <td>    2.226</td> <td>   -0.514</td> <td> 0.608</td> <td>   -5.507</td> <td>    3.220</td>
</tr>
<tr>
  <th>deescalation</th>           <td>   -1.1239</td> <td>    2.560</td> <td>   -0.439</td> <td> 0.661</td> <td>   -6.142</td> <td>    3.894</td>
</tr>
<tr>
  <th>usd_return</th>             <td>    2.4933</td> <td>    0.602</td> <td>    4.143</td> <td> 0.000</td> <td>    1.314</td> <td>    3.673</td>
</tr>
<tr>
  <th>sp500_return</th>           <td>   -0.3038</td> <td>    0.400</td> <td>   -0.759</td> <td> 0.448</td> <td>   -1.088</td> <td>    0.480</td>
</tr>
<tr>
  <th>vix_change</th>             <td>   -0.0774</td> <td>    0.250</td> <td>   -0.310</td> <td> 0.757</td> <td>   -0.567</td> <td>    0.412</td>
</tr>
<tr>
  <th>brent_return_l1</th>        <td>    0.0146</td> <td>    0.069</td> <td>    0.212</td> <td> 0.832</td> <td>   -0.121</td> <td>    0.150</td>
</tr>
<tr>
  <th>fitted_brent_return_sq</th> <td>   -0.0382</td> <td>    0.189</td> <td>   -0.202</td> <td> 0.840</td> <td>   -0.408</td> <td>    0.331</td>
</tr>
</table>
<table class="simpletable">
<tr>
  <th>Omnibus:</th>       <td>40.152</td> <th>  Durbin-Watson:     </th> <td>   2.008</td>
</tr>
<tr>
  <th>Prob(Omnibus):</th> <td> 0.000</td> <th>  Jarque-Bera (JB):  </th> <td> 153.093</td>
</tr>
<tr>
  <th>Skew:</th>          <td>-0.314</td> <th>  Prob(JB):          </th> <td>5.71e-34</td>
</tr>
<tr>
  <th>Kurtosis:</th>      <td> 5.908</td> <th>  Cond. No.          </th> <td>    40.0</td>
</tr>
</table><br/><br/>Notes:<br/>[1] Standard Errors are heteroscedasticity robust (HC3)



Let's confirm this with the actual Ramsey RESET Python implementation.


```python
reset_test = linear_reset(model, power=2, test_type="fitted", use_f=True, cov_type="HC3")
print(reset_test)
```

    <F test: F=0.041005148348792896, p=0.8396294187871136, df_denom=406, df_num=1>
    

**Test Statistic and Distribution**

$$
F^* \overset{H_0}{\sim} F_{\alpha, \;q, \;df}
$$

Where:

- $F^*$ = Ramsey RESET test statistic
- $\alpha = 0.05$ = Significance level
- $q = 1$ = Number of restrictions
- $df = 406$ = Denominator degrees of freedom

$$
p = 0.840
$$

$$
F^* = 0.041
$$

$$
F_{critical} = F_{\alpha, \;q, \;df} = F_{0.05, 1, 406} = 3.84
$$

*Source: Statistical Tables, Appendix D, Table D.3*

*Since the denominator degrees of freedom are 406 which is not exactly listed in the statistical table, the $df_2 = \infty$ row is used as a large sample approximation.*

**Decision Rule**

**P-Value Approach**

If the P-Value ≤ $\alpha \rightarrow$ Reject $H_0$

If the P-Value > $\alpha \rightarrow$ Fail to Reject $H_0$

<div style="page-break-after: always;"></div>

**F-Critical Approach**

If the F* > $F_{critical} \rightarrow$ Reject $H_0$

If the F* ≤ $F_{critical} \rightarrow$ Fail to reject $H_0$

**Conclusion**

From the Ramsey RESET test for misspecification in the model, the F-statistic is 0.041 which is less than the F-critical and so we fail to reject the null hypothesis at the 5% significance level. Additionally, the associated P-Value from the Ramsey RESET Test is 0.840 and so we have further confirmation to fail to reject the null hypothesis. From the test, we can conclude that there is insufficient statistical evidence of functional-form misspecification in the Brent crude oil returns model. In particular, the squared fitted-value term is not statistically significant, thereby suggesting that adding a quadratic nonlinear component does not actually significantly improve the specification of the model.

### Final Model Diagnostics

***Based on the econometric tests conducted above, let's assess the reliability and adequacy of the estimated Brent crude oil returns model.*** 

Here will be discussed any violations of the classical regression assumptions and the measures taken to address these.

This econometric diagnostic analysis first tested the individual significance of the dummy variables escalation, supply disruption and deescalation and found that only escalation was statistically significant and individually relevant in explaining daily Brent returns. The analysis identified heteroscedasticity through the White test, in the regression residuals and so consequently HC3 heteroscedasticity robust standard errors are used for the final coefficient inference. The Breusch-Godfrey test found no evidence of serial correlation up to order two, and so there is no indication that a HAC correction is required. Additionally, the Jarque-Bera test rejects normality in the residuals, however with there being 415 observations, large sample inference is less dependent on the normality assumption.

A regression of the daily S&P 500 returns onto the daily changes in the VIX was done to examine the relationship between them and conduct a pairwise multicollinearity check. A subsequent t-test found that there is a statistically significant relationship between the S&P 500 returns and the changes in VIX. A VIF analysis showcased a high degree of linear dependence between them and their VIF values remaining below 5 and so are not exceeding the threshold for problematic multicollinearity. The Wald test was implemented on the joint significance of the S&P 500 and the changes in VIX, and subsequently found they were not jointly significant in explaining Brent returns. Finally, a $R^2$ comparison of two models, one with the original estimated model having the VIX removed and one with the S&P 500 removed, was illustrated to showcase how to deal with multicollinearity if it was indeed present. It was found that in the case there was multicollinearity, then the S&P 500 would be kept and the changes in the VIX would be removed.

The Chow test indicated that the parameters of the market model changed around the 2nd March 2026, thereby suggesting a structural change between the pre-conflict and conflict periods. However, when the conflict period dummy was tested for its individual significance, it was found to not be statistically significant, henceforth indicating that even simply being within the conflict period is not associated with a significant average shift in daily Brent returns, after controlling for the other variables. In contrast, a significance test of the interaction term USD-Conflict, was found to be statistically significant, thereby suggesting that the relationship between the US Dollar returns and daily Brent returns changed materially during the conflict period. Finally, the Ramsey RESET test provides no evidence of quadratic functional-form misspecification.

**Final Model**

$$
R_{t}^{\text{Brent}} = \beta_0 + \beta_1 \text{Escalation}_t + \beta_2 \text{SupplyDisruption}_t + \beta_3 \text{Deescalation}_t + \beta_4 r_{t}^{\text{USD}} + \beta_5 r_{t}^{\text{SP500}} + \beta_6 \Delta \text{VIX}_t + \beta_7 r_{t-1}^{\text{Brent}} + \varepsilon_t
$$

The baseline model will remain as the final model, with any statistical inference for the coefficients should be conducted using HC3-heteroscedasticity robust standard errors. An extension of the baseline model would be the addition of the conflict period dummy variable and the USD-Conflict interaction term. This extended specification is used as supplementary analysis to examine whether the conflict period is associated with a change in the level of daily Brent returns as well as the relationship between how the US Dollar returns and Brent returns differs between the pre-conflict and conflict periods.

### Overall Conclusion

***What conclusions can be drawn about the relationship between the US-Iran conflict and daily Brent crude oil returns from the econometric analysis?***

In conclusion, the results from the econometric analysis suggest that the relationship between the US-Iran conflict and Brent crude oil returns is more nuanced than a simple conflict-period effect. Individual escalation events are associated with higher Brent returns in the baseline model, whereas the supply disruption and de-escalation events coefficients are not statistically significant. The conflict period dummy variable is also statistically insignificant. Nevertheless, the Chow test did identify a significant structural break around the beginning of the conflict period, while the interaction term analysis showed that the relationship between the US Dollar returns and Brent returns changed significantly during the conflict period. These findings thereby suggest that the conflict may have altered the way in which Brent prices respond to broader market conditions rather than producing a constant increase in Brent returns throughout the entire conflict period.

### Policy and Government Use

***For what purposes could governments and policymakers use the econometric analysis conducted in this study?***

Governments and policymakers could use this econometric analysis for purposes such as policy making, economic planning, financial risk management and decision making. An example of one of these purposes is energy security planning, by understanding how geopolitical escalations and market disruptions are associated with oil price movements which in turn can inform contingency planning for strategic reserves. These oil price movements are in turn related to fiscal planning as the energy price volatility can affect tax receipts, subsidies and public expenditure. Brent crude oil also affects fuel, transport and production costs and so by understanding oil price shocks it can help assess inflationary risks and monetary policy analysis via distinguishing between energy driven inflation shocks and broader demand pressures. The econometric analysis can inform regulators and public institutions about the changing relationships between oil, volatility, equity markets and the dollar when assessing market stress. This analysis collectively provides a comprehensive toolkit for the government and policymakers to analyse, observe, plan and manage these economic and financial measures with regards to Brent crude oil.

<div style="page-break-after: always;"></div>

### Recommendations

One recommendation made from the results of this econometric analysis is to use dynamic hedging for energy portfolios due to the interaction term revealing that market sensitivity to the US Dollar returns shift significantly during active geopolitical conflict, therefore risk managers should avoid static currency hedges. Traditional cross-asset correlations break down under wartime shocks, thereby requiring dynamic hedging strategies that rebalance exposure the moment an escalation or supply disruption dummy triggers.

Another recommendation is to perform contingency planning for supply chain vulnerabilities, given that military escalations and supply disruptions introduce immediate upward pricing pressures on Brent crude. Thereby, energy dependent sectors and transport operators should incorporate pre-emptive buffer strategies, such as strategic reserve allocation or options-based price caps rather than relying on reactive purchasing during active conflict phases.

The final recommendation from this analysis is to enact macroeconomic and monetary policy vigilance as for central banks and macroeconomic forecasters, the structural shift in commodity pricing means that geopolitical shocks cannot be treated as temporary noise. This is because the conflict driven oil spikes feed swiftly into broader inflation and currency fluctuations and so monetary policymakers should monitor real-time geopolitical risk indicators alongside standard macroeconomic data to calibrate interest rate paths effectively.

### Practical Implications

These practical implications will bridge economic theory with market reality, the empirical findings from this model offer direct, actionable insights for commodity traders, portfolio risk managers and macroeconomic analysts. One such implication is the decoupling effect of the US Dollar and Brent returns, as the traditional cross-asset methodology relies on a negative correlation between the Dollar and crude oil returns. However, with the interaction term being statistically significant, it henceforth demonstrates that during active conflict regimes, this baseline relationship deteriorates or intensifies.

An additional practical implication is to integrate market fear metrics, as has been done so in this model with the short-term equity volatility changes alongside geopolitical dummy variables, this enables the capture of broad market sentiment spillover. Therefore, by incorporating the changes in VIX for example into short-term forecast models, this will enable traders to distinguish between systematic market-wide risk off events and localised supply-chain shocks, in turn allowing for more precise Value-at-Risk positioning during crisis periods.

Furthermore, by isolating binary indicators, the model is able to assign concrete and empirical magnitude to distinct geopolitical events. This brings us to our final implication, the ability for quantitative analysts to utilise the empirical results from the dummy variables to model scenarios. The coefficient estimates from the event dummy variables can be used as foundational inputs for Monte Carlo scenario simulations, thereby enabling real-time automated repricing of Brent futures contracts immediately following headline announcements.

## References

* Abdallah, N.; Azhari, T. (2026). Yemen's Houthis declare naval blockade against Saudi Arabia. Investing.com, 20 July. Available from https://www.investing.com/news/commodities-news/yemens-houthis-declare-naval-blockade-against-saudi-arabia--statement-4800903 [Accessed 23 September 2026]
* Alashray, E.; Maher, H.; Martina, M. (2026). US renews strikes on Iran after two military personnel were killed by Iranian attack. The Print, 19 July. Available from https://theprint.in/world/us-renews-strikes-on-iran-after-two-military-personnel-were-killed-by-iranian-attack/2990290/ [Accessed 23 September 2026]
* Amiri, F. (2026). In defiant speech, Pezeshkian calls out Trump and says Iran will fight 'until our last breath'. The Associated Press, 23 September. Available from https://apnews.com/article/iran-pezeshkian-united-nations-general-assembly-trump-war-210d432587bb8dc2d7303ca4c8ea67b6 [Accessed 23 September]
* Anna, C. (2026). A timeline of the Iran conflict and talks aimed at ending it. The Associated Press, 12 July. Available from https://apnews.com/article/iran-us-timeline-trump-hormuz-war-ceasefire-04da58cbae991183f8b52ef5bf615963 [Accessed 23 September 2026]
* Blanchard, Christopher M.; Sharp, Jeremy M.; Thomas, Clayton.; Zanotti, Jim. (2026). U.S. Conflict with Iran. Washington: Congress.gov. Available from https://www.congress.gov/crs-product/R48887 [Accessed 23 September 2026].
* Choukeir, J.; Abouhassira, E. (2026). Iran hits Gulf states and Jordan after seventh night of US strikes. The Print, 18 July. Available from https://theprint.in/world/iran-hits-gulf-states-and-jordan-after-seventh-night-of-us-strikes/2990111/ [Accessed 23 September 2026]
* Choukeir, J.; Elwelly, E.; Martina, M. (2026). More Red Sea shipments disrupted as Rubio says Iran not serious about talks. The Print, 22 July. Available from https://theprint.in/world/more-red-sea-shipments-disrupted-as-rubio-says-iran-not-serious-about-talks/2993499/ [Accessed 23 September 2026]
* Lambert, B. (2014). Wald Test – Introduction. YouTube. Available from: https://www.youtube.com/watch?v=TFKbyXAfr1M [Accessed 24th June 2024]. 
* Reuters. (2026). Trump: US will attack Iranian bridge, power plant for every ship targeted in Hormuz. Reuters, 22 July. Available from https://www.reuters.com/world/trump-us-will-attack-iranian-bridge-power-plant-every-ship-targeted-hormuz-2026-07-22/ [Accessed 23 September 2026]
* Schifrin, N.; Barnhart, E. (2026). At UN General Assembly, Iran's president responds to Trump's 'annihilation' threat. PBS News. Available from https://www.pbs.org/newshour/show/at-un-general-assembly-irans-president-responds-to-trumps-annihilation [Accessed 23 September 2026]
* Tan, F.; Verma, N. (2026). Three tankers carrying Saudi crude make U-turns in Red Sea after Houthi warning. Reuters, 21 July. Available from https://www.reuters.com/world/middle-east/two-tankers-carrying-saudi-crude-make-u-turns-red-sea-after-houthi-warning-2026-07-21/ [Accessed 23 September 2026]
* The Times Of Israel. (2026). Iran Guard says ships transiting Hormuz with US backing involved in 'accident'. The Times of Israel, 19 July. Available from https://www.timesofisrael.com/liveblog_entry/iran-guards-says-ships-transiting-hormuz-with-us-backing-involved-in-accident/ [Accessed 23 September 2026]
* Troderman, J; Keyserling, de Alex. (2026). Crude oil and petroleum product prices increased sharply in the first quarter of 2026. EIA, 7 April. Available from https://www.eia.gov/todayinenergy/detail.php?id=67424 [Accessed 21 September 2026]
* U.S. Central Command. (2026). CENTCOM Finishes Latest Wave of Strikes Against Iran. U.S. Central Command. Available from https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4549624/centcom-finishes-latest-wave-of-strikes-against-iran/ [Accessed 23 September 2026]
* U.S. Central Command. (2026). U.S. Concludes 13th Night of Strikes on Iranian Military Targets. U.S. Central Command. Available from https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4554671/us-concludes-13th-night-of-strikes-on-iranian-military-targets/ [Accessed 23 September 2026]
* U.S. Central Command. (2026). U.S. Finishes Latest Strikes Against Iran. U.S. Central Command. Available from https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4550818/us-finishes-latest-strikes-against-iran/ [Accessed 23 September 2026]
* U.S. Central Command. (2026). U.S. Forces Complete 11th Night of Strikes Against Iran. U.S. Central Command. Available from https://www.centcom.mil/MEDIA/PUBLIC-RELEASES/Article/4552008/us-forces-complete-11th-night-of-strikes-against-iran/ [Accessed 23 September 2026]
* U.S. Department Of The Treasury. (2026). Treasury Launches Unprecedented Campaign Against Iranian Regime on Economic D-Day. U.S. DEPARTMENT OF THE TREASURY. Available from https://home.treasury.gov/news/press-releases/sb0613 [Accessed 23 September 2026]


## Appendix

* **Dataset**


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
      <th>date</th>
      <th>brent_return</th>
      <th>escalation</th>
      <th>supply_disruption</th>
      <th>deescalation</th>
      <th>usd_return</th>
      <th>sp500_return</th>
      <th>vix_change</th>
      <th>brent_return_l1</th>
      <th>conflict</th>
      <th>usd_conflict</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2025-01-06</td>
      <td>0.714335</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>-0.709716</td>
      <td>0.552282</td>
      <td>-0.09</td>
      <td>0.758868</td>
      <td>0</td>
      <td>-0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-01-07</td>
      <td>0.734966</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.058331</td>
      <td>-1.116600</td>
      <td>1.78</td>
      <td>0.714335</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-01-08</td>
      <td>-0.605633</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.361285</td>
      <td>0.155911</td>
      <td>-0.12</td>
      <td>0.734966</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-01-10</td>
      <td>3.042302</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.608548</td>
      <td>-1.553164</td>
      <td>1.84</td>
      <td>-0.605633</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-13</td>
      <td>3.607655</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.134586</td>
      <td>0.157417</td>
      <td>-0.35</td>
      <td>3.042302</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



* **Percentage Points of the *t* Distribution**

*Statistical Tables Appendix D, Table D.2*

<img width="714" height="886" alt="Percentage Points of the t Distribution" src="https://github.com/user-attachments/assets/e8fdfb4d-eb41-4d27-a328-25f54acad685" />


* **Upper Percentage Points of the *F* Distribution**

*Statistical Tables Appendix D, Table D.3*

Note: This is the table I used for the F Critical value and not the whole table with the other degrees of freedom.

<img width="715" height="852" alt="Upper Percentage Points of the F Distribution" src="https://github.com/user-attachments/assets/26d3f0f5-c970-494b-ab58-793ede8cce64" />


* **Upper Percentage Points of the $\chi^2$ Distribution**

*Statistical Tables Appendix D, Table D.4*

<img width="715" height="873" alt="Upper Percentage Points of the Chi Distribution" src="https://github.com/user-attachments/assets/46237ca9-346e-4d67-83b9-f029a5ba9511" />


<img width="715" height="847" alt="Upper Percentage Points of the Chi Distribution_2" src="https://github.com/user-attachments/assets/0d4fb0ec-b3b3-4eab-95b8-500d8a374d57" />


* **Durbin-Watson *d* Statistic: Significance Points of $d_L$ and $d_U$ at 0.05 Level of Significance**

*Statistical Tables Appendix D: Table D.5A*

<img width="715" height="862" alt="Durbin Watson Significance Points of dL and dU" src="https://github.com/user-attachments/assets/5cfadcd0-7b9c-4bc7-84b3-35be15c6f163" />

