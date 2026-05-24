# <a id='toc1_'></a>[Extracting and Visualising Stock Data](#toc0_)
**Web Scraping, REST APIs and Requests**

**Table of contents**<a id='toc0_'></a>    
- [Extracting and Visualising Stock Data](#toc1_)    
  - [Scenario](#toc1_1_)    
  - [Objective](#toc1_2_)    
  - [Imports](#toc1_3_)    
  - [Using yfinance to extract Stock Market Data for Tesla](#toc1_4_)    
    - [Tesla (TSLA)](#toc1_4_1_)    
  - [Using Web Scraping to extract Tesla Revenue Data](#toc1_5_)    
  - [Using yfinance to extract Stock Market Data for GameStop](#toc1_6_)    
    - [GameStop (GME)](#toc1_6_1_)    
  - [Using Webscraping to extract GameStop Revenue Data](#toc1_7_)    
  - [Visualising Stock Graphs](#toc1_8_)    
    - [Helper Function](#toc1_8_1_)    
    - [Tesla (TSLA)](#toc1_8_2_)    
    - [GameStop (GME)](#toc1_8_3_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[Scenario](#toc0_)

In this scenario I am in the role of a Data Scientist working for a startup investment firm. The investment firm helps customers to make informed decisions about investing into the stock market.

## <a id='toc1_2_'></a>[Objective](#toc0_)

My objective is to extract the financial data, such as the historical stock prices and quarterly revenue from multiple sources using Python libraries and web scraping techniques. This will then be visualised in a dashboard to identify patterns and trends.

I will be working with the following stocks:
* Tesla
* GameStop

## <a id='toc1_3_'></a>[Imports](#toc0_)


```python
import pandas as pd
import matplotlib.pyplot as plt
import yfinance as yf
import requests
from bs4 import BeautifulSoup
import warnings
from io import StringIO
```


```python
warnings.filterwarnings("ignore", category=FutureWarning)
```

## <a id='toc1_4_'></a>[Using yfinance to extract Stock Market Data for Tesla](#toc0_)

### <a id='toc1_4_1_'></a>[Tesla (TSLA)](#toc0_)

Using the `Ticker()` function in order to create a ticker object. For Tesla its ticker symbol is TSLA.


```python
tesla = yf.Ticker('TSLA')
```

We can then use this ticker object to get more information and data about Tesla.


```python
tesla.info
```




    {'address1': '1 Tesla Road',
     'city': 'Austin',
     'state': 'TX',
     'zip': '78725',
     'country': 'United States',
     'phone': '512 516 8177',
     'website': 'https://www.tesla.com',
     'industry': 'Auto Manufacturers',
     'industryKey': 'auto-manufacturers',
     'industryDisp': 'Auto Manufacturers',
     'sector': 'Consumer Cyclical',
     'sectorKey': 'consumer-cyclical',
     'sectorDisp': 'Consumer Cyclical',
     'longBusinessSummary': 'Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally. The company operates in two segments, Automotive; and Energy Generation and Storage. The company offers electric vehicles, as well as sells automotive regulatory credits; and non-warranty maintenance services and collision, automotive insurance services, as well as part sales and retail merchandise sale. It also provides sedans and sport utility vehicles through direct and used vehicle sales, a network of Tesla Superchargers, and in-app upgrades; purchase financing and leasing services; services for electric vehicles through its company-owned service locations and Tesla mobile service technicians; and vehicle limited warranties and extended service plans. In addition, the company engages in the design, manufacture, installation, sale, and leasing of solar energy generation and energy storage products, and related services to residential, commercial, and industrial customers and utilities through its website, stores, and galleries, as well as through a network of channel partners. Further, it provides services and repairs to its energy product customers, including under warranty and extended service plans; and various financing options to its residential customers; lithium-ion battery energy storage products, such as Powerwall and Megapack; energy generation products, including solar panels and solar roof; self-driving development and artificial intelligence software, vehicle control and infotainment software, and battery and powertrain. The company was formerly known as Tesla Motors, Inc. and changed its name to Tesla, Inc. in February 2017. Tesla, Inc. was incorporated in 2003 and is headquartered in Austin, Texas.',
     'fullTimeEmployees': 134785,
     'companyOfficers': [{'maxAge': 1,
       'name': 'Mr. Elon R. Musk',
       'age': 54,
       'title': 'Co-Founder, Technoking of Tesla, CEO & Director',
       'yearBorn': 1971,
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Vaibhav  Taneja',
       'age': 47,
       'title': 'Chief Financial Officer',
       'yearBorn': 1978,
       'fiscalYear': 2024,
       'totalPay': 306846,
       'exercisedValue': 9653338,
       'unexercisedValue': 347210016},
      {'maxAge': 1,
       'name': 'Mr. Xiaotong  Zhu',
       'age': 45,
       'title': 'Senior Vice President of APAC & Global Vehicle Manufacturing',
       'yearBorn': 1980,
       'fiscalYear': 2024,
       'totalPay': 518250,
       'exercisedValue': 0,
       'unexercisedValue': 697024064},
      {'maxAge': 1,
       'name': 'Travis  Axelrod',
       'title': 'Head of Investor Relations',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Brandon  Ehrhart',
       'title': 'General Counsel & Corporate Secretary',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Franz  von Holzhausen',
       'title': 'Chief Designer',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Ms. Roxanne  Inskip-Kaye',
       'title': 'Head of Operations - Electric Vehicle Business',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. John  Walker',
       'age': 62,
       'title': 'Vice President of Sales - North America',
       'yearBorn': 1963,
       'fiscalYear': 2024,
       'totalPay': 121550,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Rodney D. Westmoreland Jr.',
       'title': 'Director of Construction Management',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Lars  Moravy',
       'title': 'Vice President of Vehicle Engineering',
       'fiscalYear': 2024,
       'exercisedValue': 0,
       'unexercisedValue': 0}],
     'auditRisk': 4,
     'boardRisk': 10,
     'compensationRisk': 10,
     'shareHolderRightsRisk': 9,
     'overallRisk': 10,
     'governanceEpochDate': 1777593600,
     'compensationAsOfEpochDate': 1735603200,
     'executiveTeam': [],
     'maxAge': 86400,
     'priceHint': 2,
     'previousClose': 411.81,
     'open': 417.43,
     'dayLow': 416.39,
     'dayHigh': 431.2,
     'regularMarketPreviousClose': 411.81,
     'regularMarketOpen': 417.43,
     'regularMarketDayLow': 416.39,
     'regularMarketDayHigh': 431.2,
     'payoutRatio': 0.0,
     'beta': 1.793,
     'trailingPE': 400.3271,
     'forwardPE': 168.95036,
     'volume': 63479076,
     'regularMarketVolume': 63489555,
     'averageVolume': 62366453,
     'averageVolume10days': 55858540,
     'averageDailyVolume10Day': 55858540,
     'bid': 427.77,
     'ask': 428.62,
     'bidSize': 1,
     'askSize': 2,
     'marketCap': 1608764358656,
     'nonDilutedMarketCap': 1608764320142,
     'fiftyTwoWeekLow': 273.21,
     'fiftyTwoWeekHigh': 498.83,
     'allTimeHigh': 498.83,
     'allTimeLow': 0.998667,
     'priceToSalesTrailing12Months': 16.436256,
     'fiftyDayAverage': 383.1894,
     'twoHundredDayAverage': 404.3852,
     'trailingAnnualDividendRate': 0.0,
     'trailingAnnualDividendYield': 0.0,
     'currency': 'USD',
     'tradeable': False,
     'enterpriseValue': 1580597379072,
     'profitMargins': 0.03946,
     'floatShares': 2815929087,
     'sharesOutstanding': 3755723871,
     'sharesShort': 71106902,
     'sharesShortPriorMonth': 60860404,
     'sharesShortPreviousMonthDate': 1773360000,
     'dateShortInterest': 1776211200,
     'sharesPercentSharesOut': 0.0189,
     'heldPercentInsiders': 0.11115,
     'heldPercentInstitutions': 0.46085,
     'shortRatio': 1.07,
     'shortPercentOfFloat': 0.021300001,
     'impliedSharesOutstanding': 3755723871,
     'bookValue': 21.897,
     'priceToBook': 19.562042,
     'lastFiscalYearEnd': 1767139200,
     'nextFiscalYearEnd': 1798675200,
     'mostRecentQuarter': 1774915200,
     'earningsQuarterlyGrowth': 0.166,
     'netIncomeToCommon': 3862000128,
     'trailingEps': 1.07,
     'forwardEps': 2.53536,
     'pegRatio': 5.9,
     'lastSplitFactor': '3:1',
     'lastSplitDate': 1661385600,
     'enterpriseToRevenue': 16.148,
     'enterpriseToEbitda': 142.473,
     '52WeekChange': 0.34540486,
     'SandP52WeekChange': 0.26603174,
     'quoteType': 'EQUITY',
     'currentPrice': 428.35,
     'targetHighPrice': 600.0,
     'targetLowPrice': 123.0,
     'targetMeanPrice': 412.25366,
     'targetMedianPrice': 450.0,
     'recommendationMean': 2.3617,
     'recommendationKey': 'buy',
     'numberOfAnalystOpinions': 41,
     'totalCash': 44743000064,
     'totalCashPerShare': 11.913,
     'ebitda': 11093999616,
     'totalDebt': 15889999872,
     'quickRatio': 1.43,
     'currentRatio': 2.043,
     'totalRevenue': 97878999040,
     'debtToEquity': 18.738,
     'revenuePerShare': 30.312,
     'returnOnAssets': 0.022330001,
     'returnOnEquity': 0.04901,
     'grossProfits': 18660999168,
     'freeCashflow': 5251999744,
     'operatingCashflow': 16528000000,
     'earningsGrowth': 0.083,
     'revenueGrowth': 0.158,
     'grossMargins': 0.19065,
     'ebitdaMargins': 0.11334,
     'operatingMargins': 0.04203,
     'financialCurrency': 'USD',
     'symbol': 'TSLA',
     'language': 'en-US',
     'region': 'US',
     'typeDisp': 'Equity',
     'quoteSourceName': 'Nasdaq Real Time Price',
     'triggerable': True,
     'customPriceAlertConfidence': 'HIGH',
     'corporateActions': [],
     'postMarketTime': 1778284797,
     'regularMarketTime': 1778270400,
     'fiftyDayAverageChange': 45.160614,
     'fiftyDayAverageChangePercent': 0.11785455,
     'twoHundredDayAverageChange': 23.964813,
     'twoHundredDayAverageChangePercent': 0.059262343,
     'sourceInterval': 15,
     'exchangeDataDelayedBy': 0,
     'averageAnalystRating': '2.4 - Buy',
     'cryptoTradeable': False,
     'exchange': 'NMS',
     'messageBoardId': 'finmb_27444752',
     'exchangeTimezoneName': 'America/New_York',
     'exchangeTimezoneShortName': 'EDT',
     'gmtOffSetMilliseconds': -14400000,
     'market': 'us_market',
     'esgPopulated': False,
     'regularMarketChangePercent': 4.01642,
     'regularMarketPrice': 428.35,
     'hasPrePostMarketData': True,
     'firstTradeDateMilliseconds': 1277818200000,
     'postMarketChangePercent': -0.08637682,
     'postMarketPrice': 427.98,
     'postMarketChange': -0.36999512,
     'regularMarketChange': 16.54,
     'regularMarketDayRange': '416.39 - 431.2',
     'fullExchangeName': 'NasdaqGS',
     'averageDailyVolume3Month': 62366453,
     'fiftyTwoWeekLowChange': 155.14001,
     'fiftyTwoWeekLowChangePercent': 0.56784165,
     'fiftyTwoWeekRange': '273.21 - 498.83',
     'fiftyTwoWeekHighChange': -70.47998,
     'fiftyTwoWeekHighChangePercent': -0.14129059,
     'fiftyTwoWeekChangePercent': 34.540485,
     'earningsTimestamp': 1776888000,
     'earningsTimestampStart': 1784750400,
     'earningsTimestampEnd': 1784750400,
     'earningsCallTimestampStart': 1776893400,
     'earningsCallTimestampEnd': 1776893400,
     'isEarningsDateEstimate': True,
     'epsTrailingTwelveMonths': 1.07,
     'epsForward': 2.53536,
     'epsCurrentYear': 2.05482,
     'priceEpsCurrentYear': 208.46107,
     'marketState': 'CLOSED',
     'shortName': 'Tesla, Inc.',
     'longName': 'Tesla, Inc.',
     'displayName': 'Tesla',
     'trailingPegRatio': 5.8981}




```python
tesla.income_stmt
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
      <th>2025-12-31</th>
      <th>2024-12-31</th>
      <th>2023-12-31</th>
      <th>2022-12-31</th>
      <th>2021-12-31</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Tax Effect Of Unusual Items</th>
      <td>-1.333800e+08</td>
      <td>-1.368000e+08</td>
      <td>0.000000e+00</td>
      <td>-1.408000e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tax Rate For Calcs</th>
      <td>2.700000e-01</td>
      <td>2.000000e-01</td>
      <td>2.100000e-01</td>
      <td>8.000000e-02</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Normalized EBITDA</th>
      <td>1.225800e+10</td>
      <td>1.539200e+10</td>
      <td>1.479600e+10</td>
      <td>1.783300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Unusual Items</th>
      <td>-4.940000e+08</td>
      <td>-6.840000e+08</td>
      <td>0.000000e+00</td>
      <td>-1.760000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Unusual Items Excluding Goodwill</th>
      <td>-4.940000e+08</td>
      <td>-6.840000e+08</td>
      <td>0.000000e+00</td>
      <td>-1.760000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income From Continuing Operation Net Minority Interest</th>
      <td>3.794000e+09</td>
      <td>7.130000e+09</td>
      <td>1.499900e+10</td>
      <td>1.258300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Reconciled Depreciation</th>
      <td>6.148000e+09</td>
      <td>5.368000e+09</td>
      <td>4.667000e+09</td>
      <td>3.747000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Reconciled Cost Of Revenue</th>
      <td>7.773300e+10</td>
      <td>8.024000e+10</td>
      <td>7.911300e+10</td>
      <td>6.060900e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>EBITDA</th>
      <td>1.176400e+10</td>
      <td>1.470800e+10</td>
      <td>1.479600e+10</td>
      <td>1.765700e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>EBIT</th>
      <td>5.616000e+09</td>
      <td>9.340000e+09</td>
      <td>1.012900e+10</td>
      <td>1.391000e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Interest Income</th>
      <td>1.342000e+09</td>
      <td>1.219000e+09</td>
      <td>9.100000e+08</td>
      <td>1.060000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Interest Expense</th>
      <td>3.380000e+08</td>
      <td>3.500000e+08</td>
      <td>1.560000e+08</td>
      <td>1.910000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Interest Income</th>
      <td>1.680000e+09</td>
      <td>1.569000e+09</td>
      <td>1.066000e+09</td>
      <td>2.970000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Normalized Income</th>
      <td>4.154620e+09</td>
      <td>7.677200e+09</td>
      <td>1.499900e+10</td>
      <td>1.274492e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income From Continuing And Discontinued Operation</th>
      <td>3.794000e+09</td>
      <td>7.130000e+09</td>
      <td>1.499900e+10</td>
      <td>1.258300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Expenses</th>
      <td>8.997800e+10</td>
      <td>8.993000e+10</td>
      <td>8.788200e+10</td>
      <td>6.763000e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Rent Expense Supplemental</th>
      <td>NaN</td>
      <td>1.003000e+09</td>
      <td>1.268000e+09</td>
      <td>1.509000e+09</td>
      <td>978000000.0</td>
    </tr>
    <tr>
      <th>Total Operating Income As Reported</th>
      <td>4.355000e+09</td>
      <td>7.076000e+09</td>
      <td>8.891000e+09</td>
      <td>1.365600e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted Average Shares</th>
      <td>3.526250e+09</td>
      <td>3.216000e+09</td>
      <td>3.482750e+09</td>
      <td>3.475000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Basic Average Shares</th>
      <td>3.224750e+09</td>
      <td>3.216000e+09</td>
      <td>3.173500e+09</td>
      <td>3.130000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted EPS</th>
      <td>1.080000e+00</td>
      <td>2.040000e+00</td>
      <td>4.310000e+00</td>
      <td>3.620000e+00</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Basic EPS</th>
      <td>1.176525e+00</td>
      <td>2.230000e+00</td>
      <td>4.725697e+00</td>
      <td>4.020000e+00</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted NI Availto Com Stockholders</th>
      <td>3.794000e+09</td>
      <td>7.130000e+09</td>
      <td>1.499900e+10</td>
      <td>1.258400e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Average Dilution Earnings</th>
      <td>NaN</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+06</td>
      <td>9000000.0</td>
    </tr>
    <tr>
      <th>Net Income Common Stockholders</th>
      <td>3.794000e+09</td>
      <td>7.130000e+09</td>
      <td>1.499900e+10</td>
      <td>1.258300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Otherunder Preferred Stock Dividend</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>-5000000.0</td>
    </tr>
    <tr>
      <th>Net Income</th>
      <td>3.794000e+09</td>
      <td>7.130000e+09</td>
      <td>1.499900e+10</td>
      <td>1.258300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Minority Interests</th>
      <td>-6.100000e+07</td>
      <td>-2.300000e+07</td>
      <td>2.500000e+07</td>
      <td>-4.000000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income Including Noncontrolling Interests</th>
      <td>3.855000e+09</td>
      <td>7.153000e+09</td>
      <td>1.497400e+10</td>
      <td>1.258700e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income Continuous Operations</th>
      <td>3.855000e+09</td>
      <td>7.153000e+09</td>
      <td>1.497400e+10</td>
      <td>1.258700e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tax Provision</th>
      <td>1.423000e+09</td>
      <td>1.837000e+09</td>
      <td>-5.001000e+09</td>
      <td>1.132000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Pretax Income</th>
      <td>5.278000e+09</td>
      <td>8.990000e+09</td>
      <td>9.973000e+09</td>
      <td>1.371900e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Income Expense</th>
      <td>-9.130000e+08</td>
      <td>1.100000e+07</td>
      <td>1.720000e+08</td>
      <td>-2.190000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Non Operating Income Expenses</th>
      <td>-4.190000e+08</td>
      <td>6.950000e+08</td>
      <td>1.720000e+08</td>
      <td>-4.300000e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Special Income Charges</th>
      <td>-4.940000e+08</td>
      <td>-6.840000e+08</td>
      <td>0.000000e+00</td>
      <td>-1.760000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Restructuring And Mergern Acquisition</th>
      <td>4.940000e+08</td>
      <td>6.840000e+08</td>
      <td>0.000000e+00</td>
      <td>1.760000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Non Operating Interest Income Expense</th>
      <td>1.342000e+09</td>
      <td>1.219000e+09</td>
      <td>9.100000e+08</td>
      <td>1.060000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Interest Expense Non Operating</th>
      <td>3.380000e+08</td>
      <td>3.500000e+08</td>
      <td>1.560000e+08</td>
      <td>1.910000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Interest Income Non Operating</th>
      <td>1.680000e+09</td>
      <td>1.569000e+09</td>
      <td>1.066000e+09</td>
      <td>2.970000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Income</th>
      <td>4.849000e+09</td>
      <td>7.760000e+09</td>
      <td>8.891000e+09</td>
      <td>1.383200e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Expense</th>
      <td>1.224500e+10</td>
      <td>9.690000e+09</td>
      <td>8.769000e+09</td>
      <td>7.021000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Research And Development</th>
      <td>6.411000e+09</td>
      <td>4.540000e+09</td>
      <td>3.969000e+09</td>
      <td>3.075000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Selling General And Administration</th>
      <td>5.834000e+09</td>
      <td>5.150000e+09</td>
      <td>4.800000e+09</td>
      <td>3.946000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Gross Profit</th>
      <td>1.709400e+10</td>
      <td>1.745000e+10</td>
      <td>1.766000e+10</td>
      <td>2.085300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cost Of Revenue</th>
      <td>7.773300e+10</td>
      <td>8.024000e+10</td>
      <td>7.911300e+10</td>
      <td>6.060900e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Revenue</th>
      <td>9.482700e+10</td>
      <td>9.769000e+10</td>
      <td>9.677300e+10</td>
      <td>8.146200e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Revenue</th>
      <td>9.482700e+10</td>
      <td>9.769000e+10</td>
      <td>9.677300e+10</td>
      <td>8.146200e+10</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
tesla.balance_sheet
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
      <th>2025-12-31</th>
      <th>2024-12-31</th>
      <th>2023-12-31</th>
      <th>2022-12-31</th>
      <th>2021-12-31</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Treasury Shares Number</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.000000e+00</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Ordinary Shares Number</th>
      <td>3.751000e+09</td>
      <td>3.216000e+09</td>
      <td>3.185000e+09</td>
      <td>3.164000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Share Issued</th>
      <td>3.751000e+09</td>
      <td>3.216000e+09</td>
      <td>3.185000e+09</td>
      <td>3.164000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Debt</th>
      <td>1.471900e+10</td>
      <td>1.362300e+10</td>
      <td>9.573000e+09</td>
      <td>5.748000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tangible Book Value</th>
      <td>8.074800e+10</td>
      <td>7.144300e+10</td>
      <td>6.201900e+10</td>
      <td>4.411100e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>Cash Cash Equivalents And Short Term Investments</th>
      <td>4.405900e+10</td>
      <td>3.656300e+10</td>
      <td>2.909400e+10</td>
      <td>2.218500e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Short Term Investments</th>
      <td>2.754600e+10</td>
      <td>2.042400e+10</td>
      <td>1.269600e+10</td>
      <td>5.932000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cash And Cash Equivalents</th>
      <td>1.651300e+10</td>
      <td>1.613900e+10</td>
      <td>1.639800e+10</td>
      <td>1.625300e+10</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cash Equivalents</th>
      <td>1.890000e+09</td>
      <td>1.753000e+09</td>
      <td>4.950000e+08</td>
      <td>2.288000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cash Financial</th>
      <td>1.462300e+10</td>
      <td>1.438600e+10</td>
      <td>1.590300e+10</td>
      <td>1.396500e+10</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>81 rows × 5 columns</p>
</div>



Using the `history()` method to extract the stock data and store in a dataframe named `tesla_data` with a time length set to the maximum amount of time.


```python
tesla_data = tesla.history(period='max')
```


```python
tesla_data.reset_index(inplace=True)
tesla_data.head()
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
      <th>Date</th>
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2010-06-29 00:00:00-04:00</td>
      <td>1.266667</td>
      <td>1.666667</td>
      <td>1.169333</td>
      <td>1.592667</td>
      <td>281494500</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2010-06-30 00:00:00-04:00</td>
      <td>1.719333</td>
      <td>2.028000</td>
      <td>1.553333</td>
      <td>1.588667</td>
      <td>257806500</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2010-07-01 00:00:00-04:00</td>
      <td>1.666667</td>
      <td>1.728000</td>
      <td>1.351333</td>
      <td>1.464000</td>
      <td>123282000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2010-07-02 00:00:00-04:00</td>
      <td>1.533333</td>
      <td>1.540000</td>
      <td>1.247333</td>
      <td>1.280000</td>
      <td>77097000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2010-07-06 00:00:00-04:00</td>
      <td>1.333333</td>
      <td>1.333333</td>
      <td>1.055333</td>
      <td>1.074000</td>
      <td>103003500</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



## <a id='toc1_5_'></a>[Using Web Scraping to extract Tesla Revenue Data](#toc0_)

Here we will use the `request` library to send a HTTP GET Request to the webpage where our Tesla data is hosted.

We will be getting the Tesla Revenue Data from macrotrends, and so lets check its `robots.txt` file to see its permissions.

[Robots.txt](robots.pdf)

In the `macrotrends.net/robots.txt` file it only disallows certain file paths, these being:

![Robots](Robots.png)

With our url file path containing `/stocks/charts` we are therefore allowed to scrape the webpage.


```python
url = 'https://www.macrotrends.net/stocks/charts/TSLA/tesla/revenue'
headers = {'User-Agent': 'Mozilla/5.0'}
r = requests.get(url, headers=headers)
```


```python
r.status_code
```




    200




```python
data = r.text
```

Now using BeautifulSoup, we will parse the HTML document with the `html5lib` parser.


```python
tesla_rev = BeautifulSoup(data, 'html5lib')
```

With this Soup object of `tesla_rev` we will now find the table where our quarterly revenue is.

When looking at the webpage and inspecting element, we use ctrl+f to find and search for table. Doing this we find that the table we want is in the 2 position out of 11. With Python's 0 based Indexing, this means it is in index 1.

![Tesla](Tesla_Revenue_Inspect_Element.png)


```python
table = tesla_rev.find_all('tbody')[1]
```


```python
tesla_revenue = pd.DataFrame(columns=['Date', 'Revenue'])
```


```python
for row in table.find_all('tr'):
    col = row.find_all('td')
    date = col[0].text
    revenue = col[1].text
    tesla_revenue = pd.concat([tesla_revenue, pd.DataFrame({'Date': [date],
                                                            'Revenue': [revenue]}
                                                            )], ignore_index=True)
```


```python
tesla_revenue.head()
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
      <th>Date</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2026-03-31</td>
      <td>$22,387</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-12-31</td>
      <td>$24,901</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-09-30</td>
      <td>$28,095</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-06-30</td>
      <td>$22,496</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-03-31</td>
      <td>$19,335</td>
    </tr>
  </tbody>
</table>
</div>



Lets clean the `Revenue` column


```python
tesla_revenue['Revenue'] = tesla_revenue['Revenue'].str.replace(',|\$', "", regex=True)
```

    <>:1: SyntaxWarning: invalid escape sequence '\$'
    <>:1: SyntaxWarning: invalid escape sequence '\$'
    C:\Users\alexa\AppData\Local\Temp\ipykernel_24156\3524225392.py:1: SyntaxWarning: invalid escape sequence '\$'
      tesla_revenue['Revenue'] = tesla_revenue['Revenue'].str.replace(',|\$', "", regex=True)
    


```python
tesla_revenue.dropna(inplace=True)
tesla_revenue = tesla_revenue[tesla_revenue['Revenue'] != ""]
```

Displaying the last 5 rows of the `tesla_revenue` dataframe


```python
tesla_revenue.tail()
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
      <th>Date</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>55</th>
      <td>2012-06-30</td>
      <td>27</td>
    </tr>
    <tr>
      <th>56</th>
      <td>2012-03-31</td>
      <td>30</td>
    </tr>
    <tr>
      <th>57</th>
      <td>2011-12-31</td>
      <td>39</td>
    </tr>
    <tr>
      <th>58</th>
      <td>2011-09-30</td>
      <td>58</td>
    </tr>
    <tr>
      <th>59</th>
      <td>2011-06-30</td>
      <td>58</td>
    </tr>
  </tbody>
</table>
</div>



## <a id='toc1_6_'></a>[Using yfinance to extract Stock Market Data for GameStop](#toc0_)

### <a id='toc1_6_1_'></a>[GameStop (GME)](#toc0_)

We will repeat the previous tasks of using the `Ticker()` function and getting the data for GameStop


```python
gamestop = yf.Ticker('GME')
```

Lets look at GameStops information


```python
gamestop.info
```




    {'address1': '625 Westport Parkway',
     'city': 'Grapevine',
     'state': 'TX',
     'zip': '76051',
     'country': 'United States',
     'phone': '817 424 2000',
     'website': 'https://www.gamestop.com',
     'industry': 'Specialty Retail',
     'industryKey': 'specialty-retail',
     'industryDisp': 'Specialty Retail',
     'sector': 'Consumer Cyclical',
     'sectorKey': 'consumer-cyclical',
     'sectorDisp': 'Consumer Cyclical',
     'longBusinessSummary': 'GameStop Corp., a specialty retailer, provides games, collectibles, and entertainment products through its stores and e-commerce platforms in United States, Australia and Europe. The company sells new and pre-owned gaming platforms; accessories, such as controllers, gaming headsets, and other peripheral devices; new and pre-owned gaming software; and in-game digital currency, digital downloadable content, and full-game downloads. It also sells collectibles comprising apparel, toys, trading cards, gadgets, and other retail products for pop culture and technology enthusiasts. The company operates stores and e-commerce sites under the GameStop, EB Games, and Micromania brands; and pop culture themed stores that sell collectibles, apparel, gadgets, electronics, toys, and other retail products under the Zing Pop Culture brand. The company was formerly known as GSC Holdings Corp. GameStop Corp. was founded in 1996 and is based in Grapevine, Texas.',
     'fullTimeEmployees': 4000,
     'companyOfficers': [{'maxAge': 1,
       'name': 'Mr. Ryan  Cohen',
       'age': 39,
       'title': 'President, CEO & Executive Chairman',
       'yearBorn': 1986,
       'fiscalYear': 2024,
       'totalPay': 268553,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Daniel William Moore',
       'age': 42,
       'title': 'Principal Accounting Officer & Principal Financial Officer',
       'yearBorn': 1983,
       'fiscalYear': 2024,
       'totalPay': 221492,
       'exercisedValue': 0,
       'unexercisedValue': 0},
      {'maxAge': 1,
       'name': 'Mr. Mark Haymond Robinson',
       'age': 47,
       'title': 'General Counsel & Secretary',
       'yearBorn': 1978,
       'fiscalYear': 2024,
       'totalPay': 200000,
       'exercisedValue': 0,
       'unexercisedValue': 0}],
     'auditRisk': 8,
     'boardRisk': 9,
     'compensationRisk': 4,
     'shareHolderRightsRisk': 3,
     'overallRisk': 6,
     'governanceEpochDate': 1777593600,
     'compensationAsOfEpochDate': 1735603200,
     'irWebsite': 'http://phx.corporate-ir.net/phoenix.zhtml?c=130125&p=irol-irhome',
     'executiveTeam': [],
     'maxAge': 86400,
     'priceHint': 2,
     'previousClose': 23.97,
     'open': 24.14,
     'dayLow': 23.82,
     'dayHigh': 24.42,
     'regularMarketPreviousClose': 23.97,
     'regularMarketOpen': 24.14,
     'regularMarketDayLow': 23.82,
     'regularMarketDayHigh': 24.42,
     'exDividendDate': 1552521600,
     'payoutRatio': 0.0,
     'fiveYearAvgDividendYield': 9.52,
     'beta': 1.833,
     'trailingPE': 31.532469,
     'forwardPE': 20.066116,
     'volume': 5637317,
     'regularMarketVolume': 5637317,
     'averageVolume': 7080780,
     'averageVolume10days': 12693080,
     'averageDailyVolume10Day': 12693080,
     'bid': 24.25,
     'ask': 24.22,
     'bidSize': 1000,
     'askSize': 300,
     'marketCap': 10886549504,
     'nonDilutedMarketCap': 10864130054,
     'fiftyTwoWeekLow': 19.93,
     'fiftyTwoWeekHigh': 35.81,
     'allTimeHigh': 120.75,
     'allTimeLow': 0.6425,
     'priceToSalesTrailing12Months': 2.9991322,
     'fiftyDayAverage': 23.945,
     'twoHundredDayAverage': 23.24945,
     'trailingAnnualDividendRate': 0.0,
     'trailingAnnualDividendYield': 0.0,
     'currency': 'USD',
     'tradeable': False,
     'enterpriseValue': 6234648576,
     'profitMargins': 0.11526,
     'floatShares': 408214194,
     'sharesOutstanding': 448375157,
     'sharesShort': 61907606,
     'sharesShortPriorMonth': 64227044,
     'sharesShortPreviousMonthDate': 1773360000,
     'dateShortInterest': 1776211200,
     'sharesPercentSharesOut': 0.1381,
     'heldPercentInsiders': 0.08877,
     'heldPercentInstitutions': 0.40924,
     'shortRatio': 9.81,
     'shortPercentOfFloat': 0.1512,
     'impliedSharesOutstanding': 448375157,
     'bookValue': 12.145,
     'priceToBook': 1.9991766,
     'lastFiscalYearEnd': 1769817600,
     'nextFiscalYearEnd': 1801353600,
     'mostRecentQuarter': 1769817600,
     'earningsQuarterlyGrowth': -0.026,
     'netIncomeToCommon': 418400000,
     'trailingEps': 0.77,
     'forwardEps': 1.21,
     'pegRatio': 0.31,
     'lastSplitFactor': '4:1',
     'lastSplitDate': 1658448000,
     'enterpriseToRevenue': 1.718,
     'enterpriseToEbitda': 20.824,
     '52WeekChange': -0.13440287,
     'SandP52WeekChange': 0.26603174,
     'lastDividendValue': 0.095,
     'lastDividendDate': 1552521600,
     'quoteType': 'EQUITY',
     'currentPrice': 24.28,
     'recommendationMean': 0.0,
     'recommendationKey': 'strong_buy',
     'totalCash': 9013799936,
     'totalCashPerShare': 20.103,
     'ebitda': 299400000,
     'totalDebt': 4361900032,
     'quickRatio': 13.841,
     'currentRatio': 15.297,
     'totalRevenue': 3629900032,
     'debtToEquity': 80.117,
     'revenuePerShare': 8.11,
     'returnOnAssets': 0.02189,
     'returnOnEquity': 0.08066,
     'grossProfits': 1196099968,
     'freeCashflow': -159700000,
     'operatingCashflow': 614800000,
     'earningsGrowth': -0.253,
     'revenueGrowth': -0.139,
     'grossMargins': 0.32951,
     'ebitdaMargins': 0.08248,
     'operatingMargins': 0.13022,
     'financialCurrency': 'USD',
     'symbol': 'GME',
     'language': 'en-US',
     'region': 'US',
     'typeDisp': 'Equity',
     'quoteSourceName': 'Nasdaq Real Time Price',
     'triggerable': True,
     'customPriceAlertConfidence': 'HIGH',
     'marketState': 'CLOSED',
     'hasPrePostMarketData': True,
     'firstTradeDateMilliseconds': 1013610600000,
     'postMarketChangePercent': 0.0049411952,
     'postMarketPrice': 24.2812,
     'postMarketChange': 0.0011997223,
     'regularMarketChange': 0.310001,
     'regularMarketDayRange': '23.82 - 24.42',
     'fullExchangeName': 'NYSE',
     'averageDailyVolume3Month': 7080780,
     'fiftyTwoWeekLowChange': 4.3500004,
     'fiftyTwoWeekLowChangePercent': 0.21826394,
     'fiftyTwoWeekRange': '19.93 - 35.81',
     'fiftyTwoWeekHighChange': -11.530001,
     'fiftyTwoWeekHighChangePercent': -0.3219771,
     'fiftyTwoWeekChangePercent': -13.440287,
     'dividendDate': 1529971200,
     'earningsTimestamp': 1774382400,
     'earningsTimestampStart': 1781035200,
     'earningsTimestampEnd': 1781035200,
     'isEarningsDateEstimate': True,
     'epsTrailingTwelveMonths': 0.77,
     'epsForward': 1.21,
     'epsCurrentYear': 1.09,
     'priceEpsCurrentYear': 22.275229,
     'fiftyDayAverageChange': 0.335001,
     'fiftyDayAverageChangePercent': 0.013990437,
     'twoHundredDayAverageChange': 1.03055,
     'twoHundredDayAverageChangePercent': 0.04432578,
     'sourceInterval': 15,
     'exchangeDataDelayedBy': 0,
     'averageAnalystRating': '0.0 - Strong Buy',
     'cryptoTradeable': False,
     'corporateActions': [],
     'postMarketTime': 1778284797,
     'regularMarketTime': 1778270403,
     'exchange': 'NYQ',
     'messageBoardId': 'finmb_1342560',
     'exchangeTimezoneName': 'America/New_York',
     'exchangeTimezoneShortName': 'EDT',
     'gmtOffSetMilliseconds': -14400000,
     'market': 'us_market',
     'esgPopulated': False,
     'regularMarketChangePercent': 1.29329,
     'regularMarketPrice': 24.28,
     'shortName': 'GameStop Corporation',
     'longName': 'GameStop Corp.',
     'displayName': 'GameStop',
     'trailingPegRatio': None}




```python
gamestop.income_stmt
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
      <th>2026-01-31</th>
      <th>2025-01-31</th>
      <th>2024-01-31</th>
      <th>2023-01-31</th>
      <th>2022-01-31</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Tax Effect Of Unusual Items</th>
      <td>-7.416000e+07</td>
      <td>-4.171283e+05</td>
      <td>-1.008000e+06</td>
      <td>-5.670000e+05</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tax Rate For Calcs</th>
      <td>4.000000e-01</td>
      <td>4.300300e-02</td>
      <td>2.100000e-01</td>
      <td>2.100000e-01</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Normalized EBITDA</th>
      <td>4.859000e+08</td>
      <td>3.210000e+07</td>
      <td>3.130000e+07</td>
      <td>-2.445000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Unusual Items</th>
      <td>-1.854000e+08</td>
      <td>-9.700000e+06</td>
      <td>-4.800000e+06</td>
      <td>-2.700000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Unusual Items Excluding Goodwill</th>
      <td>-1.854000e+08</td>
      <td>-9.700000e+06</td>
      <td>-4.800000e+06</td>
      <td>-2.700000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income From Continuing Operation Net Minority Interest</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Reconciled Depreciation</th>
      <td>1.460000e+07</td>
      <td>3.890000e+07</td>
      <td>5.620000e+07</td>
      <td>6.170000e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Reconciled Cost Of Revenue</th>
      <td>2.433800e+09</td>
      <td>2.709100e+09</td>
      <td>3.978600e+09</td>
      <td>4.555100e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>EBITDA</th>
      <td>3.005000e+08</td>
      <td>2.240000e+07</td>
      <td>2.650000e+07</td>
      <td>-2.472000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>EBIT</th>
      <td>2.859000e+08</td>
      <td>-1.650000e+07</td>
      <td>-2.970000e+07</td>
      <td>-3.089000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Interest Income</th>
      <td>2.715000e+08</td>
      <td>1.634000e+08</td>
      <td>4.950000e+07</td>
      <td>9.500000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Interest Expense</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>26900000.0</td>
    </tr>
    <tr>
      <th>Interest Income</th>
      <td>2.715000e+08</td>
      <td>1.634000e+08</td>
      <td>4.950000e+07</td>
      <td>9.500000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Normalized Income</th>
      <td>5.296400e+08</td>
      <td>1.405829e+08</td>
      <td>1.049200e+07</td>
      <td>-3.109670e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income From Continuing And Discontinued Operation</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Expenses</th>
      <td>3.344000e+09</td>
      <td>3.839500e+09</td>
      <td>5.302500e+09</td>
      <td>6.236100e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Operating Income As Reported</th>
      <td>2.321000e+08</td>
      <td>-2.620000e+07</td>
      <td>-3.450000e+07</td>
      <td>-3.116000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted Average Shares</th>
      <td>5.491000e+08</td>
      <td>3.947000e+08</td>
      <td>3.052000e+08</td>
      <td>3.042000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Basic Average Shares</th>
      <td>4.476000e+08</td>
      <td>3.941000e+08</td>
      <td>3.051000e+08</td>
      <td>3.042000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted EPS</th>
      <td>7.700000e-01</td>
      <td>3.300000e-01</td>
      <td>2.000000e-02</td>
      <td>-1.030000e+00</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Basic EPS</th>
      <td>9.300000e-01</td>
      <td>3.300000e-01</td>
      <td>2.000000e-02</td>
      <td>-1.030000e+00</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Diluted NI Availto Com Stockholders</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income Common Stockholders</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income Including Noncontrolling Interests</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Net Income Discontinuous Operations</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.000000e+00</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>Net Income Continuous Operations</th>
      <td>4.184000e+08</td>
      <td>1.313000e+08</td>
      <td>6.700000e+06</td>
      <td>-3.131000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tax Provision</th>
      <td>-3.440000e+07</td>
      <td>5.900000e+06</td>
      <td>6.400000e+06</td>
      <td>1.100000e+07</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Pretax Income</th>
      <td>3.840000e+08</td>
      <td>1.372000e+08</td>
      <td>1.310000e+07</td>
      <td>-3.021000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Income Expense</th>
      <td>-1.734000e+08</td>
      <td>-9.700000e+06</td>
      <td>-6.700000e+06</td>
      <td>-2.700000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Non Operating Income Expenses</th>
      <td>1.200000e+07</td>
      <td>NaN</td>
      <td>-1.900000e+06</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Special Income Charges</th>
      <td>-1.854000e+08</td>
      <td>-9.700000e+06</td>
      <td>-4.800000e+06</td>
      <td>-2.700000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Gain On Sale Of Ppe</th>
      <td>-1.316000e+08</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Write Off</th>
      <td>5.380000e+07</td>
      <td>9.700000e+06</td>
      <td>4.800000e+06</td>
      <td>2.700000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Impairment Of Capital Assets</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.000000e+00</td>
      <td>6700000.0</td>
    </tr>
    <tr>
      <th>Net Non Operating Interest Income Expense</th>
      <td>2.715000e+08</td>
      <td>1.634000e+08</td>
      <td>4.950000e+07</td>
      <td>9.500000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Other Finance Cost</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>-4.950000e+07</td>
      <td>-9.500000e+06</td>
      <td>26900000.0</td>
    </tr>
    <tr>
      <th>Interest Expense Non Operating</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>26900000.0</td>
    </tr>
    <tr>
      <th>Interest Income Non Operating</th>
      <td>2.715000e+08</td>
      <td>1.634000e+08</td>
      <td>4.950000e+07</td>
      <td>9.500000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Income</th>
      <td>2.859000e+08</td>
      <td>-1.650000e+07</td>
      <td>-2.970000e+07</td>
      <td>-3.089000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Expense</th>
      <td>9.102000e+08</td>
      <td>1.130400e+09</td>
      <td>1.323900e+09</td>
      <td>1.681000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Selling General And Administration</th>
      <td>9.102000e+08</td>
      <td>1.130400e+09</td>
      <td>1.323900e+09</td>
      <td>1.681000e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Gross Profit</th>
      <td>1.196100e+09</td>
      <td>1.113900e+09</td>
      <td>1.294200e+09</td>
      <td>1.372100e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cost Of Revenue</th>
      <td>2.433800e+09</td>
      <td>2.709100e+09</td>
      <td>3.978600e+09</td>
      <td>4.555100e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Revenue</th>
      <td>3.629900e+09</td>
      <td>3.823000e+09</td>
      <td>5.272800e+09</td>
      <td>5.927200e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Operating Revenue</th>
      <td>3.629900e+09</td>
      <td>3.823000e+09</td>
      <td>5.272800e+09</td>
      <td>5.927200e+09</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
gamestop.balance_sheet
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
      <th>2026-01-31</th>
      <th>2025-01-31</th>
      <th>2024-01-31</th>
      <th>2023-01-31</th>
      <th>2022-01-31</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ordinary Shares Number</th>
      <td>4.483000e+08</td>
      <td>4.468004e+08</td>
      <td>3.057000e+08</td>
      <td>3.046000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Share Issued</th>
      <td>4.483000e+08</td>
      <td>4.468004e+08</td>
      <td>3.057000e+08</td>
      <td>3.046000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Total Debt</th>
      <td>4.361900e+09</td>
      <td>4.107000e+08</td>
      <td>6.028000e+08</td>
      <td>6.166000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Tangible Book Value</th>
      <td>5.444400e+09</td>
      <td>4.929800e+09</td>
      <td>1.338600e+09</td>
      <td>1.322300e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Invested Capital</th>
      <td>9.608700e+09</td>
      <td>4.946700e+09</td>
      <td>1.367100e+09</td>
      <td>1.361800e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>Allowance For Doubtful Accounts Receivable</th>
      <td>-4.200000e+06</td>
      <td>-4.700000e+06</td>
      <td>-4.400000e+06</td>
      <td>-2.200000e+06</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Gross Accounts Receivable</th>
      <td>4.920000e+07</td>
      <td>6.560000e+07</td>
      <td>9.540000e+07</td>
      <td>1.561000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cash Cash Equivalents And Short Term Investments</th>
      <td>9.013800e+09</td>
      <td>4.774900e+09</td>
      <td>1.199300e+09</td>
      <td>1.390600e+09</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Other Short Term Investments</th>
      <td>2.709100e+09</td>
      <td>1.800000e+07</td>
      <td>2.776000e+08</td>
      <td>2.516000e+08</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Cash And Cash Equivalents</th>
      <td>6.304700e+09</td>
      <td>4.756900e+09</td>
      <td>9.217000e+08</td>
      <td>1.139000e+09</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>69 rows × 5 columns</p>
</div>



Using the ticker object to get the share price data


```python
gme_data = gamestop.history(period='max')
```


```python
gme_data.reset_index(inplace=True)
```


```python
gme_data.head()
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
      <th>Date</th>
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2002-02-13 00:00:00-05:00</td>
      <td>1.620128</td>
      <td>1.693350</td>
      <td>1.603296</td>
      <td>1.691666</td>
      <td>76216000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2002-02-14 00:00:00-05:00</td>
      <td>1.712707</td>
      <td>1.716074</td>
      <td>1.670626</td>
      <td>1.683251</td>
      <td>11021600</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2002-02-15 00:00:00-05:00</td>
      <td>1.683251</td>
      <td>1.687459</td>
      <td>1.658002</td>
      <td>1.674834</td>
      <td>8389600</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2002-02-19 00:00:00-05:00</td>
      <td>1.666418</td>
      <td>1.666418</td>
      <td>1.578047</td>
      <td>1.607504</td>
      <td>7410400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2002-02-20 00:00:00-05:00</td>
      <td>1.615921</td>
      <td>1.662210</td>
      <td>1.603296</td>
      <td>1.662210</td>
      <td>6892800</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



## <a id='toc1_7_'></a>[Using Webscraping to extract GameStop Revenue Data](#toc0_)

The webpage is again a macrotrends webpage and so we know from its `robots.txt` file the permitted file paths with our path of `/stocks/charts/` being permitted.


```python
url = 'https://www.macrotrends.net/stocks/charts/GME/gamestop/revenue'
headers = {'User-Agent': 'Mozilla/5.0'}
r = requests.get(url, headers=headers)
```


```python
r.status_code
```




    200




```python
response = r.text
```


```python
gme_soup = BeautifulSoup(response, 'html5lib')
```

This time instead of using BeautifulSoup entirely, we will use pandas `read_html` funciton.

When looking at the macrotrends webpage and using ctrl+f when inspecting element to find the tables, we can see that it is the 2nd out of 38 tables. With Python's 0 based indexing this means it is at index 1.

![GameStop](GameStop_Revenue_Inspect_Element.png)


```python
tables = gme_soup.find_all('table')
gme_revenue = pd.read_html(StringIO(str(tables[1])), flavor='bs4')[0]
gme_revenue.head()
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
      <th>GameStop Quarterly Revenue (Millions of US $)</th>
      <th>GameStop Quarterly Revenue (Millions of US $).1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2026-01-31</td>
      <td>$1,104</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-10-31</td>
      <td>$821</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-07-31</td>
      <td>$972</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-04-30</td>
      <td>$732</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-31</td>
      <td>$1,283</td>
    </tr>
  </tbody>
</table>
</div>



Now lets clean the dataframe


```python
gme_revenue.columns
```




    Index(['GameStop Quarterly Revenue (Millions of US $)', 'GameStop Quarterly Revenue (Millions of US $).1'], dtype='object')




```python
gme_revenue.columns = ['Date', 'Revenue']
gme_revenue.columns
```




    Index(['Date', 'Revenue'], dtype='object')




```python
gme_revenue.head()
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
      <th>Date</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2026-01-31</td>
      <td>$1,104</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-10-31</td>
      <td>$821</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-07-31</td>
      <td>$972</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-04-30</td>
      <td>$732</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-01-31</td>
      <td>$1,283</td>
    </tr>
  </tbody>
</table>
</div>




```python
gme_revenue['Revenue'] = gme_revenue['Revenue'].str.replace(',|\$', "", regex=True)
```

    <>:1: SyntaxWarning: invalid escape sequence '\$'
    <>:1: SyntaxWarning: invalid escape sequence '\$'
    C:\Users\alexa\AppData\Local\Temp\ipykernel_24156\2709528454.py:1: SyntaxWarning: invalid escape sequence '\$'
      gme_revenue['Revenue'] = gme_revenue['Revenue'].str.replace(',|\$', "", regex=True)
    


```python
gme_revenue['Revenue'].dropna(inplace=True)
gme_revenue = gme_revenue[gme_revenue['Revenue'] != ""]
```


```python
gme_revenue.tail()
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
      <th>Date</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>54</th>
      <td>2012-07-31</td>
      <td>1550</td>
    </tr>
    <tr>
      <th>55</th>
      <td>2012-04-30</td>
      <td>2002</td>
    </tr>
    <tr>
      <th>56</th>
      <td>2012-01-31</td>
      <td>3579</td>
    </tr>
    <tr>
      <th>57</th>
      <td>2011-10-31</td>
      <td>1947</td>
    </tr>
    <tr>
      <th>58</th>
      <td>2011-07-31</td>
      <td>1744</td>
    </tr>
  </tbody>
</table>
</div>



## <a id='toc1_8_'></a>[Visualising Stock Graphs](#toc0_)

### <a id='toc1_8_1_'></a>[Helper Function](#toc0_)

This helper function called `make_graph` will take a dataframe with stock market data, a dataframe with stock revenue data and the name of the stock. The dataframe for the stock market data must contain a `Date` and `Close` column, and the dataframe for the stock revenue must contain a `Date` and `Revenue` column.


```python
def make_graph(stock_data, revenue_data, stock):
    stock_data_specific = stock_data[stock_data.Date <= '2021-06-14']
    revenue_data_specific = revenue_data[revenue_data.Date <= '2021-04-30']

    fig, axes = plt.subplots(2, 1, figsize=(12, 8), sharex=True)

    # Stock price
    axes[0].plot(pd.to_datetime(stock_data_specific.Date), stock_data_specific.Close.astype("float"), label="Share Price", color="blue")
    axes[0].set_ylabel("Price ($US)")
    axes[0].set_title(f"{stock} - Historical Share Price")

    # Revenue
    axes[1].plot(pd.to_datetime(revenue_data_specific.Date), revenue_data_specific.Revenue.astype("float"), label="Revenue", color="green")
    axes[1].set_ylabel("Revenue ($US Millions)")
    axes[1].set_xlabel("Date")
    axes[1].set_title(f"{stock} - Historical Revenue")

    plt.tight_layout()
    plt.show()
```

### <a id='toc1_8_2_'></a>[Tesla (TSLA)](#toc0_)


```python
make_graph(tesla_data, tesla_revenue, 'Tesla')
```


    
![png](Extracting%20and%20Visualising%20Stock%20Market%20Data_files/Extracting%20and%20Visualising%20Stock%20Market%20Data_76_0.png)
    


### <a id='toc1_8_3_'></a>[GameStop (GME)](#toc0_)


```python
make_graph(gme_data, gme_revenue, 'GameStop')
```


    
![png](Extracting%20and%20Visualising%20Stock%20Market%20Data_files/Extracting%20and%20Visualising%20Stock%20Market%20Data_78_0.png)
    


Here we can see that for Tesla as the share price increased so did the revenue as well, thereby indicating that the increase in revenue contributed towards the increase in the share price for Tesla. In contrast, for GameStop the share price increased but the revenue was hectic. This was due to redittors on the subreddit WallStreetBets buying huge amounts of Gamestop stock which in turn led to the share price sharply increasing.
