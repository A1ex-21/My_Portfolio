# <a id='toc1_'></a>[Web Scraping for NVIDIA and Intel](#toc0_)
*Alexander Thompson, B.S.c*

**Table of contents**<a id='toc0_'></a>    
- [Web Scraping for NVIDIA and Intel](#toc1_)    
  - [NVIDIA](#toc1_1_)    
    - [NVIDIA Revenue](#toc1_1_1_)    
    - [NVIDIA Share Price](#toc1_1_2_)    
  - [Intel](#toc1_2_)    
    - [Intel Share Price](#toc1_2_1_)    
    - [Intel's Revenue](#toc1_2_2_)    
  - [Intel and NVIDIA Revenue](#toc1_3_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

This is the data collection for the NVIDIA data for my case study as part of my presentation to Grayce.

## <a id='toc1_1_'></a>[NVIDIA](#toc0_)

### <a id='toc1_1_1_'></a>[NVIDIA Revenue](#toc0_)

The first thing to do is to collect the Revenue data for NVIDIA to display the effects of the AI Boom.

For this, we will use the Macrotrends website, and have a look at thier rules to webscraping.

This can be found in their `/robots.txt` endpoint.

![Robots.txt](Robots.png)

Here we can see what URL paths are not allowed for web scraping.

We are okay as URL begins with `stocks/charts/` and so we can proceed


```python
import pandas as pd
import requests
from bs4 import BeautifulSoup
import yfinance as yf
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.graph_objects as go
import datetime
```

Lets send a GET request to the website.


```python
url = 'https://www.macrotrends.net/stocks/charts/NVDA/nvidia/revenue'
headers = {"User-Agent": "Mozilla/5.0"}
r = requests.get(url, headers=headers)
```

Let's check to see if the request was successful


```python
r.status_code
```




    200



It was and we can no proceed to parse the HTML Data using BeautifulSoup


```python
data = r.text
nvidia_rev = BeautifulSoup(data, 'html5lib')
```

Now lets locate where our Revenue data is on the webpage, we will go on the webpage and using inspect element, find the appropriate table.

Here we use ctrl+f to search for the word table, we find that the quarterly revenue table for NVIDIA is the 2nd table out of 36 in the search list. Python has 0 based indexing and so this will be at index 1 in the `nvidia_rev` Soup Object.

![NVIDIA](NVIDIA_Inspect_Element.png)


```python
table = nvidia_rev.find_all('tbody')[1]
```


```python
nvidia_revenue = pd.DataFrame(columns=['Date', 'Revenue'])
```


```python
for row in table.find_all('tr'):
    col = row.find_all('td')
    date = col[0].text
    revenue = col[1].text
    nvidia_revenue = pd.concat([nvidia_revenue, pd.DataFrame({'Date': [date],
                                                              'Revenue': [revenue]}
                                                              )], ignore_index=True)
```


```python
nvidia_revenue.head(5)
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
      <td>2026-04-30</td>
      <td>$81,615</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2026-01-31</td>
      <td>$68,127</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-10-31</td>
      <td>$57,006</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-07-31</td>
      <td>$46,743</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-04-30</td>
      <td>$44,062</td>
    </tr>
  </tbody>
</table>
</div>



Lets clean the data so it is ready for analysis


```python
nvidia_revenue['Revenue'] = nvidia_revenue['Revenue'].str.replace(',|\$', "", regex=True)
```


```python
nvidia_revenue.dropna(inplace=True)
nvidia_revenue = nvidia_revenue[nvidia_revenue['Revenue'] != ""]
```


```python
nvidia_revenue.head()
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
      <td>2026-04-30</td>
      <td>81615</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2026-01-31</td>
      <td>68127</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-10-31</td>
      <td>57006</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-07-31</td>
      <td>46743</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-04-30</td>
      <td>44062</td>
    </tr>
  </tbody>
</table>
</div>




```python
nvidia_revenue['Date'] = pd.to_datetime(nvidia_revenue['Date'])
```


```python
nvidia_revenue['Date_Q'] = nvidia_revenue['Date'].dt.to_period('Q').dt.strftime('%Y-Q%q')
```


```python
nvidia_revenue['Revenue'] = nvidia_revenue['Revenue'].astype(float)
```


```python
nvidia_revenue.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 60 entries, 0 to 59
    Data columns (total 3 columns):
     #   Column   Non-Null Count  Dtype         
    ---  ------   --------------  -----         
     0   Date     60 non-null     datetime64[ns]
     1   Revenue  60 non-null     object        
     2   Date_Q   60 non-null     object        
    dtypes: datetime64[ns](1), object(2)
    memory usage: 1.5+ KB
    


```python
nvidia_revenue = nvidia_revenue.sort_values(by=['Date'], ascending=True)
nvidia_revenue.head()
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
      <th>Date_Q</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>59</th>
      <td>2011-07-31</td>
      <td>1017.0</td>
      <td>2011-Q3</td>
    </tr>
    <tr>
      <th>58</th>
      <td>2011-10-31</td>
      <td>1066.0</td>
      <td>2011-Q4</td>
    </tr>
    <tr>
      <th>57</th>
      <td>2012-01-31</td>
      <td>953.0</td>
      <td>2012-Q1</td>
    </tr>
    <tr>
      <th>56</th>
      <td>2012-04-30</td>
      <td>925.0</td>
      <td>2012-Q2</td>
    </tr>
    <tr>
      <th>55</th>
      <td>2012-07-31</td>
      <td>1044.0</td>
      <td>2012-Q3</td>
    </tr>
  </tbody>
</table>
</div>




```python
plt.plot(nvidia_revenue['Date_Q'], nvidia_revenue['Revenue'])
plt.axvline(x='2023-Q2', color='red', linestyle="--", linewidth=2, label="The AI Boom")
plt.title("NVIDIA Quarterly Revenue")
plt.xlabel("Date")
plt.ylabel("Revenue ($M)")
plt.xticks(ticks=nvidia_revenue['Date_Q'][::4], labels=nvidia_revenue['Date_Q'][::4], rotation=45)
plt.figtext(0.55, -0.05, "Source: Macrotrends", ha="center", fontsize=10)
plt.tight_layout()
plt.legend()
plt.show()
```


    
![png](NVIDIA_files/NVIDIA_32_0.png)
    



```python
nvidia_revenue.to_csv("NVIDIA Revenue.csv", index=False)
```

### <a id='toc1_1_2_'></a>[NVIDIA Share Price](#toc0_)

Here we will use the yfinance api to get the share price for NVIDIA.


```python
nvidia = yf.Ticker("NVDA")
```

We can see the highest share price of NVIDIA today.


```python
nvidia.info['dayHigh']
```




    232.28



We can also see NVIDIA's 5 Trillion Dollar Valuation


```python
nvidia.info['marketCap']
```




    5396923154432



We will use the `.history()` method to extract the stock price data for NVIDIA.


```python
nvidia_price = nvidia.history(period='3mo')
```


```python
nvidia_price.head()
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
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
    <tr>
      <th>Date</th>
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
      <th>2026-03-03 00:00:00-05:00</th>
      <td>178.480340</td>
      <td>180.890198</td>
      <td>176.910417</td>
      <td>180.040253</td>
      <td>178099400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-04 00:00:00-05:00</th>
      <td>180.430240</td>
      <td>184.690004</td>
      <td>180.050256</td>
      <td>183.030090</td>
      <td>177731200</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-05 00:00:00-05:00</th>
      <td>181.160197</td>
      <td>184.050040</td>
      <td>177.870382</td>
      <td>183.330078</td>
      <td>198779700</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-06 00:00:00-05:00</th>
      <td>179.830259</td>
      <td>182.750099</td>
      <td>176.810433</td>
      <td>177.810379</td>
      <td>189021900</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-09 00:00:00-04:00</th>
      <td>176.820429</td>
      <td>182.900102</td>
      <td>175.550494</td>
      <td>182.640106</td>
      <td>177213600</td>
      <td>0.0</td>
      <td>0.0</td>
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
    </tr>
    <tr>
      <th>2026-05-27 00:00:00-04:00</th>
      <td>214.119995</td>
      <td>214.149994</td>
      <td>208.779999</td>
      <td>212.600006</td>
      <td>167601200</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-28 00:00:00-04:00</th>
      <td>211.279999</td>
      <td>215.520004</td>
      <td>211.220001</td>
      <td>214.250000</td>
      <td>143996000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-29 00:00:00-04:00</th>
      <td>214.580002</td>
      <td>217.860001</td>
      <td>211.130005</td>
      <td>211.139999</td>
      <td>289410600</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-01 00:00:00-04:00</th>
      <td>215.729996</td>
      <td>224.869995</td>
      <td>215.699997</td>
      <td>224.360001</td>
      <td>212850700</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-02 00:00:00-04:00</th>
      <td>227.179993</td>
      <td>232.279999</td>
      <td>221.350006</td>
      <td>222.820007</td>
      <td>164860193</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
<p>64 rows × 7 columns</p>
</div>



We will filter the dataset to go up to the 1st of June 2026.

This is due to the announcement made at the NVIDIA GTC in Taipei, where NVIDIA showcased the RTX Spark.


```python
nvidia_price = nvidia_price[nvidia_price.index <= '2026-06-01']
nvidia_price.tail()
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
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
    <tr>
      <th>Date</th>
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
      <th>2026-05-26 00:00:00-04:00</th>
      <td>216.539993</td>
      <td>218.179993</td>
      <td>212.000000</td>
      <td>214.860001</td>
      <td>187202600</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-27 00:00:00-04:00</th>
      <td>214.119995</td>
      <td>214.149994</td>
      <td>208.779999</td>
      <td>212.600006</td>
      <td>167601200</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-28 00:00:00-04:00</th>
      <td>211.279999</td>
      <td>215.520004</td>
      <td>211.220001</td>
      <td>214.250000</td>
      <td>143996000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-29 00:00:00-04:00</th>
      <td>214.580002</td>
      <td>217.860001</td>
      <td>211.130005</td>
      <td>211.139999</td>
      <td>289410600</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-01 00:00:00-04:00</th>
      <td>215.729996</td>
      <td>224.869995</td>
      <td>215.699997</td>
      <td>224.360001</td>
      <td>212850700</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Now lets visualise this.

We will use plotly to make candlestick charts of the share price for NVIDIA.


```python
fig = go.Figure(data=[go.Candlestick(x=nvidia_price.index,
                                     open=nvidia_price['Open'],
                                     close=nvidia_price['Close'],
                                     high=nvidia_price['High'],
                                     low=nvidia_price['Low'])
                                     ])
fig.update_layout(title="NVIDIA Stock Price",
                  xaxis_title="Date",
                  yaxis_title="Price ($)",
                  xaxis_rangeslider_visible=False)
fig.show()
```




```python
latest_date = nvidia_price.index[-1]
latest_close = nvidia_price['Close'].iloc[-1]
previous_close = nvidia_price['Close'].iloc[-2]
price_change = latest_close - previous_close
percent_change = (price_change/previous_close)*100

fig = go.Figure(data=[go.Candlestick(x=nvidia_price.index,
                                     open=nvidia_price['Open'],
                                     close=nvidia_price['Close'],
                                     high=nvidia_price['High'],
                                     low=nvidia_price['Low'],
                                     name="NVDA")
                                     ])
# Adding the Horizontal Line at the latest closing price
fig.add_hline(y=latest_close,
              line_dash="dash",
              line_color="red",
              annotation_text=f"Latest Close: ${latest_close:.2f}",
              annotation_position="top")
# Adding the Arrow Annotation
fig.add_annotation(x=latest_date,
                   y=latest_close,
                   text=f"${latest_close:.2f}<br>{percent_change:+.2f}%",
                   showarrow=True,
                   arrowhead=2,
                   ax=-60,
                   ay=-40,
                   bgcolor="black",
                   bordercolor="red",
                   borderwidth=1,
                   font=dict(size=12))
# Adding the caption
fig.add_annotation(text="Source: Yahoo Finance via the yfinance API. NVIDIA share price shown over a 3-month period using daily OHLC data.",
                   xref="paper",
                   yref="paper",
                   x=0,
                   y=-0.28,
                   showarrow=False,
                   font=dict(size=11),
                   align="left")

# Hide weekends with range breaks
fig.update_xaxes(rangebreaks=[dict(bounds=['sat', 'mon'])])

fig.update_layout(title="NVIDIA Share Price",
                  xaxis_title="Date",
                  yaxis_title="Price ($)",
                  xaxis_rangeslider_visible=False,
                  template="plotly_dark")
fig.show()
```




```python
nvidia_price.to_csv("NVIDIA Share Price 3 Months.csv", index=False)
```

## <a id='toc1_2_'></a>[Intel](#toc0_)

### <a id='toc1_2_1_'></a>[Intel Share Price](#toc0_)

We will now get the share price for Intel, to display the effects of the NVIDIA GTC announcement of the RGX Spark chip.


```python
intel = yf.Ticker("INTC")
```

Let's see Intel's Market valuation.


```python
intel.info['marketCap']
```




    542456152064



Lets get the share price over the past 3 months


```python
intel_price = intel.history(period="3mo")
```


```python
intel_price.tail()
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
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
    <tr>
      <th>Date</th>
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
      <th>2026-05-27 00:00:00-04:00</th>
      <td>124.389999</td>
      <td>125.269997</td>
      <td>117.000000</td>
      <td>121.769997</td>
      <td>93323300</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-28 00:00:00-04:00</th>
      <td>121.449997</td>
      <td>123.080002</td>
      <td>116.309998</td>
      <td>120.889999</td>
      <td>97321000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-29 00:00:00-04:00</th>
      <td>123.849998</td>
      <td>126.639999</td>
      <td>113.540001</td>
      <td>114.680000</td>
      <td>191676100</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-01 00:00:00-04:00</th>
      <td>109.430000</td>
      <td>113.300003</td>
      <td>106.330002</td>
      <td>109.330002</td>
      <td>134900400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-02 00:00:00-04:00</th>
      <td>107.425003</td>
      <td>109.000000</td>
      <td>104.169998</td>
      <td>107.930000</td>
      <td>104474192</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



When visualising the share price, we want to visualise the percentage change for the 1st June 2026, and so we will eliminate 2nd June 2026 from our data.


```python
intel_price.columns
```




    Index(['Open', 'High', 'Low', 'Close', 'Volume', 'Dividends', 'Stock Splits'], dtype='object')




```python
intel_price = intel_price[intel_price.index <= '2026-06-01']
intel_price.tail()
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
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
    <tr>
      <th>Date</th>
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
      <th>2026-05-26 00:00:00-04:00</th>
      <td>122.099998</td>
      <td>125.620003</td>
      <td>117.349998</td>
      <td>123.519997</td>
      <td>108167300</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-27 00:00:00-04:00</th>
      <td>124.389999</td>
      <td>125.269997</td>
      <td>117.000000</td>
      <td>121.769997</td>
      <td>93323300</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-28 00:00:00-04:00</th>
      <td>121.449997</td>
      <td>123.080002</td>
      <td>116.309998</td>
      <td>120.889999</td>
      <td>97321000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-05-29 00:00:00-04:00</th>
      <td>123.849998</td>
      <td>126.639999</td>
      <td>113.540001</td>
      <td>114.680000</td>
      <td>191676100</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-06-01 00:00:00-04:00</th>
      <td>109.430000</td>
      <td>113.300003</td>
      <td>106.330002</td>
      <td>109.330002</td>
      <td>134900400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
intel_price.head()
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
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
      <th>Dividends</th>
      <th>Stock Splits</th>
    </tr>
    <tr>
      <th>Date</th>
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
      <th>2026-03-03 00:00:00-05:00</th>
      <td>43.439999</td>
      <td>43.689999</td>
      <td>42.139999</td>
      <td>43.099998</td>
      <td>83971000</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-04 00:00:00-05:00</th>
      <td>44.070000</td>
      <td>46.130001</td>
      <td>43.270000</td>
      <td>45.580002</td>
      <td>96628100</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-05 00:00:00-05:00</th>
      <td>44.869999</td>
      <td>46.480000</td>
      <td>44.700001</td>
      <td>45.950001</td>
      <td>78229400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-06 00:00:00-05:00</th>
      <td>44.669998</td>
      <td>45.180000</td>
      <td>43.279999</td>
      <td>43.419998</td>
      <td>74698300</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2026-03-09 00:00:00-04:00</th>
      <td>42.740002</td>
      <td>45.759998</td>
      <td>41.639999</td>
      <td>45.580002</td>
      <td>82937400</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Lets visualise this as a candlestick chart.


```python
latest_date = intel_price.index[-1]
latest_close = intel_price['Close'].iloc[-1]
previous_close = intel_price['Close'].iloc[-2]
price_change = latest_close - previous_close
percent_change = (price_change/previous_close)*100
```


```python
fig = go.Figure(data=[go.Candlestick(x=intel_price.index,
                                     open=intel_price['Open'],
                                     close=intel_price['Close'],
                                     high=intel_price['High'],
                                     low=intel_price['Low'],
                                     name='INTC')
                                     ])

# Horizontal Line
fig.add_hline(y=latest_close,
              line_dash="dash",
              line_color="red",
              annotation_text=f"Latest Close: ${latest_close:.2f}",
              annotation_position="top")

# Arrow Annotation
fig.add_annotation(x=latest_date,
                   y=latest_close,
                   text=f"${latest_close:.2f}<br>{percent_change:+.1f}%",
                   showarrow=True,
                   arrowhead=2,
                   ax=-60,
                   ay=40,
                   bgcolor="black",
                   bordercolor="red",
                   borderwidth=1,
                   font=dict(size=12))

# Caption
fig.add_annotation(text="Source: Yahoo Finance via the yfinance API. Intel share price shown over a 3-month period using daily OHLC data.",
                   xref="paper",
                   yref="paper",
                   x=0,
                   y=-0.28,
                   showarrow=False,
                   font=dict(size=11),
                   align="left")

# Hiding the weekends
fig.update_xaxes(rangebreaks=[dict(bounds=['sat', 'mon'])])

# Layout
fig.update_layout(title="Intel Share Price",
                  xaxis_title="Date",
                  yaxis_title="Price ($)",
                  xaxis_rangeslider_visible=False,
                  template="plotly_dark")

fig.show()
```




```python
intel_price.to_csv("Intel Share Price 3 Months.csv", index=False)
```

### <a id='toc1_2_2_'></a>[Intel's Revenue](#toc0_)

We will now use web scraping to obtain Intel's quarterly revenue.

Because we will be using Macrotrends again, we already know the permisions needed for their web scraping `robots.txt`


```python
url = 'https://www.macrotrends.net/stocks/charts/INTC/intel/revenue'
header = {"User-Agent":"Mozilla/5.0"}
r = requests.get(url, headers=header)
```


```python
r.status_code
```




    200




```python
response = r.text
```


```python
intel_rev = BeautifulSoup(response, 'html5lib')
```

When looking on the Intel Revenue Macrotrends website, using ctrl+f and searching for table we can see that our quarterly revenue table is 2nd out of 16 in the list.

![intel](../Grayce/Intel%20Inspect%20Element.png)

Now lets parse the data into a dataframe


```python
table = intel_rev.find_all('tbody')[1]
```


```python
intel_revenue = pd.DataFrame(columns=['Date', 'Revenue'])
```


```python
for row in table.find_all('tr'):
    col = row.find_all('td')
    date = col[0].text
    revenue = col[1].text
    intel_revenue = pd.concat([intel_revenue, pd.DataFrame({'Date': [date],
                                                            'Revenue': [revenue]}
                                                            )], ignore_index=True)
```


```python
intel_revenue.head()
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
      <td>$13,577</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-12-31</td>
      <td>$13,674</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-09-30</td>
      <td>$13,653</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-06-30</td>
      <td>$12,859</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-03-31</td>
      <td>$12,667</td>
    </tr>
  </tbody>
</table>
</div>



Lets clean and prepare the data for analysis.


```python
intel_revenue['Revenue'] = intel_revenue['Revenue'].str.replace(',|\$', "", regex=True)
```


```python
intel_revenue.isna().sum()
```




    Date       0
    Revenue    0
    dtype: int64




```python
intel_revenue = intel_revenue[intel_revenue['Revenue'] != ""]
```


```python
intel_revenue['Date'] = pd.to_datetime(intel_revenue['Date'])
```


```python
intel_revenue['Date_Q'] = intel_revenue['Date'].dt.to_period('Q').dt.strftime('%Y-Q%q')
```


```python
intel_revenue.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 60 entries, 0 to 59
    Data columns (total 2 columns):
     #   Column   Non-Null Count  Dtype 
    ---  ------   --------------  ----- 
     0   Date     60 non-null     object
     1   Revenue  60 non-null     object
    dtypes: object(2)
    memory usage: 1.1+ KB
    

Let's convert the `Date` column into datetime


```python
intel_revenue.head()
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
      <th>Date_Q</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2026-03-31</td>
      <td>13577</td>
      <td>2026-Q1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2025-12-31</td>
      <td>13674</td>
      <td>2025-Q4</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2025-09-30</td>
      <td>13653</td>
      <td>2025-Q3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2025-06-30</td>
      <td>12859</td>
      <td>2025-Q2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2025-03-31</td>
      <td>12667</td>
      <td>2025-Q1</td>
    </tr>
  </tbody>
</table>
</div>




```python
intel_revenue['Revenue'] = intel_revenue['Revenue'].astype(float)
intel_revenue = intel_revenue.sort_values(by=['Date'], ascending=True)
intel_revenue = intel_revenue.reset_index(drop=True)
intel_revenue.head()
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
      <th>Date_Q</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2011-06-30</td>
      <td>13032.0</td>
      <td>2011-Q2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2011-09-30</td>
      <td>14233.0</td>
      <td>2011-Q3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2011-12-31</td>
      <td>13887.0</td>
      <td>2011-Q4</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2012-03-31</td>
      <td>12906.0</td>
      <td>2012-Q1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2012-06-30</td>
      <td>13501.0</td>
      <td>2012-Q2</td>
    </tr>
  </tbody>
</table>
</div>



Now let's visualise it


```python
plt.plot(intel_revenue['Date_Q'], intel_revenue['Revenue'])
plt.title("Intel Quarterly Revenue")
plt.xlabel("Date")
plt.ylabel("Revenue ($M)")
plt.axvline(x='2023-Q2', color='red', linestyle="--", linewidth=2, label="The AI Boom")
plt.xticks(ticks=intel_revenue['Date_Q'][::4],
           labels=intel_revenue['Date_Q'][::4],
           rotation=45)
plt.figtext(0.55, -0.05, "Source: Macrotrends", ha="center", fontsize=10)
plt.tight_layout()
plt.legend()
plt.show()
```


    
![png](NVIDIA_files/NVIDIA_93_0.png)
    



```python
intel_revenue.to_csv("Intel Revenue.csv", index=False)
```

## <a id='toc1_3_'></a>[Intel and NVIDIA Revenue](#toc0_)

Here, we will visualise the quarterly revenue of both NVIDIA and Intel to show how NVIDIA adapted their technology to the market and innovated compared to Intel who failed to adapt and invest in AI acceleration.


```python
plt.figure(figsize=(12,6))

# NVIDIA
plt.plot(nvidia_revenue['Date_Q'], nvidia_revenue['Revenue'], label="NVIDIA")

# Intel
plt.plot(intel_revenue['Date_Q'], intel_revenue['Revenue'], label="Intel")

plt.title("NVIDIA vs. Intel Quarterly Revenue")
plt.xlabel("Date")
plt.ylabel("Revenue ($M)")
plt.xticks(ticks=nvidia_revenue['Date_Q'][::4],
           labels=nvidia_revenue['Date_Q'][::4],
           rotation=45,
           ha="right")
plt.legend()
plt.tight_layout()
plt.show()
```


    
![png](NVIDIA_files/NVIDIA_97_0.png)
    


This didn't turn out as planned as Intel's revenue is skewed here. Therefore, we will try using Seaborn instead of Matplotlib.


```python
plt.figure(figsize=(12,6))
sns.lineplot(data=nvidia_revenue, x='Date_Q', y='Revenue', label='NVIDIA')
sns.lineplot(data=intel_revenue, x='Date_Q', y='Revenue', label='Intel')
plt.title("NVIDIA vs. Intel Quarterly Revenue")
plt.xlabel("Date")
plt.ylabel("Revenue ($M)")
plt.xticks(ticks=range(0, len(nvidia_revenue['Date_Q']), 4),
           labels=nvidia_revenue['Date_Q'][::4],
           rotation=45,
           ha='right')
plt.axvline(x='2023-Q2', color='red', linestyle="--", linewidth=2, label="The AI Boom")
plt.figtext(0.53, -0.05, "Source: Macrotrends", ha="center", fontsize=10)
plt.legend()
plt.tight_layout()
plt.show()
```


    
![png](NVIDIA_files/NVIDIA_99_0.png)
    


Here we can see the significant difference between NVIDIA and Intel's quarterly revenue, with the AI Boom's effect on both companies.

NVIDIA's revenue accelerated sharply after the AI Boom, driven by early investment in GPUs, AI infrastructure and data centre computing.

Intel's revenue however remained comparatively flat and stagnant, thereby highlighting the impact of slower adaption and innovation to AI, GPUs and Accelerated Computing.

This therefore showcases the effects of adaptation to market behaviour and emerging technologies even for companies who have traditionally dominated the market.
