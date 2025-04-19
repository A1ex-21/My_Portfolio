---
title: "**How does a bike-share navigate speedy success?**"
author: "Alexander Thompson"
date: "2024-12-18"
output:
  html_document: default
  pdf_document: default
---
# **How do annual members and casual riders use Cyclistic Bikes differently?**

**Note:** Cyclistic is a fictitious company and is for the purposes of this case study,

## **Background Information**

### **Scenario**

I am a junior data analyst on Cyclistic's marketing team, a bike-share company in Chicago, and I have been tasked with helping the company increase its annual memberships. The director of marketing Lily Moreno, believes that annual members are more profitable than casual riders and sees an opportunity to convert existing casual riders into annual members rather than focusing on acquiring new customers.

To support this initiative, I will analyse Cyclistic's historical bike trip data to understand how casual riders and annual members use the service differently. These insights will help the team design targeted marketing strategies to encourage casual riders to purchase annual memberships. But first, the Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### **Characters and Teams**

* Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

* Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.

* Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about Cyclistic's mission and business goals—as well as how you, as a junior data analyst, can help Cyclistic achieve them.

* Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

### **About the company**

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

# **Ask**

## *What is the problem you are trying to solve?*

## *How can your insights drive business decisions?*

The problem to solve is to understand how annual members and casual riders use Cyclistic Bikes differently. This analysis will help Cyclistic design targeted marketing strategies to convert the causal riders into annual members, due to annual members being more profitable then casual riders. So the goal of Cyclistic is to maximise the number of annual memberships.

My insights can drive business decisions as it will identify the usage patterns of both causal riders and annual members therefore highlighting the differences in trip length, frequency and purpose. The insights from the analysis can provide actionable data to tailor marketing campaigns on focusing on the motivations and behaviours of casual riders. It will also guide the resource allocation for promotional activities on digital media to therefore influence casual riders to become annual members, thereby aligning with Cyclistic’s business goals. 

**Business Task**:Analyse and interpret Cyclistic’s Historical bike trip data to understand the behavioural differences between annual members and causal riders. Develop actionable insights and provide data-driven recommendations for a marketing strategy aimed at increasing the number of annual memberships.
# **Prepare**

The data is located in a publicly available datasets by Cyclistic and is made accessible due to a link to Motivate International Inc. under a specific licence agreement. The data is structured in a comma separated value (.csv) format and is in the structure of long Data. The file contains columns for attributes such as trip id, start time, end time, bike id, trip duration, from station name, to station id, to station name, user type, gender and birthyear. Any potential issues with Bias could arise if the dataset does not equally represent all user groups like causal riders and annual members. A careful review ensures that all relevant user segments are included proportionately. The credibility of the data is ensured as the dataset originates from Cyclistic’s actual historical trip records (1st party data). 

The data is **Reliable** as the dataset is provided by a trusted source which is Cyclistic; the data is **Original** as it is sourced directly from Cyclistic’s operations; it is **Comprehensive** as it includes detailed trip data covering key attributes for analysis; the data is **Current** and covers the previous 12 months of trip data thereby ensuring relevance and the data is **Consistent** due to the data structure and column formats are consistent across the files. (**ROCCC**)

The data set complies with the licensing requirements and does not include any personally identifiable information (PII) in order to maintain user privacy. Proper file organisation and standard naming conventions enhance accessibility. To verify the data’s integrity, the data was reviewed for missing values, duplicates and outliers and calculations for derived fields were verified. The data set helps answer the question as it provides information about the user types, trip duration's and travel patterns, which therefore enables a comparison of behaviour between casual riders and annual members.

Downloaded 12 months of trip data and stored files in an organised directory structure with sub folders for both original and processed files. Issues such as missing or invalid values, duplicate records and inconsistent formatting were identified through sorting and filtering, and will be resolved during the data cleaning process. Cross checked data set consistency, ensured it aligned with expected metrics and verified compliance with privacy standards.

