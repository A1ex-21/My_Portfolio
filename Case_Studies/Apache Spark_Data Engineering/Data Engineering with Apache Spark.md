# <a id='toc1_'></a>[Data Engineering with Apache Spark](#toc0_)

**Alexander Thompson, B.S.c (Hons)**

**Table of contents**<a id='toc0_'></a>    
- [Data Engineering with Apache Spark](#toc1_)    
  - [Introduction](#toc1_1_)    
  - [Scenario](#toc1_2_)    
  - [Tasks](#toc1_3_)    
    - [Task 1: Generate a Spark DataFrame from the CSV data](#toc1_3_1_)    
    - [Task 2: Define a schema for the data](#toc1_3_2_)    
    - [Task 3: Display schema of DataFrame](#toc1_3_3_)    
    - [Task 4: Create a temporary view](#toc1_3_4_)    
    - [Task 5: Execute an SQL query](#toc1_3_5_)    
    - [Task 6: Calculate Average Salary by Department](#toc1_3_6_)    
    - [Task 7: Filter and Display IT Department Employees](#toc1_3_7_)    
    - [Task 8: Add 10% Bonus to Salaries](#toc1_3_8_)    
    - [Task 9: Find Maximum Salary by Age](#toc1_3_9_)    
    - [Task 10: Self-Join on Employee Data](#toc1_3_10_)    
    - [Task 11: Calculate Average Employee Age](#toc1_3_11_)    
    - [Task 12: Calculate Total Salary by Department](#toc1_3_12_)    
    - [Task 13: Sort Data by Age and Salary](#toc1_3_13_)    
    - [Task 14: Count Employees in Each Department](#toc1_3_14_)    
    - [Task 15: Filter Employees with the letter o in the Name](#toc1_3_15_)    
    - [Exporting to HDFS](#toc1_3_16_)    
      - [CSV](#toc1_3_16_1_)    
      - [Parquet](#toc1_3_16_2_)    
    - [Stopping the Spark Session](#toc1_3_17_)    
  - [Business Use Case](#toc1_4_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[Introduction](#toc0_)

This is the final project from the certificate **Introduction to Big Data with Spark and Hadoop** by IBM via Coursera. This certificate focused on the role that Big Data plays in our modern world and the vast needs to store and process this data. The Big Data Framework Hadoop was taught and its ecosystem explored, with the use of HIVE, HDFS, MapReduce and more. The shining star of Big Data analytics processing, was Apache Spark, with its architecture, configuration, RDDs and DataFrames.

This project focuses on mastering Spark SQL, a powerful component of Apache Spark that allows you to work with structured data using SQL-like queries. There will also be a focus on Spark DataFrames in addition to Spark SQL with a focus on data aggregation.

## <a id='toc1_2_'></a>[Scenario](#toc0_)

You have been asked by the HR department of a company to create a data pipeline that can take in employee data in csv format. Your responsibilities include analysing the data, applying any required transformations and facilitating the extraction of valuable insights from the processed data.


```python
import findspark
findspark.init()
```


```python
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, ByteType
from pyspark.sql.functions import col, max, avg, sum, count
```


```python
sc = SparkContext().getOrCreate()

spark = SparkSession \
        .builder \
        .appName("Data Engineering with Apache Spark") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()
```


```python
spark
```





    <div>
        <p><b>SparkSession - in-memory</b></p>

<div>
    <p><b>SparkContext</b></p>

    <p><a href="http://host.docker.internal:4040">Spark UI</a></p>

    <dl>
      <dt>Version</dt>
        <dd><code>v4.1.2</code></dd>
      <dt>Master</dt>
        <dd><code>local[*]</code></dd>
      <dt>AppName</dt>
        <dd><code>pyspark-shell</code></dd>
    </dl>
</div>

    </div>




## <a id='toc1_3_'></a>[Tasks](#toc0_)

### <a id='toc1_3_1_'></a>[Task 1: Generate a Spark DataFrame from the CSV data](#toc0_)

Read data from the provided CSV file, `employees.csv` and import it into a Spark DataFrame variable named `employees_df`.


```python
employees_df = spark.read.csv("employees.csv", header=True)
```


```python
employees_df.show()
```

    +------+---------+------+---+----------+
    |Emp_No| Emp_Name|Salary|Age|Department|
    +------+---------+------+---+----------+
    |   198|   Donald|  2600| 29|        IT|
    |   199|  Douglas|  2600| 34|     Sales|
    |   200| Jennifer|  4400| 36| Marketing|
    |   201|  Michael| 13000| 32|        IT|
    |   202|      Pat|  6000| 39|        HR|
    |   203|    Susan|  6500| 36| Marketing|
    |   204|  Hermann| 10000| 29|   Finance|
    |   205|  Shelley| 12008| 33|   Finance|
    |   206|  William|  8300| 37|        IT|
    |   100|   Steven| 24000| 39|        IT|
    |   101|    Neena| 17000| 27|     Sales|
    |   102|      Lex| 17000| 37| Marketing|
    |   103|Alexander|  9000| 39| Marketing|
    |   104|    Bruce|  6000| 38|        IT|
    |   105|    David|  4800| 39|        IT|
    |   106|    Valli|  4800| 38|     Sales|
    |   107|    Diana|  4200| 35|     Sales|
    |   108|    Nancy| 12008| 28|     Sales|
    |   109|   Daniel|  9000| 35|        HR|
    |   110|     John|  8200| 31| Marketing|
    +------+---------+------+---+----------+
    only showing top 20 rows
    

### <a id='toc1_3_2_'></a>[Task 2: Define a schema for the data](#toc0_)

Construct a schema for the input data and then utilize the defined schema to read the CSV file to create a DataFrame named `employees_df`.


```python
schema = StructType([
    StructField("Emp_No", ByteType(), True),
    StructField("Emp_Name", StringType(), True),
    StructField("Salary", IntegerType(), True),
    StructField("Age", ByteType(), True),
    StructField("Department", StringType(), True)
])

employees_df = spark.read.csv("employees.csv", header=True, schema=schema)
```

### <a id='toc1_3_3_'></a>[Task 3: Display schema of DataFrame](#toc0_)

Display the schema of the `employees_df` DataFrame, showing all columns and their respective data types.


```python
employees_df.printSchema()
```

    root
     |-- Emp_No: byte (nullable = true)
     |-- Emp_Name: string (nullable = true)
     |-- Salary: integer (nullable = true)
     |-- Age: byte (nullable = true)
     |-- Department: string (nullable = true)
    
    

### <a id='toc1_3_4_'></a>[Task 4: Create a temporary view](#toc0_)

Create a temporary view named `employees` for the `employees_df` DataFrame, enabling Spark SQL queries on the data. 


```python
employees_df.createTempView("employees")
```

### <a id='toc1_3_5_'></a>[Task 5: Execute an SQL query](#toc0_)

Compose and execute an SQL query to fetch the records from the `employees` view where the age of employees exceeds 30. Then, display the result of the SQL query, showcasing the filtered records.


```python
spark.sql("SELECT * FROM employees WHERE Age > 30").show()
```

    +------+-----------+------+---+----------+
    |Emp_No|   Emp_Name|Salary|Age|Department|
    +------+-----------+------+---+----------+
    |  NULL|    Douglas|  2600| 34|     Sales|
    |  NULL|   Jennifer|  4400| 36| Marketing|
    |  NULL|    Michael| 13000| 32|        IT|
    |  NULL|        Pat|  6000| 39|        HR|
    |  NULL|      Susan|  6500| 36| Marketing|
    |  NULL|    Shelley| 12008| 33|   Finance|
    |  NULL|    William|  8300| 37|        IT|
    |   100|     Steven| 24000| 39|        IT|
    |   102|        Lex| 17000| 37| Marketing|
    |   103|  Alexander|  9000| 39| Marketing|
    |   104|      Bruce|  6000| 38|        IT|
    |   105|      David|  4800| 39|        IT|
    |   106|      Valli|  4800| 38|     Sales|
    |   107|      Diana|  4200| 35|     Sales|
    |   109|     Daniel|  9000| 35|        HR|
    |   110|       John|  8200| 31| Marketing|
    |   111|     Ismael|  7700| 32|        IT|
    |   112|Jose Manuel|  7800| 34|        HR|
    |   113|       Luis|  6900| 34|     Sales|
    |   116|     Shelli|  2900| 37|   Finance|
    +------+-----------+------+---+----------+
    only showing top 20 rows
    

### <a id='toc1_3_6_'></a>[Task 6: Calculate Average Salary by Department](#toc0_)

Compose an SQL query to retrieve the average salary of employees grouped by department. Display the result.


```python
spark.sql("SELECT Department, AVG(Salary) as average_salary FROM employees GROUP BY Department").show()
```

    +----------+-----------------+
    |Department|   average_salary|
    +----------+-----------------+
    |     Sales|5492.923076923077|
    |        HR|           5837.5|
    |   Finance|           5730.8|
    | Marketing|6633.333333333333|
    |        IT|           7400.0|
    +----------+-----------------+
    
    

### <a id='toc1_3_7_'></a>[Task 7: Filter and Display IT Department Employees](#toc0_)

Apply a filter on the `employees_df` DataFrame to select records where the department is `'IT'`. Display the filtered DataFrame.


```python
employees_df.filter(employees_df['Department'] == "IT").show()
```

    +------+--------+------+---+----------+
    |Emp_No|Emp_Name|Salary|Age|Department|
    +------+--------+------+---+----------+
    |  NULL|  Donald|  2600| 29|        IT|
    |  NULL| Michael| 13000| 32|        IT|
    |  NULL| William|  8300| 37|        IT|
    |   100|  Steven| 24000| 39|        IT|
    |   104|   Bruce|  6000| 38|        IT|
    |   105|   David|  4800| 39|        IT|
    |   111|  Ismael|  7700| 32|        IT|
    |  NULL|   Laura|  3300| 38|        IT|
    |  NULL|      TJ|  2100| 34|        IT|
    |  NULL|   Hazel|  2200| 29|        IT|
    +------+--------+------+---+----------+
    
    

### <a id='toc1_3_8_'></a>[Task 8: Add 10% Bonus to Salaries](#toc0_)

Perform a transformation to add a new column named "SalaryAfterBonus" to the DataFrame. Calculate the new salary by adding a 10% bonus to each employee's salary.


```python
employees_df = employees_df.withColumn("SalaryAfterBonus", col("Salary") + (col("Salary") * 0.10))
employees_df.show()
```

    +------+---------+------+---+----------+----------------+
    |Emp_No| Emp_Name|Salary|Age|Department|SalaryAfterBonus|
    +------+---------+------+---+----------+----------------+
    |  NULL|   Donald|  2600| 29|        IT|          2860.0|
    |  NULL|  Douglas|  2600| 34|     Sales|          2860.0|
    |  NULL| Jennifer|  4400| 36| Marketing|          4840.0|
    |  NULL|  Michael| 13000| 32|        IT|         14300.0|
    |  NULL|      Pat|  6000| 39|        HR|          6600.0|
    |  NULL|    Susan|  6500| 36| Marketing|          7150.0|
    |  NULL|  Hermann| 10000| 29|   Finance|         11000.0|
    |  NULL|  Shelley| 12008| 33|   Finance|         13208.8|
    |  NULL|  William|  8300| 37|        IT|          9130.0|
    |   100|   Steven| 24000| 39|        IT|         26400.0|
    |   101|    Neena| 17000| 27|     Sales|         18700.0|
    |   102|      Lex| 17000| 37| Marketing|         18700.0|
    |   103|Alexander|  9000| 39| Marketing|          9900.0|
    |   104|    Bruce|  6000| 38|        IT|          6600.0|
    |   105|    David|  4800| 39|        IT|          5280.0|
    |   106|    Valli|  4800| 38|     Sales|          5280.0|
    |   107|    Diana|  4200| 35|     Sales|          4620.0|
    |   108|    Nancy| 12008| 28|     Sales|         13208.8|
    |   109|   Daniel|  9000| 35|        HR|          9900.0|
    |   110|     John|  8200| 31| Marketing|          9020.0|
    +------+---------+------+---+----------+----------------+
    only showing top 20 rows
    

### <a id='toc1_3_9_'></a>[Task 9: Find Maximum Salary by Age](#toc0_)

Group the data by age and calculate the maximum salary for each age group. Display the result.


```python
employees_df.groupby("Age").agg(max("Salary").alias("MaxSalary")).show()
```

    +---+---------+
    |Age|MaxSalary|
    +---+---------+
    | 31|     8200|
    | 34|     7800|
    | 28|    12008|
    | 27|    17000|
    | 26|     3600|
    | 37|    17000|
    | 35|     9000|
    | 39|    24000|
    | 38|     6000|
    | 29|    10000|
    | 32|    13000|
    | 33|    12008|
    | 30|     8000|
    | 36|     7900|
    +---+---------+
    
    

### <a id='toc1_3_10_'></a>[Task 10: Self-Join on Employee Data](#toc0_)

Join the "employees_df" DataFrame with itself based on the "Emp_No" column. Display the result.


```python
employees_df.join(employees_df, on="Emp_No", how="inner").show()
```

    +------+-----------+------+---+----------+----------------+-----------+------+---+----------+----------------+
    |Emp_No|   Emp_Name|Salary|Age|Department|SalaryAfterBonus|   Emp_Name|Salary|Age|Department|SalaryAfterBonus|
    +------+-----------+------+---+----------+----------------+-----------+------+---+----------+----------------+
    |   100|     Steven| 24000| 39|        IT|         26400.0|     Steven| 24000| 39|        IT|         26400.0|
    |   101|      Neena| 17000| 27|     Sales|         18700.0|      Neena| 17000| 27|     Sales|         18700.0|
    |   102|        Lex| 17000| 37| Marketing|         18700.0|        Lex| 17000| 37| Marketing|         18700.0|
    |   103|  Alexander|  9000| 39| Marketing|          9900.0|  Alexander|  9000| 39| Marketing|          9900.0|
    |   104|      Bruce|  6000| 38|        IT|          6600.0|      Bruce|  6000| 38|        IT|          6600.0|
    |   105|      David|  4800| 39|        IT|          5280.0|      David|  4800| 39|        IT|          5280.0|
    |   106|      Valli|  4800| 38|     Sales|          5280.0|      Valli|  4800| 38|     Sales|          5280.0|
    |   107|      Diana|  4200| 35|     Sales|          4620.0|      Diana|  4200| 35|     Sales|          4620.0|
    |   108|      Nancy| 12008| 28|     Sales|         13208.8|      Nancy| 12008| 28|     Sales|         13208.8|
    |   109|     Daniel|  9000| 35|        HR|          9900.0|     Daniel|  9000| 35|        HR|          9900.0|
    |   110|       John|  8200| 31| Marketing|          9020.0|       John|  8200| 31| Marketing|          9020.0|
    |   111|     Ismael|  7700| 32|        IT|          8470.0|     Ismael|  7700| 32|        IT|          8470.0|
    |   112|Jose Manuel|  7800| 34|        HR|          8580.0|Jose Manuel|  7800| 34|        HR|          8580.0|
    |   113|       Luis|  6900| 34|     Sales|          7590.0|       Luis|  6900| 34|     Sales|          7590.0|
    |   114|        Den| 11000| 27|   Finance|         12100.0|        Den| 11000| 27|   Finance|         12100.0|
    |   115|  Alexander|  3100| 29|   Finance|          3410.0|  Alexander|  3100| 29|   Finance|          3410.0|
    |   116|     Shelli|  2900| 37|   Finance|          3190.0|     Shelli|  2900| 37|   Finance|          3190.0|
    |   117|      Sigal|  2800| 33|     Sales|          3080.0|      Sigal|  2800| 33|     Sales|          3080.0|
    |   118|        Guy|  2600| 36|        HR|          2860.0|        Guy|  2600| 36|        HR|          2860.0|
    |   119|      Karen|  2500| 32|   Finance|          2750.0|      Karen|  2500| 32|   Finance|          2750.0|
    +------+-----------+------+---+----------+----------------+-----------+------+---+----------+----------------+
    only showing top 20 rows
    

### <a id='toc1_3_11_'></a>[Task 11: Calculate Average Employee Age](#toc0_)

Calculate the average age of employees using the built-in aggregation function. Display the result.


```python
employees_df.select(avg("Age").alias("AverageAge")).show()
```

    +----------+
    |AverageAge|
    +----------+
    |     33.56|
    +----------+
    
    

### <a id='toc1_3_12_'></a>[Task 12: Calculate Total Salary by Department](#toc0_)

Calculate the total salary for each department using the built-in aggregation function. Display the result.


```python
employees_df.groupby("Department").agg(sum("Salary").alias("TotalSalary")).show()
```

    +----------+-----------+
    |Department|TotalSalary|
    +----------+-----------+
    |     Sales|      71408|
    |        HR|      46700|
    |   Finance|      57308|
    | Marketing|      59700|
    |        IT|      74000|
    +----------+-----------+
    
    

### <a id='toc1_3_13_'></a>[Task 13: Sort Data by Age and Salary](#toc0_)

Apply a transformation to sort the DataFrame by age in ascending order and then by salary in descending order. Display the sorted DataFrame.


```python
employees_df = employees_df.sort(col("Age").asc(), col("Salary").desc())
employees_df.show()
```

    +------+---------+------+---+----------+----------------+
    |Emp_No| Emp_Name|Salary|Age|Department|SalaryAfterBonus|
    +------+---------+------+---+----------+----------------+
    |  NULL|   Renske|  3600| 26| Marketing|          3960.0|
    |   101|    Neena| 17000| 27|     Sales|         18700.0|
    |   114|      Den| 11000| 27|   Finance|         12100.0|
    |   108|    Nancy| 12008| 28|     Sales|         13208.8|
    |  NULL|    Mozhe|  2800| 28| Marketing|          3080.0|
    |   126|    Irene|  2700| 28|        HR|          2970.0|
    |  NULL|  Hermann| 10000| 29|   Finance|         11000.0|
    |   115|Alexander|  3100| 29|   Finance|          3410.0|
    |  NULL|  Michael|  2900| 29|     Sales|          3190.0|
    |  NULL|   Donald|  2600| 29|        IT|          2860.0|
    |  NULL|   Joshua|  2500| 29|   Finance|          2750.0|
    |  NULL|    Hazel|  2200| 29|        IT|          2420.0|
    |   120|  Matthew|  8000| 30|        HR|          8800.0|
    |   110|     John|  8200| 31| Marketing|          9020.0|
    |   127|    James|  2400| 31|        HR|          2640.0|
    |  NULL|  Michael| 13000| 32|        IT|         14300.0|
    |   111|   Ismael|  7700| 32|        IT|          8470.0|
    |   119|    Karen|  2500| 32|   Finance|          2750.0|
    |  NULL|  Shelley| 12008| 33|   Finance|         13208.8|
    |   124|    Kevin|  5800| 33| Marketing|          6380.0|
    +------+---------+------+---+----------+----------------+
    only showing top 20 rows
    

### <a id='toc1_3_14_'></a>[Task 14: Count Employees in Each Department](#toc0_)

Calculate the number of employees in each department. Display the result.


```python
employees_df.groupby("Department").agg(count("*").alias("EmployeeCount")).show()
```

    +----------+-------------+
    |Department|EmployeeCount|
    +----------+-------------+
    |     Sales|           13|
    |        HR|            8|
    |   Finance|           10|
    | Marketing|            9|
    |        IT|           10|
    +----------+-------------+
    
    

### <a id='toc1_3_15_'></a>[Task 15: Filter Employees with the letter o in the Name](#toc0_)

Apply a filter to select records where the employee's name contains the letter `'o'`. Display the filtered DataFrame.


```python
employees_df.filter(employees_df['Emp_Name'].contains("o")).show()
```

    +------+-----------+------+---+----------+----------------+
    |Emp_No|   Emp_Name|Salary|Age|Department|SalaryAfterBonus|
    +------+-----------+------+---+----------+----------------+
    |  NULL|      Mozhe|  2800| 28| Marketing|          3080.0|
    |  NULL|     Donald|  2600| 29|        IT|          2860.0|
    |  NULL|     Joshua|  2500| 29|   Finance|          2750.0|
    |   110|       John|  8200| 31| Marketing|          9020.0|
    |   112|Jose Manuel|  7800| 34|        HR|          8580.0|
    |  NULL|    Douglas|  2600| 34|     Sales|          2860.0|
    |  NULL|       John|  2700| 36|     Sales|          2970.0|
    |  NULL|      Jason|  3300| 38|     Sales|          3630.0|
    +------+-----------+------+---+----------+----------------+
    
    

### <a id='toc1_3_16_'></a>[Exporting to HDFS](#toc0_)

#### <a id='toc1_3_16_1_'></a>[CSV](#toc0_)


```python
employees_df.write.mode("overwrite").csv("spark_employees.csv")
```

#### <a id='toc1_3_16_2_'></a>[Parquet](#toc0_)


```python
employees_df.write.mode("overwrite").parquet("spark_employees.parquet")
```

### <a id='toc1_3_17_'></a>[Stopping the Spark Session](#toc0_)


```python
spark.stop()
```

## <a id='toc1_4_'></a>[Business Use Case](#toc0_)

This project thereby demonstrates just how Apache Spark can support a scalable HR analytics pipeline by ingesting the employee data from a csv file and then enforcing a user defined schema and finally transforming the data into DataFrames. By using PySpark and Spark SQL, the data pipeline performs filtering, aggregation, sorting, self-joins and feature engineering. These operations can help an organisation monitor its workforce costs, compare departments, support compensation planning and identify workforce patterns.

From a data engineering perspective, Spark provides a repeatable process for ETL and validating the data, while from a data science perspective it enables efficient exploratory analysis and the engineering of features that could later support forecasting, employee segmentation and predictive workforce models. Although this data engineering project uses a small employee dataset, the same workflow can be scaled to millions of records across distributed computing resources.
