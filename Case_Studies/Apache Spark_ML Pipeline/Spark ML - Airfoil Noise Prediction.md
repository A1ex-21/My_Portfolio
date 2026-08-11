# <a id='toc1_'></a>[Spark ML - Airfoil Noise Prediction](#toc0_)
By Alexander Thompson

**Table of contents**<a id='toc0_'></a>    
- [Spark ML - Airfoil Noise Prediction](#toc1_)    
  - [Business Overview](#toc1_1_)    
  - [Scenario](#toc1_2_)    
  - [Data](#toc1_3_)    
    - [Diagrams](#toc1_3_1_)    
  - [Part 1 - Conduct ETL](#toc1_4_)    
    - [Task 1 - Importing the required libraries](#toc1_4_1_)    
    - [Task 2 - Create a spark session](#toc1_4_2_)    
    - [Task 3 - Load the csv file into a dataframe](#toc1_4_3_)    
    - [Task 4 - Data Cleaning](#toc1_4_4_)    
  - [Part 2 - Creating a Machine Learning Pipeline](#toc1_5_)    
    - [Task 1 - Loading the cleaned parquet data file into a DataFrame](#toc1_5_1_)    
    - [Task 2 - Define the Pipeline Stages](#toc1_5_2_)    
      - [Stage 1 - VectorAssembler](#toc1_5_2_1_)    
      - [Stage 2 - StandardScaler](#toc1_5_2_2_)    
      - [Stage 3 - LinearRegression](#toc1_5_2_3_)    
    - [Task 3 - Build the Pipeline](#toc1_5_3_)    
      - [Splitting the Data](#toc1_5_3_1_)    
      - [Fit the Pipeline](#toc1_5_3_2_)    
  - [Part 3 - Evaluating the Performance of the Model](#toc1_6_)    
    - [Task 1 - Making predictions using the model](#toc1_6_1_)    
    - [Task 2 - Displaying the evaluation metrics](#toc1_6_2_)    
      - [Mean Squared Error](#toc1_6_2_1_)    
      - [Root Mean Squared Error](#toc1_6_2_2_)    
      - [Mean Absolute Error](#toc1_6_2_3_)    
      - [R-Squared](#toc1_6_2_4_)    
      - [Intercept](#toc1_6_2_5_)    
      - [Coefficients](#toc1_6_2_6_)    
  - [Part 4 - Model Persistance](#toc1_7_)    
    - [Task 1 - Save the model to the path "Airfoil_Model"](#toc1_7_1_)    
    - [Task 2 - Load in the saved model](#toc1_7_2_)    
    - [Task 3 - Make predictions](#toc1_7_3_)    
  - [End the Spark Session](#toc1_8_)    
  - [Appendix](#toc1_9_)    
    - [Predictions](#toc1_9_1_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[Business Overview](#toc0_)

In the aeronautics industry, designing aerodynamically efficient and quiet airfoils is critical for both commercial aviation and high-performance automotive engineering. This project supports aeronautical engineers by providing a predictive model to estimate airfoil self-noise levels (in decibels) based on geometric and flow parameters. Therefore, by leveraging **distributed machine learning**, the firm can identify high-noise designs early in the development cycle, thereby significantly reducing the reliance on expensive, time-consuming wind tunnel testing and accelerating the time-to-market for new plane and sports car components.

## <a id='toc1_2_'></a>[Scenario](#toc0_)

You are a data engineer at an aeronautics consulting company. Your company prides itself in being able to efficiently design airfoils for use in planes and sports cars. Data scientists in your office need to work with different algorithms and data in different formats. While they are good at Machine Learning, they count on you to be able to do ETL jobs and build ML pipelines. In this project you will use the modified version of the NASA Airfoil Self Noise dataset. You will clean this dataset, by dropping the duplicate rows, and removing the rows with null values. You will create an ML pipe line to create a model that will predict the SoundLevel based on all the other columns. You will evaluate the model and towards the end you will persist the model.

## <a id='toc1_3_'></a>[Data](#toc0_)

I will be using a modified version of this dataset

- The original dataset can be found here NASA airfoil self noise dataset. https://archive.ics.uci.edu/dataset/291/airfoil+self+noise

This dataset is licensed under a Creative Commons Attribution 4.0 International (CC BY 4.0) license.

### <a id='toc1_3_1_'></a>[Diagrams](#toc0_)

These diagrams can help give some context to the features of the dataset.

**Diagram of an Airfoil**

<img width="651" height="516" alt="Airfoil_with_flow" src="https://github.com/user-attachments/assets/48cac707-7cb1-4c18-ac4f-0d9ac149caeb" />


**Diagram showcasing the Angle of attack**

<img width="800" height="246" alt="Airfoil_angle_of_attack" src="https://github.com/user-attachments/assets/b362317f-d76f-4966-9f25-0a0005409c06" />


## <a id='toc1_4_'></a>[Part 1 - Conduct ETL](#toc0_)

### <a id='toc1_4_1_'></a>[Task 1 - Importing the required libraries](#toc0_)


```python
import findspark
findspark.init()
```


```python
from pyspark.sql import SparkSession
from pyspark.ml.regression import LinearRegression
from pyspark.ml.evaluation import RegressionEvaluator
from pyspark.ml import Pipeline
from pyspark.ml.pipeline import PipelineModel
from pyspark.ml.feature import VectorAssembler, StandardScaler
```

### <a id='toc1_4_2_'></a>[Task 2 - Create a spark session](#toc0_)


```python
#spark = SparkSession.builder.appName("NASA Airfoil Noise Prediction").getOrCreate()
```

**Note:** If the above spark session creation code doesn't work then the code below can be used.


```python
spark = SparkSession.builder.master("local[*]").appName("NASA Airfoil Noise Prediction").config("spark.driver.host", "127.0.0.1").config("spark.driver.bindAddress", "127.0.01").getOrCreate()
```


```python
spark
```





    <div>
        <p><b>SparkSession - in-memory</b></p>

<div>
    <p><b>SparkContext</b></p>

    <p><a href="http://127.0.0.1:4040">Spark UI</a></p>

    <dl>
      <dt>Version</dt>
        <dd><code>v4.2.0</code></dd>
      <dt>Master</dt>
        <dd><code>local[*]</code></dd>
      <dt>AppName</dt>
        <dd><code>NASA Airfoil Noise Prediction</code></dd>
    </dl>
</div>

    </div>




### <a id='toc1_4_3_'></a>[Task 3 - Load the csv file into a dataframe](#toc0_)


```python
df = spark.read.csv("NASA_airfoil_noise_raw.csv", header=True, inferSchema=True)
```


```python
df.show(5)
```

    +---------+-------------+-----------+------------------+-----------------------+----------+
    |Frequency|AngleOfAttack|ChordLength|FreeStreamVelocity|SuctionSideDisplacement|SoundLevel|
    +---------+-------------+-----------+------------------+-----------------------+----------+
    |      800|          0.0|     0.3048|              71.3|             0.00266337|   126.201|
    |     1000|          0.0|     0.3048|              71.3|             0.00266337|   125.201|
    |     1250|          0.0|     0.3048|              71.3|             0.00266337|   125.951|
    |     1600|          0.0|     0.3048|              71.3|             0.00266337|   127.591|
    |     2000|          0.0|     0.3048|              71.3|             0.00266337|   127.461|
    +---------+-------------+-----------+------------------+-----------------------+----------+
    only showing top 5 rows
    

### <a id='toc1_4_4_'></a>[Task 4 - Data Cleaning](#toc0_)

**Original Row count**


```python
print(df.count())
```

    1522
    

**Removing Duplicates**


```python
df = df.dropDuplicates()
```


```python
print(df.count())
```

    1503
    

**Removing Null Values**


```python
df = df.dropna()
```


```python
print(df.count())
```

    1499
    

**Renaming the column `SoundLevel` to `SoundLevelDecibels`**


```python
df = df.withColumnRenamed("SoundLevel", "SoundLevelDecibels")
```

**Exporting the cleaned data**


```python
df.write.mode("overwrite").parquet("NASA_airfoil_noise_cleaned.parquet")
```

## <a id='toc1_5_'></a>[Part 2 - Creating a Machine Learning Pipeline](#toc0_)

### <a id='toc1_5_1_'></a>[Task 1 - Loading the cleaned parquet data file into a DataFrame](#toc0_)


```python
df = spark.read.parquet("NASA_airfoil_noise_cleaned.parquet")
```

### <a id='toc1_5_2_'></a>[Task 2 - Define the Pipeline Stages](#toc0_)

#### <a id='toc1_5_2_1_'></a>[Stage 1 - VectorAssembler](#toc0_)

Assemble the input columns into a single column `features`


```python
assembler = VectorAssembler(inputCols=["Frequency", "AngleOfAttack", "ChordLength", "FreeStreamVelocity", "SuctionSideDisplacement"],
                            outputCol="features")
```

#### <a id='toc1_5_2_2_'></a>[Stage 2 - StandardScaler](#toc0_)

Scale the `features` using the `StandardScaler` and store them in a `scaledFeatures` column


```python
scaler = StandardScaler(inputCol="features", outputCol="scaledFeatures")
```

#### <a id='toc1_5_2_3_'></a>[Stage 3 - LinearRegression](#toc0_)

Instantiate the `LinearRegression` stage to predict `SoundLevelDecibels`


```python
lr = LinearRegression(labelCol="SoundLevelDecibels", featuresCol="scaledFeatures")
```

### <a id='toc1_5_3_'></a>[Task 3 - Build the Pipeline](#toc0_)


```python
pipeline = Pipeline(stages=[assembler, scaler, lr])
```

#### <a id='toc1_5_3_1_'></a>[Splitting the Data](#toc0_)


```python
(trainingData, testingData) = df.randomSplit([0.7, 0.3], seed=42)
```

#### <a id='toc1_5_3_2_'></a>[Fit the Pipeline](#toc0_)


```python
model = pipeline.fit(trainingData)
```

## <a id='toc1_6_'></a>[Part 3 - Evaluating the Performance of the Model](#toc0_)

### <a id='toc1_6_1_'></a>[Task 1 - Making predictions using the model](#toc0_)


```python
predictions = model.transform(testingData)
```

### <a id='toc1_6_2_'></a>[Task 2 - Displaying the evaluation metrics](#toc0_)

#### <a id='toc1_6_2_1_'></a>[Mean Squared Error](#toc0_)


```python
evaluator = RegressionEvaluator(labelCol="SoundLevelDecibels", predictionCol="prediction", metricName="mse")
mse = evaluator.evaluate(predictions)
print(f"Mean Squared Error:", mse)
```

    Mean Squared Error: 24.99766625502418
    

#### <a id='toc1_6_2_2_'></a>[Root Mean Squared Error](#toc0_)


```python
evaluator = RegressionEvaluator(labelCol="SoundLevelDecibels", predictionCol="prediction", metricName="rmse")
rmse = evaluator.evaluate(predictions)
print(f"Root Mean Squared Error:", rmse)
```

    Root Mean Squared Error: 4.999766620055798
    

#### <a id='toc1_6_2_3_'></a>[Mean Absolute Error](#toc0_)


```python
evaluator = RegressionEvaluator(labelCol="SoundLevelDecibels", predictionCol="prediction", metricName="mae")
mae = evaluator.evaluate(predictions)
print(f"Mean Absolute Error:", mae)
```

    Mean Absolute Error: 3.9136790958812044
    

#### <a id='toc1_6_2_4_'></a>[R-Squared](#toc0_)


```python
evaluator = RegressionEvaluator(labelCol="SoundLevelDecibels", predictionCol="prediction", metricName="r2")
r2 = evaluator.evaluate(predictions)
print(f"R-Squared:", r2)
```

    R-Squared: 0.4959688408974623
    

#### <a id='toc1_6_2_5_'></a>[Intercept](#toc0_)


```python
regModel = model.stages[-1]
intercept = regModel.intercept
print("Intercept:", round(intercept, 2))
```

    Intercept: 132.88
    

#### <a id='toc1_6_2_6_'></a>[Coefficients](#toc0_)


```python
inputColumns = model.stages[0].getInputCols()
for i, j in zip(inputColumns, regModel.coefficients):
    print(f"Coefficient for {i} = {round(j, 4)}")
```

    Coefficient for Frequency = -3.9906
    Coefficient for AngleOfAttack = -2.2881
    Coefficient for ChordLength = -3.3269
    Coefficient for FreeStreamVelocity = 1.4832
    Coefficient for SuctionSideDisplacement = -2.0551
    

## <a id='toc1_7_'></a>[Part 4 - Model Persistance](#toc0_)

### <a id='toc1_7_1_'></a>[Task 1 - Save the model to the path "Airfoil_Model"](#toc0_)


```python
!mkdir Airfoil_Model

model.write().overwrite().save("./Airfoil_Model/")
```

    A subdirectory or file Airfoil_Model already exists.
    

### <a id='toc1_7_2_'></a>[Task 2 - Load in the saved model](#toc0_)


```python
LoadedPipelineModel = PipelineModel.load("./Airfoil_Model/")
```

### <a id='toc1_7_3_'></a>[Task 3 - Make predictions](#toc0_)


```python
predictions = LoadedPipelineModel.transform(testingData)
```


```python
predictions.select("SoundLevelDecibels", "prediction").show()
```

    +------------------+------------------+
    |SoundLevelDecibels|        prediction|
    +------------------+------------------+
    |           128.679|122.59722914376778|
    |            133.42|127.37968204568838|
    |           119.146|130.34077425074506|
    |           116.074|131.11016975113537|
    |           134.319|127.12627360125096|
    |            125.01|127.89456373905155|
    |           125.941|131.06220981224084|
    |           130.588|125.73739953848445|
    |           128.354|121.53249832197925|
    |           121.783|124.20059665619313|
    |            122.94|125.87997778533571|
    |           116.146|125.24362112904095|
    |           114.044|126.06429872612995|
    |           109.951|127.67830278943778|
    |           125.974|121.25022147564815|
    |           116.066|123.31966959832609|
    |           118.595|124.20046348885936|
    |           126.395| 126.1606883964179|
    |           130.089|122.53378592206057|
    |           131.889|123.42922049990014|
    +------------------+------------------+
    only showing top 20 rows
    

## <a id='toc1_8_'></a>[End the Spark Session](#toc0_)


```python
spark.stop()
```

## <a id='toc1_9_'></a>[Appendix](#toc0_)

### <a id='toc1_9_1_'></a>[Predictions](#toc0_)


```python
predictions = predictions.select("SoundLevelDecibels", "prediction")
predictions.show(5)
```

    +------------------+------------------+
    |SoundLevelDecibels|        prediction|
    +------------------+------------------+
    |           128.679|122.59722914376778|
    |            133.42|127.37968204568838|
    |           119.146|130.34077425074506|
    |           116.074|131.11016975113537|
    |           134.319|127.12627360125096|
    +------------------+------------------+
    only showing top 5 rows
    

**Parquet**


```python
predictions.write.mode("overwrite").parquet("NASA_Airfoil_Noise_Predictions.parquet")
```

**CSV**


```python
predictions.write.mode("overwrite").csv("NASA_Airfoil_Noise_Predictions.csv", header=True)
```