**Note:** *Due to Cyclistic being a fictional company, The data used in this analysis includes Cyclistic bike-share trip data for Q1 2019 and Q1 2020. This data is publicly available and provided by Motivate International Inc. under the Divvy Data License Agreement. The datasets can be accessed at [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html).The data used in this analysis is governed by the Divvy Data License Agreement provided by Lyft Bikes and Scooters, LLC. For details, see the full license at [Divvy Data License Agreement](https://www.divvybikes.com/data-license-agreement).*

# **Process**

The tools I am choosing to use are Excel and R, these were selected due to their functionality and compatibility with the dataset. These tools provide robust capabilities for Cleaning, Transforming and Analysing data effectively. Data Integrity was ensured through checks for missing values, duplicates and outliers and calculations and derived fields were verified for accuracy. To ensure that the data was clean, the columns were standardised, errors were corrected, invalid data was removed and additional columns such as ride length and day of week were added to facilitate analysis. To verify the data is clean and ready to analyse, the cleaned data was validated by performing descriptive statistics and ensuring consistent formats across all files. All steps taken during the cleaning and transformation process were documented, including formulas used, issues encountered and resolutions applied.

## **Data Change-log**

# Changelog

Version 1.1 (16/12/2024)

## Changes
  * Removed Null Value row in end_station_id and end_station_name that also had the same time for both started_at and ended_at
  * Removed error values for ride_length as the data in the started_at and ended_at was incorrect, they had all the same start_station_id's and end_station_id's and were all casual usertypes
  * In 2019_Q1 there was no duplicates found
  * In 2020_Q1 there was 55 duplicates found and removed
  
  
Version 1 (16/12/2024)
For Divvy_Trips_2019_Q1 + Divvy_Trips_2020_Q1

## New
  * Added new column ride_length, calculated by subtracting the column started_at from the column ended_at, then formatted the cell as HH:MM:SS.
  * Added new column day_of_week, calculated the day of the week that each ride started using the WEEKDAY command 2019_Q1: (=WEEKDAY(B2, 1)) 2020_Q1: (=WEEKDAY(C2, 1)), with 1 = Sunday and 7 = Saturday.

## Changes
  * Changed 2019_Q1 usertype column, replaced Subscriber with member using Find and Replace (341,906 replacements made)
  * Changed 2019_Q1 usertype column, replaced Customer with casual using Find and Replace (23,163 replacements made).
  * Changed 2020_Q1 member_casual column name to usertype name.
  * Removed 2020_Q1 column rideable_type
  * Removed 2020_Q1 Columns: start_lat, start_lng, end_lat, end_lng
  * Removed 2019_Q1 Column bikeid
  * Changed 2019_Q1 from_station_name to start_station_name
  * Changed 2019_Q1 from_station_id to start_station_id
  * Changed 2019_Q1 to_station_name to end_station_name and to_station_id to end_station_id
  * Changed position of start_station_id and end_station_id in 2019_Q1 to match the format of the columns in 2020_Q1
  * Removed tripduration column from 2019_Q1
  * Removed Gender from 2019_Q1 after testing to see if there was any relationship between gender and usertype.
  * Removed birthyear from 2019_Q1 after testing for relationship between birthyear and usertype.
  * Changed column titles in 2019_Q1 for start_time and end_time to started_at and ended_at
  * Removed trip_id from 2019_Q1 and ride_id from 2020_Q1 as they were both in different data types.

# **Analyse**

**Note:** *For this stage of the Data Analysis Process, I will start from the Process stage again but this time with R Programming Language, in order to highlight the skills in R. This will also be because of the Markdown being written in R Markdown in the RStudio.*

The way in which the data should be organised in order to perform analysis on it, is to organise the data into a cleaned and consolidated data frame (all trips v2) that includes additional columns for key variables such as ride length, day of week and aggregated metrics for analysis. The data has been formatted properly due to ride length has been converted numeric and categorical variables like day of week, are properly ordered to ensure accurate visualisations and summaries.

## Analysis with R for Case Study

## Load tidyverse and use the confilcted package to manage conflicts

```{r Loading the packages}
library(tidyverse)
library(conflicted)
```

## Step 1: Collect Data

Upload the Divvy datasets (.csv files) here

```{r Uploading the Data}
q1_2019 <- read_csv("E:/Coursera/Google Data Analytics/Useful Files/Capstone/Data/Original/Divvy_Trips_2019_Q1.csv")
q1_2020 <- read_csv("E:/Coursera/Google Data Analytics/Useful Files/Capstone/Data/Original/Divvy_Trips_2020_Q1.csv")
```

## Step 2: Wrangle Data and combine into a single file

Compare Column names each of the files

While the names don't have to be in the same order, they do need to match perfectly before we can use a command to join them into one file.

```{r Viewing the Column names}
colnames(q1_2019)
colnames(q1_2020)
```

Rename the Columns to make them consistent with q1_2020 (as this will be the supposed going forward table design for Divvy)

```{r Renaming the Columns}
(q1_2019 <- rename(q1_2019, ride_id = trip_id, rideable_type = bikeid, started_at = start_time,
                   ended_at = end_time, start_station_name = from_station_name,
                   start_station_id = from_station_id, end_station_name = to_station_name,
                   end_station_id = to_station_id, member_casual = usertype))
```

Inspect the data frames and look for incongruencies

```{r Inspecting the Data frames}
str(q1_2019)
str(q1_2020)
```

Convert ride_id and rideable_type to character so that they can stack correctly

```{r Converting ride_id and rideable_type to character}
q1_2019 <- mutate(q1_2019, ride_id = as.character(ride_id),
                  rideable_type = as.character(rideable_type))
```

Stack individual quarter's data frames into one big data frame

Joining the Datasets together (Data Aggregation)

Would add the 2019 Q3, Q4 if had downloaded

```{r Joining the Datasets}
# There was an error
# The started_at column in q1_2019 is in a character datatype
# Use the lubridate package to fix this
library(lubridate)
q1_2019$started_at <- ymd_hms(q1_2019$started_at)
q1_2020$started_at <- ymd_hms(q1_2020$started_at)
str(q1_2019$started_at)
# same problem with ended_at station
# Do the same as before but with end_station this time
q1_2019$ended_at <- ymd_hms(q1_2019$ended_at)
q1_2020$ended_at <- ymd_hms(q1_2020$ended_at)
all_trips <- bind_rows(q1_2019, q1_2020)
```

Remove the lat, long, birthyear and gender fields as this data was dropped beginning in 2020

```{r Removing unwanted Variables}
all_trips <- all_trips %>% 
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, "tripduration"))
```

## Step 3: Clean up and add Data to prepare for Analysis

Inspect the new table that has been created


```{r List of Column names}
colnames(all_trips)
```

```{r How many Rows are in the data frame}
nrow(all_trips)
```

```{r The dimensions of the data frame}
dim(all_trips)
```

```{r First 6 Rows of the Data frame}
head(all_trips)
tail(all_trips)
```

```{r List of Columns and Data types}
str(all_trips)
```

```{r Statistical Summary of the Data (mainly for Numerics)}
summary(all_trips)
```

There are a few problems we will need to fix:

1.  In the "member_casual" column, there are two names for members ("member" and "Subscriber") and two names for casual riders ("Customer" and "casual"). We will need to consolidate that from four to two labels.

 2. The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data such as day, month, year. That provide additional opportunities to aggregate the data

 3. We will want to add a calculated field for length of ride since the 2020q1 data did not have the tripduration column. We will add "ride_length" to the entire data frame for consistency.

4.  There are some rides where tripduration shows up as a negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides

### Doing problem (1)

In the "member_casual" column, replace "Subscriber" with "member" and "Customer" with "casual"
Before 2020, Divvy used different labels for these two types of riders, we will want to make our data frame consistent with their current nomenclature
Note: "Level" is a special property of a column that is retained even if a subset does not contain any values from a specific level
Start by seeing how many observations fall under each usertype

```{r How many observations fall under each usertype}
table(all_trips$member_casual)
```

Reassign to the desired values (we will go with the current 2020 labels)

```{r Reassigning the member_casual}
all_trips <- all_trips %>% 
  mutate(member_casual = recode(member_casual, "Subscriber" = "member", "Customer" = "casual"))
```

Check to make sure the proper number of observations were reassigned

```{r Checking of reassignment}
table(all_trips$member_casual)
```

### Doing problem (2)

Add columns that list the data, month, day and year of each ride
This will allow us to aggregate ride data for each month, day or year
Before completing these operations we could only aggregate at the ride level

```{r Adding Columns that list the month, day and year}
all_trips$date <- as.Date(all_trips$started_at) # The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

```

### Doing problem (3)

Add "ride_length" calculation to all_trips (in seconds)

```{r Adding the ride_length calculation}
all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)
```

Inspect the structure of the columns 

```{r Inspecting the Structure of the Columns}
str(all_trips)
```

Convert "ride_length" from Factor to Numeric so we can run Calculations on the data

```{r Converting ride_length from Factor to Numeric}
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)
```

### Doing problem (4)

Remove "bad" Data
The data frame includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
We will create a new version of the data frame (v2) since data is being removed

```{r Creating all_trips_v2}
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
```

## Step 4: Conduct Descriptive Analysis
**Descriptive Analysis on ride_length (all figures in seconds)**

* Straight Average (total ride length/rides)

```{r Straight Average}
mean(all_trips_v2$ride_length)
```

* Midpoint number in the ascending array of ride lengths

```{r Median}
median(all_trips_v2$ride_length)
```

* Longest Ride

```{r Max}
max(all_trips_v2$ride_length)
```

* Shortest Ride

```{r Min}
min(all_trips_v2$ride_length)
```

Condense the four lines above to one line using summary() on the specific attribute

```{r Summary of the 4 lines}
summary(all_trips_v2$ride_length)
```

Compare Members and Casual users

```{r Comparing Annual Members and Casual riders}
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)
```

See the Average ride time by each day for members vs casual users

```{r Average ride time by each day for members and casual users}
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
```

The list is out of order so lets fix that

```{r Ordering the list}
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
```

The Average ride time by each day for members vs casual users

```{r Average ride time by each day for members vs casual users}
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
```

Analyse ridership data by type and weekday

```{r Ridership type and weekday}
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% # Creates weekday field using wday()
  group_by(member_casual, weekday) %>% # Groups by usertype and weekday
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% # Calculates the Average duration
  arrange(member_casual, weekday) # sorts
```

Visualise the number of rides by rider type

```{r Visualisation: Number of Rides by Weekday}
all_trips_v2 %>% 
  mutate(weekday = wday(started_at,label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + 
  geom_col(position = "dodge")
```

Visualisation for average duration

```{r Visualisation: Average Ride Duration for each Rider Type}
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) + 
  geom_col(position = "dodge")
```

## Step 5: Export Summary File for further Analysis

Create a csv file that we will visualise in Excel, Tableau or my presentation software
Had to change the file location to my hard drive location

```{r}
counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

write.csv(counts, file = 'E:/Coursera/Google Data Analytics/Useful Files/Capstone/Data/avg_ride_length.csv')
```

From the visualisation of Number of rides by rider type generated in RStudio, it is evident from the chart that annual members account for the majority of rides across all days of the week. The highest ride counts occur during the weekdays, reflecting potential commuting behaviour. Casual riders, contribute far fewer rides compared to members, but their usage increases on weekends. This suggests that causal riders predominantly use the service for leisure or recreational purposes on non-working days.

The insights gained from the analysis directly supports Cyclistic’s goal of converting casual riders into annual members. Causal riders primarily use bikes for leisure activities on weekends and tend to have longer ride duration's. In contrast, annual members use bikes for short, frequent trips, particularly on weekdays which likely aligns with commuting purposes. The distinct difference in behaviour highlights an opportunity for Cyclistic to promote the value of annual memberships by emphasising the benefits such as convenience, cost savings and suitability for frequent, shorter trips.

Due to the fact that casual riders’ usage peaks during the weekends, Cyclistic can design targeted campaigns for this time frame, thereby showcasing the advantages of switching to annual memberships. Marketing strategies could include discounts for first-time memberships, referral bonuses or seasonal promotions aimed at encouraging casual riders to take advantage of cost savings and unlimited rides. By aligning campaigns with peak usage times, Cyclistic can effectively capture the attention of casual riders when they are most likely to engage with the service.

In addition, causal riders longer ride duration's suggest they value the experience of cycling, whether for leisure or exploration. This behaviour can be leveraged in marketing messaging by highlighting the flexibility and freedom that comes with annual memberships, thereby allowing riders to explore and enjoy the city without worrying about per-ride costs. Combining this messaging with digital media campaigns can help communicate the value of memberships in both recreational and practical use cases. 

In Conclusion, these insights help Cyclistic design data driven marketing strategies that appeal to casual riders unique behaviours and motivations. By emphasising cost-effectiveness, flexibility and convenience, Cyclistic can increase the likelihood of converting casual users into annual members, thereby ultimately driving higher profitability and customer retention.

# **Share**

The data tells a story of two distinct user groups: casual riders who have longer average ride duration with higher usage on weekends, and annual members who have shorter, frequent rides throughout the week, peaking on weekdays. This highlights that casual riders are leisure focused, while annual members are consistent, frequent users likely leveraging the service for daily commutes.

The findings address the question of how casual riders and annual members use bikes differently. Understanding these patterns provides a foundation for designing targeted marketing campaigns to convert casual riders into annual members. The audience of this study includes Cyclistic’s executive team and marketing analysts. To effectively communicate the findings a combination of data visualisations and a clear, concise summary of insights will be used. Charts created with ggplot2 clearly illustrate the differences in ride duration, frequency and usage patterns between the two groups.

Data visualisations are essential for clearly communicating trends and insights. Bar charts showing the average ride duration and the number of rides by weekday help the stakeholders quickly grasp the key behavioural differences between casual riders and annual members. The presentation would be accessible to the audience as it will feature clean, professional visuals, clear labels and a brief narrative explaining the findings and their implications. Supporting data and summaries will be included in an accessible format such as slides, PDF report or a dashboard.

## **Data Visualisations**

### **Number of Rides by Weekday**

```{r Number of Rides by Weekday}
all_trips_v2 %>% 
  mutate(weekday = wday(started_at,label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + 
  geom_col(position = "dodge") + labs(title = "Number of Rides by Weekday", fontface = "bold", subtitle = "Casual Riders vs. Annual Members", caption = "Made using 2019_Q1 and 2020_Q1 Data")
```

### **Average Ride Duration for each Rider Type**

```{r Average Ride Duration for each Rider Type}
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) + 
  geom_col(position = "dodge") + labs(title = "Average Ride Duration for each Rider Type", subtitle = "Casual Riders vs. Annual Members", caption = "Made using 2019_Q1 and 2020_Q1 Data")
```

## **Presentation**

To view my presentation click [here](https://docs.google.com/presentation/d/1_TtCAj7LnrqlN8IK_eXAM33pKqr4IB8s/edit?usp=sharing&ouid=104952222776858457522&rtpof=true&sd=true)

# **Act**

The analysis highlights that casual riders and annual members use Cyclistic bikes differently. Casual riders tend to use the bikes for longer duration's, primarily on weekends, which suggests a preference for leisure and recreational activities. In contrast, annual members use the bikes for shorter, frequent rides throughout the weekdays, indicating routine commuting behaviour. To convert casual riders into annual members, Cyclistic should emphasise the cost-effectiveness, convenience and flexibility of annual memberships while tailoring marketing to align with casual riders habits.

The marketing team can apply these insights via designing targeted campaigns and promotional offer. For example, focusing on weekends with specific promotions for leisure riders, creating cost comparisons to highlight the savings of an annual membership and offering seasonal discounts or event based incentives. These strategies directly address the behaviours and motivations identified in the analysis, making the marketing initiatives more effective.

The next steps would involve implementing and testing these strategies to measure their impact. Cyclistic should roll out targeted campaigns, introduce limited time offers like seasonal discounts or free trials, and then monitor key performance indicators such as membership sign ups, conversion rates and changes in casual rider behaviour. By tracking these metrics, the team can evaluate the effectiveness of the campaigns and would be able to refine the strategies as needed in order to optimise the results.

In order to expand on these findings, additional data could provide a deeper understanding of user behaviours and preferences. For example, demographic data such as age, location or occupation, could help tailor the marketing messages to specific user segments. Long term seasonality trends from multiple years would offer more predictive insights for peak usage times. In addition, conducting customer surveys would allow for Cyclistic to gather direct feedback from casual riders to understand their barriers to purchasing memberships and identify which benefits they value the most.

By consolidating these insights into a final presentation or report, Cyclistic can confidently move forward with data-driven strategies in order to increase annual memberships. This process ensures that the findings are actionable, measurable and aligned with the company’s goals of profitability and growth.

# **References**

## Data Sources

1. Cyclistic bike-share trip data for Q1 2019 and Q1 2020, provided by Motivate International Inc. under the Divvy Data License Agreement. Available at [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html).
2. Divvy Data License Agreement: [https://www.divvybikes.com/data-license-agreement](https://www.divvybikes.com/data-license-agreement).
