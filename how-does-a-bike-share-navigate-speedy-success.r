{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "9368e7e2",
   "metadata": {
    "_cell_guid": "a344a9d7-9dda-4932-89dd-2d5806171e12",
    "_uuid": "933ff54e-1382-47b3-8308-e924cd817d3d",
    "collapsed": false,
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.008327,
     "end_time": "2024-12-19T00:36:31.966110",
     "exception": false,
     "start_time": "2024-12-19T00:36:31.957783",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Title:** **How does a bike-share navigate speedy success?**\n",
    "\n",
    "**Author:** **Alexander Thompson**\n",
    "\n",
    "**Date:** **2024/12/18**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "24ed6441",
   "metadata": {
    "papermill": {
     "duration": 0.007259,
     "end_time": "2024-12-19T00:36:31.980705",
     "exception": false,
     "start_time": "2024-12-19T00:36:31.973446",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **How do annual members and casual riders use Cyclistic Bikes differently?**\n",
    "\n",
    "**Note:** Cyclistic is a fictitious company and is for the purposes of this case study,\n",
    "\n",
    "## **Background Information**\n",
    "\n",
    "### **Scenario**\n",
    "\n",
    "I am a junior data analyst on Cyclistic's marketing team, a bike-share company in Chicago, and I have been tasked with helping the company increase its annual memberships. The director of marketing Lily Moreno, believes that annual members are more profitable than casual riders and sees an opportunity to convert existing casual riders into annual members rather than focusing on acquiring new customers.\n",
    "\n",
    "To support this initiative, I will analyse Cyclistic's historical bike trip data to understand how casual riders and annual members use the service differently. These insights will help the team design targeted marketing strategies to encourage casual riders to purchase annual memberships. But first, the Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.\n",
    "\n",
    "### **Characters and Teams**\n",
    "\n",
    "* Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.\n",
    "\n",
    "* Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.\n",
    "\n",
    "* Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about Cyclistic's mission and business goals—as well as how you, as a junior data analyst, can help Cyclistic achieve them.\n",
    "\n",
    "* Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.\n",
    "\n",
    "### **About the company**\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.\n",
    "\n",
    "Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.\n",
    "Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.\n",
    "\n",
    "Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.\n",
    "\n",
    "Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.\n",
    "# **Ask**\n",
    "\n",
    "## *What is the problem you are trying to solve?*\n",
    "\n",
    "## *How can your insights drive business decisions?*\n",
    "\n",
    "The problem to solve is to understand how annual members and casual riders use Cyclistic Bikes differently. This analysis will help Cyclistic design targeted marketing strategies to convert the causal riders into annual members, due to annual members being more profitable then casual riders. So the goal of Cyclistic is to maximise the number of annual memberships.\n",
    "\n",
    "My insights can drive business decisions as it will identify the usage patterns of both causal riders and annual members therefore highlighting the differences in trip length, frequency and purpose. The insights from the analysis can provide actionable data to tailor marketing campaigns on focusing on the motivations and behaviours of casual riders. It will also guide the resource allocation for promotional activities on digital media to therefore influence casual riders to become annual members, thereby aligning with Cyclistic’s business goals. \n",
    "\n",
    "**Business Task:** Analyse and interpret Cyclistic’s Historical bike trip data to understand the behavioural differences between annual members and causal riders. Develop actionable insights and provide data-driven recommendations for a marketing strategy aimed at increasing the number of annual memberships.\n",
    "\n",
    "# **Prepare**\n",
    "\n",
    "The data is located in a publicly available datasets by Cyclistic and is made accessible due to a link to Motivate International Inc. under a specific licence agreement. The data is structured in a comma separated value (.csv) format and is in the structure of long Data. The file contains columns for attributes such as trip id, start time, end time, bike id, trip duration, from station name, to station id, to station name, user type, gender and birthyear. Any potential issues with Bias could arise if the dataset does not equally represent all user groups like causal riders and annual members. A careful review ensures that all relevant user segments are included proportionately. The credibility of the data is ensured as the dataset originates from Cyclistic’s actual historical trip records (1st party data). \n",
    "\n",
    "The data is **Reliable** as the dataset is provided by a trusted source which is Cyclistic; the data is **Original** as it is sourced directly from Cyclistic’s operations; it is **Comprehensive** as it includes detailed trip data covering key attributes for analysis; the data is **Current** and covers the previous 12 months of trip data thereby ensuring relevance and the data is **Consistent** due to the data structure and column formats are consistent across the files. (**ROCCC**)\n",
    "\n",
    "The data set complies with the licensing requirements and does not include any personally identifiable information (PII) in order to maintain user privacy. Proper file organisation and standard naming conventions enhance accessibility. To verify the data’s integrity, the data was reviewed for missing values, duplicates and outliers and calculations for derived fields were verified. The data set helps answer the question as it provides information about the user types, trip duration's and travel patterns, which therefore enables a comparison of behaviour between casual riders and annual members.\n",
    "\n",
    "Downloaded 12 months of trip data and stored files in an organised directory structure with sub folders for both original and processed files. Issues such as missing or invalid values, duplicate records and inconsistent formatting were identified through sorting and filtering, and will be resolved during the data cleaning process. Cross checked data set consistency, ensured it aligned with expected metrics and verified compliance with privacy standards.\n",
    "\n",
    "**Note:** *Due to Cyclistic being a fictional company, The data used in this analysis includes Cyclistic bike-share trip data for Q1 2019 and Q1 2020. This data is publicly available and provided by Motivate International Inc. under the Divvy Data License Agreement. The datasets can be accessed at [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html).The data used in this analysis is governed by the Divvy Data License Agreement provided by Lyft Bikes and Scooters, LLC. For details, see the full license at [Divvy Data License Agreement](https://www.divvybikes.com/data-license-agreement).*\n",
    "\n",
    "# **Process**\n",
    "\n",
    "The tools I am choosing to use are Excel and R, these were selected due to their functionality and compatibility with the dataset. These tools provide robust capabilities for Cleaning, Transforming and Analysing data effectively. Data Integrity was ensured through checks for missing values, duplicates and outliers and calculations and derived fields were verified for accuracy. To ensure that the data was clean, the columns were standardised, errors were corrected, invalid data was removed and additional columns such as ride length and day of week were added to facilitate analysis. To verify the data is clean and ready to analyse, the cleaned data was validated by performing descriptive statistics and ensuring consistent formats across all files. All steps taken during the cleaning and transformation process were documented, including formulas used, issues encountered and resolutions applied.\n",
    "## **Data Change-log**\n",
    "### Changelog\n",
    "\n",
    "Version 1.1 (16/12/2024)\n",
    "\n",
    "#### Changes\n",
    "  * Removed Null Value row in end_station_id and end_station_name that also had the same time for both started_at and ended_at\n",
    "  * Removed error values for ride_length as the data in the started_at and ended_at was incorrect, they had all the same start_station_id's and end_station_id's and were all casual usertypes\n",
    "  * In 2019_Q1 there was no duplicates found\n",
    "  * In 2020_Q1 there was 55 duplicates found and removed\n",
    "  \n",
    "  \n",
    "Version 1 (16/12/2024)\n",
    "For Divvy_Trips_2019_Q1 + Divvy_Trips_2020_Q1\n",
    "\n",
    "#### New\n",
    "  * Added new column ride_length, calculated by subtracting the column started_at from the column ended_at, then formatted the cell as HH:MM:SS.\n",
    "  * Added new column day_of_week, calculated the day of the week that each ride started using the WEEKDAY command 2019_Q1: (=WEEKDAY(B2, 1)) 2020_Q1: (=WEEKDAY(C2, 1)), with 1 = Sunday and 7 = Saturday.\n",
    "\n",
    "#### Changes\n",
    "  * Changed 2019_Q1 usertype column, replaced Subscriber with member using Find and Replace (341,906 replacements made)\n",
    "  * Changed 2019_Q1 usertype column, replaced Customer with casual using Find and Replace (23,163 replacements made).\n",
    "  * Changed 2020_Q1 member_casual column name to usertype name.\n",
    "  * Removed 2020_Q1 column rideable_type\n",
    "  * Removed 2020_Q1 Columns: start_lat, start_lng, end_lat, end_lng\n",
    "  * Removed 2019_Q1 Column bikeid\n",
    "  * Changed 2019_Q1 from_station_name to start_station_name\n",
    "  * Changed 2019_Q1 from_station_id to start_station_id\n",
    "  * Changed 2019_Q1 to_station_name to end_station_name and to_station_id to end_station_id\n",
    "  * Changed position of start_station_id and end_station_id in 2019_Q1 to match the format of the columns in 2020_Q1\n",
    "  * Removed tripduration column from 2019_Q1\n",
    "  * Removed Gender from 2019_Q1 after testing to see if there was any relationship between gender and usertype.\n",
    "  * Removed birthyear from 2019_Q1 after testing for relationship between birthyear and usertype.\n",
    "  * Changed column titles in 2019_Q1 for start_time and end_time to started_at and ended_at\n",
    "  * Removed trip_id from 2019_Q1 and ride_id from 2020_Q1 as they were both in different data types.\n",
    "\n",
    "# **Analyse**\n",
    "\n",
    "**Note:** *For this stage of the Data Analysis Process, I will start from the Process stage again but this time with R Programming Language, in order to highlight the skills in R. This will also be because of the Markdown being written in R Markdown in the RStudio.*\n",
    "\n",
    "The way in which the data should be organised in order to perform analysis on it, is to organise the data into a cleaned and consolidated data frame (all trips v2) that includes additional columns for key variables such as ride length, day of week and aggregated metrics for analysis. The data has been formatted properly due to ride length has been converted numeric and categorical variables like day of week, are properly ordered to ensure accurate visualisations and summaries.\n",
    "\n",
    "## Analysis with R for Case Study\n",
    "\n",
    "## Load tidyverse and use the confilcted package to manage conflicts"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "90a6cc48",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:31.998408Z",
     "iopub.status.busy": "2024-12-19T00:36:31.996886Z",
     "iopub.status.idle": "2024-12-19T00:36:33.198414Z",
     "shell.execute_reply": "2024-12-19T00:36:33.197163Z"
    },
    "papermill": {
     "duration": 1.21229,
     "end_time": "2024-12-19T00:36:33.200246",
     "exception": false,
     "start_time": "2024-12-19T00:36:31.987956",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(conflicted)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3fbf4bb9",
   "metadata": {
    "papermill": {
     "duration": 0.007319,
     "end_time": "2024-12-19T00:36:33.215783",
     "exception": false,
     "start_time": "2024-12-19T00:36:33.208464",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 1: Collect Data\n",
    "\n",
    "Upload the Divvy datasets (.csv files) here"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "4930117f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:33.251941Z",
     "iopub.status.busy": "2024-12-19T00:36:33.231712Z",
     "iopub.status.idle": "2024-12-19T00:36:36.754978Z",
     "shell.execute_reply": "2024-12-19T00:36:36.753460Z"
    },
    "papermill": {
     "duration": 3.534076,
     "end_time": "2024-12-19T00:36:36.757025",
     "exception": false,
     "start_time": "2024-12-19T00:36:33.222949",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m365069\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (6): start_time, end_time, from_station_name, to_station_name, usertype,...\n",
      "\u001b[32mdbl\u001b[39m (5): trip_id, bikeid, from_station_id, to_station_id, birthyear\n",
      "\u001b[32mnum\u001b[39m (1): tripduration\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m426887\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (5): ride_id, rideable_type, start_station_name, end_station_name, memb...\n",
      "\u001b[32mdbl\u001b[39m  (6): start_station_id, end_station_id, start_lat, start_lng, end_lat, e...\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q1_2019 <- read_csv(\"/kaggle/input/divvy-trips-2019-q1-csv/Divvy_Trips_2019_Q1.csv\")\n",
    "q1_2020 <- read_csv(\"/kaggle/input/d/a1ex21/divvy-trips-2020-q1-csv/Divvy_Trips_2020_Q1.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6df11169",
   "metadata": {
    "papermill": {
     "duration": 0.007983,
     "end_time": "2024-12-19T00:36:36.773282",
     "exception": false,
     "start_time": "2024-12-19T00:36:36.765299",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 2: Wrangle Data and combine into a single file\n",
    "\n",
    "Compare Column names each of the files\n",
    "\n",
    "While the names don't have to be in the same order, they do need to match perfectly before we can use a command to join them into one file."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "1163d783",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:36.792138Z",
     "iopub.status.busy": "2024-12-19T00:36:36.790991Z",
     "iopub.status.idle": "2024-12-19T00:36:36.810410Z",
     "shell.execute_reply": "2024-12-19T00:36:36.808810Z"
    },
    "papermill": {
     "duration": 0.031166,
     "end_time": "2024-12-19T00:36:36.812444",
     "exception": false,
     "start_time": "2024-12-19T00:36:36.781278",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'trip_id'</li><li>'start_time'</li><li>'end_time'</li><li>'bikeid'</li><li>'tripduration'</li><li>'from_station_id'</li><li>'from_station_name'</li><li>'to_station_id'</li><li>'to_station_name'</li><li>'usertype'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'trip\\_id'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'bikeid'\n",
       "\\item 'tripduration'\n",
       "\\item 'from\\_station\\_id'\n",
       "\\item 'from\\_station\\_name'\n",
       "\\item 'to\\_station\\_id'\n",
       "\\item 'to\\_station\\_name'\n",
       "\\item 'usertype'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'trip_id'\n",
       "2. 'start_time'\n",
       "3. 'end_time'\n",
       "4. 'bikeid'\n",
       "5. 'tripduration'\n",
       "6. 'from_station_id'\n",
       "7. 'from_station_name'\n",
       "8. 'to_station_id'\n",
       "9. 'to_station_name'\n",
       "10. 'usertype'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"trip_id\"           \"start_time\"        \"end_time\"         \n",
       " [4] \"bikeid\"            \"tripduration\"      \"from_station_id\"  \n",
       " [7] \"from_station_name\" \"to_station_id\"     \"to_station_name\"  \n",
       "[10] \"usertype\"          \"gender\"            \"birthyear\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q1_2019)\n",
    "colnames(q1_2020)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "263ac85e",
   "metadata": {
    "papermill": {
     "duration": 0.008086,
     "end_time": "2024-12-19T00:36:36.828959",
     "exception": false,
     "start_time": "2024-12-19T00:36:36.820873",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Rename the Columns to make them consistent with q1_2020 (as this will be the supposed going forward table design for Divvy)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "c270c423",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:36.848488Z",
     "iopub.status.busy": "2024-12-19T00:36:36.847243Z",
     "iopub.status.idle": "2024-12-19T00:36:36.992447Z",
     "shell.execute_reply": "2024-12-19T00:36:36.990303Z"
    },
    "papermill": {
     "duration": 0.15738,
     "end_time": "2024-12-19T00:36:36.994630",
     "exception": false,
     "start_time": "2024-12-19T00:36:36.837250",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A spec_tbl_df: 365069 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>tripduration</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>gender</th><th scope=col>birthyear</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>21742443</td><td>01/01/2019 00:04</td><td>01/01/2019 00:11</td><td>2167</td><td> 390</td><td>199</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave             </span></td><td> 84</td><td><span style=white-space:pre-wrap>Milwaukee Ave &amp; Grand Ave     </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1989</td></tr>\n",
       "\t<tr><td>21742444</td><td>01/01/2019 00:08</td><td>01/01/2019 00:15</td><td>4386</td><td> 441</td><td> 44</td><td><span style=white-space:pre-wrap>State St &amp; Randolph St             </span></td><td>624</td><td>Dearborn St &amp; Van Buren St (*)</td><td>Subscriber</td><td>Female</td><td>1990</td></tr>\n",
       "\t<tr><td>21742445</td><td>01/01/2019 00:13</td><td>01/01/2019 00:27</td><td>1524</td><td> 829</td><td> 15</td><td><span style=white-space:pre-wrap>Racine Ave &amp; 18th St               </span></td><td>644</td><td>Western Ave &amp; Fillmore St (*) </td><td>Subscriber</td><td>Female</td><td>1994</td></tr>\n",
       "\t<tr><td>21742446</td><td>01/01/2019 00:13</td><td>01/01/2019 00:43</td><td> 252</td><td>1783</td><td>123</td><td><span style=white-space:pre-wrap>California Ave &amp; Milwaukee Ave     </span></td><td>176</td><td><span style=white-space:pre-wrap>Clark St &amp; Elm St             </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1993</td></tr>\n",
       "\t<tr><td>21742447</td><td>01/01/2019 00:14</td><td>01/01/2019 00:20</td><td>1170</td><td> 364</td><td>173</td><td>Mies van der Rohe Way &amp; Chicago Ave</td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave       </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1994</td></tr>\n",
       "\t<tr><td>21742448</td><td>01/01/2019 00:15</td><td>01/01/2019 00:19</td><td>2437</td><td> 216</td><td> 98</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Washington St         </span></td><td> 49</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St       </span></td><td>Subscriber</td><td>Female</td><td>1983</td></tr>\n",
       "\t<tr><td>21742449</td><td>01/01/2019 00:16</td><td>01/01/2019 00:19</td><td>2708</td><td> 177</td><td> 98</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Washington St         </span></td><td> 49</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St       </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1984</td></tr>\n",
       "\t<tr><td>21742450</td><td>01/01/2019 00:18</td><td>01/01/2019 00:20</td><td>2796</td><td> 100</td><td>211</td><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St             </span></td><td>142</td><td><span style=white-space:pre-wrap>McClurg Ct &amp; Erie St          </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td></tr>\n",
       "\t<tr><td>21742451</td><td>01/01/2019 00:18</td><td>01/01/2019 00:47</td><td>6205</td><td>1727</td><td>150</td><td><span style=white-space:pre-wrap>Fort Dearborn Dr &amp; 31st St         </span></td><td>148</td><td><span style=white-space:pre-wrap>State St &amp; 33rd St            </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1995</td></tr>\n",
       "\t<tr><td>21742452</td><td>01/01/2019 00:19</td><td>01/01/2019 00:24</td><td>3939</td><td> 336</td><td>268</td><td><span style=white-space:pre-wrap>Lake Shore Dr &amp; North Blvd         </span></td><td>141</td><td><span style=white-space:pre-wrap>Clark St &amp; Lincoln Ave        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1996</td></tr>\n",
       "\t<tr><td>21742453</td><td>01/01/2019 00:20</td><td>01/01/2019 00:35</td><td>6243</td><td> 886</td><td>299</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St             </span></td><td>295</td><td><span style=white-space:pre-wrap>Broadway &amp; Argyle St          </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1994</td></tr>\n",
       "\t<tr><td>21742454</td><td>01/01/2019 00:21</td><td>01/01/2019 00:32</td><td>6300</td><td> 653</td><td>204</td><td><span style=white-space:pre-wrap>Prairie Ave &amp; Garfield Blvd        </span></td><td>420</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 55th St           </span></td><td>Subscriber</td><td>Female</td><td>1994</td></tr>\n",
       "\t<tr><td>21742455</td><td>01/01/2019 00:23</td><td>01/01/2019 00:33</td><td>3029</td><td> 601</td><td> 90</td><td><span style=white-space:pre-wrap>Millennium Park                    </span></td><td>255</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd    </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1986</td></tr>\n",
       "\t<tr><td>21742456</td><td>01/01/2019 00:23</td><td>01/01/2019 00:33</td><td><span style=white-space:pre-wrap>  84</span></td><td> 562</td><td> 90</td><td><span style=white-space:pre-wrap>Millennium Park                    </span></td><td>255</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd    </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td>Female</td><td>1990</td></tr>\n",
       "\t<tr><td>21742457</td><td>01/01/2019 00:23</td><td>01/01/2019 00:39</td><td>5019</td><td> 906</td><td>289</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln              </span></td><td>324</td><td><span style=white-space:pre-wrap>Stockton Dr &amp; Wrightwood Ave  </span></td><td>Subscriber</td><td>Female</td><td>1989</td></tr>\n",
       "\t<tr><td>21742458</td><td>01/01/2019 00:24</td><td>01/01/2019 00:39</td><td>5526</td><td> 892</td><td>289</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln              </span></td><td>324</td><td><span style=white-space:pre-wrap>Stockton Dr &amp; Wrightwood Ave  </span></td><td>Subscriber</td><td>Female</td><td>1989</td></tr>\n",
       "\t<tr><td>21742459</td><td>01/01/2019 00:24</td><td>01/01/2019 00:31</td><td>3373</td><td> 407</td><td>152</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Diversey Pkwy        </span></td><td>166</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Wrightwood Ave  </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1967</td></tr>\n",
       "\t<tr><td>21742460</td><td>01/01/2019 00:24</td><td>01/01/2019 00:47</td><td>5777</td><td>1356</td><td>268</td><td><span style=white-space:pre-wrap>Lake Shore Dr &amp; North Blvd         </span></td><td>319</td><td>Greenview Ave &amp; Diversey Pkwy </td><td><span style=white-space:pre-wrap>Customer  </span></td><td>Female</td><td>1990</td></tr>\n",
       "\t<tr><td>21742461</td><td>01/01/2019 00:25</td><td>01/01/2019 00:27</td><td>3940</td><td> 102</td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave            </span></td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave       </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1985</td></tr>\n",
       "\t<tr><td>21742463</td><td>01/01/2019 00:29</td><td>01/01/2019 01:08</td><td>3914</td><td>2333</td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave            </span></td><td> 39</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Adams St         </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA    </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>21742464</td><td>01/01/2019 00:29</td><td>01/01/2019 00:45</td><td> 140</td><td> 960</td><td> 47</td><td><span style=white-space:pre-wrap>State St &amp; Kinzie St               </span></td><td>111</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; Huron St        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1957</td></tr>\n",
       "\t<tr><td>21742465</td><td>01/01/2019 00:29</td><td>01/01/2019 01:07</td><td>3355</td><td>2301</td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave            </span></td><td> 39</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Adams St         </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA    </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>21742466</td><td>01/01/2019 00:29</td><td>01/01/2019 00:49</td><td>5026</td><td>1168</td><td> 85</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St              </span></td><td>329</td><td>Lake Shore Dr &amp; Diversey Pkwy </td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1959</td></tr>\n",
       "\t<tr><td>21742467</td><td>01/01/2019 00:30</td><td>01/01/2019 00:38</td><td>1998</td><td> 474</td><td>289</td><td><span style=white-space:pre-wrap>Wells St &amp; Concord Ln              </span></td><td>313</td><td>Lakeview Ave &amp; Fullerton Pkwy </td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1994</td></tr>\n",
       "\t<tr><td>21742468</td><td>01/01/2019 00:33</td><td>01/01/2019 00:50</td><td>2630</td><td>1036</td><td> 13</td><td><span style=white-space:pre-wrap>Wilton Ave &amp; Diversey Pkwy         </span></td><td> 61</td><td><span style=white-space:pre-wrap>Wood St &amp; Milwaukee Ave       </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1991</td></tr>\n",
       "\t<tr><td>21742469</td><td>01/01/2019 00:34</td><td>01/01/2019 00:38</td><td>3722</td><td> 230</td><td>520</td><td><span style=white-space:pre-wrap>Greenview Ave &amp; Jarvis Ave         </span></td><td>523</td><td><span style=white-space:pre-wrap>Eastlake Ter &amp; Rogers Ave     </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1961</td></tr>\n",
       "\t<tr><td>21742471</td><td>01/01/2019 00:38</td><td>01/01/2019 00:50</td><td>1166</td><td> 747</td><td>256</td><td><span style=white-space:pre-wrap>Broadway &amp; Sheridan Rd             </span></td><td>297</td><td><span style=white-space:pre-wrap>Paulina St &amp; Montrose Ave     </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1968</td></tr>\n",
       "\t<tr><td>21742472</td><td>01/01/2019 00:38</td><td>01/01/2019 00:50</td><td>1704</td><td> 711</td><td>256</td><td><span style=white-space:pre-wrap>Broadway &amp; Sheridan Rd             </span></td><td>297</td><td><span style=white-space:pre-wrap>Paulina St &amp; Montrose Ave     </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1964</td></tr>\n",
       "\t<tr><td>21742473</td><td>01/01/2019 00:40</td><td>01/01/2019 00:49</td><td>1476</td><td> 553</td><td>254</td><td><span style=white-space:pre-wrap>Pine Grove Ave &amp; Irving Park Rd    </span></td><td>465</td><td><span style=white-space:pre-wrap>Marine Dr &amp; Ainslie St        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td></tr>\n",
       "\t<tr><td>21742474</td><td>01/01/2019 00:41</td><td>01/01/2019 00:50</td><td>4614</td><td> 521</td><td> 66</td><td><span style=white-space:pre-wrap>Clinton St &amp; Lake St               </span></td><td> 52</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Lake St        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1994</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>22178488</td><td>31/03/2019 22:51</td><td>31/03/2019 22:54</td><td>4602</td><td>178</td><td>460</td><td><span style=white-space:pre-wrap>Clark St &amp; Bryn Mawr Ave           </span></td><td>461</td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1986</td></tr>\n",
       "\t<tr><td>22178489</td><td>31/03/2019 22:54</td><td>31/03/2019 23:02</td><td>4151</td><td>529</td><td> 47</td><td><span style=white-space:pre-wrap>State St &amp; Kinzie St               </span></td><td> 26</td><td><span style=white-space:pre-wrap>McClurg Ct &amp; Illinois St            </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td></tr>\n",
       "\t<tr><td>22178490</td><td>31/03/2019 22:55</td><td>31/03/2019 23:02</td><td>3833</td><td>402</td><td>108</td><td><span style=white-space:pre-wrap>Halsted St &amp; Polk St               </span></td><td> 19</td><td><span style=white-space:pre-wrap>Loomis St &amp; Taylor St (*)           </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td></tr>\n",
       "\t<tr><td>22178491</td><td>31/03/2019 22:58</td><td>31/03/2019 23:06</td><td>1374</td><td>492</td><td>108</td><td><span style=white-space:pre-wrap>Halsted St &amp; Polk St               </span></td><td> 41</td><td><span style=white-space:pre-wrap>Federal St &amp; Polk St                </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td></tr>\n",
       "\t<tr><td>22178492</td><td>31/03/2019 22:59</td><td>31/03/2019 23:01</td><td>3723</td><td>123</td><td> 66</td><td><span style=white-space:pre-wrap>Clinton St &amp; Lake St               </span></td><td> 77</td><td><span style=white-space:pre-wrap>Clinton St &amp; Madison St             </span></td><td>Subscriber</td><td>Female</td><td>1985</td></tr>\n",
       "\t<tr><td>22178493</td><td>31/03/2019 23:00</td><td>31/03/2019 23:10</td><td>2331</td><td>635</td><td> 51</td><td><span style=white-space:pre-wrap>Clark St &amp; Randolph St             </span></td><td>364</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Oak St                </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1972</td></tr>\n",
       "\t<tr><td>22178494</td><td>31/03/2019 23:00</td><td>31/03/2019 23:09</td><td>1312</td><td>532</td><td> 98</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Washington St         </span></td><td> 22</td><td><span style=white-space:pre-wrap>May St &amp; Taylor St                  </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>Male  </span></td><td>1993</td></tr>\n",
       "\t<tr><td>22178495</td><td>31/03/2019 23:00</td><td>31/03/2019 23:13</td><td>6205</td><td>741</td><td>301</td><td><span style=white-space:pre-wrap>Clark St &amp; Schiller St             </span></td><td>115</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Wellington Ave      </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1988</td></tr>\n",
       "\t<tr><td>22178502</td><td>31/03/2019 23:03</td><td>31/03/2019 23:15</td><td>3360</td><td>739</td><td>295</td><td><span style=white-space:pre-wrap>Broadway &amp; Argyle St               </span></td><td>451</td><td><span style=white-space:pre-wrap>Sheridan Rd &amp; Loyola Ave            </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td></tr>\n",
       "\t<tr><td>22178503</td><td>31/03/2019 23:09</td><td>31/03/2019 23:19</td><td>6416</td><td>590</td><td>114</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Waveland Ave       </span></td><td>330</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Addison St            </span></td><td>Subscriber</td><td>Female</td><td>1985</td></tr>\n",
       "\t<tr><td>22178504</td><td>31/03/2019 23:10</td><td>31/03/2019 23:21</td><td>3767</td><td>674</td><td> 50</td><td><span style=white-space:pre-wrap>Clark St &amp; Ida B Wells Dr          </span></td><td> 50</td><td><span style=white-space:pre-wrap>Clark St &amp; Ida B Wells Dr           </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1957</td></tr>\n",
       "\t<tr><td>22178505</td><td>31/03/2019 23:11</td><td>31/03/2019 23:20</td><td>1646</td><td>552</td><td>111</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; Huron St             </span></td><td>301</td><td><span style=white-space:pre-wrap>Clark St &amp; Schiller St              </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1994</td></tr>\n",
       "\t<tr><td>22178506</td><td>31/03/2019 23:15</td><td>31/03/2019 23:20</td><td> 632</td><td>274</td><td> 16</td><td><span style=white-space:pre-wrap>Paulina Ave &amp; North Ave            </span></td><td>158</td><td><span style=white-space:pre-wrap>Milwaukee Ave &amp; Wabansia Ave        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1991</td></tr>\n",
       "\t<tr><td>22178507</td><td>31/03/2019 23:16</td><td>31/03/2019 23:22</td><td>1537</td><td>345</td><td>173</td><td>Mies van der Rohe Way &amp; Chicago Ave</td><td>172</td><td><span style=white-space:pre-wrap>Rush St &amp; Cedar St                  </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1980</td></tr>\n",
       "\t<tr><td>22178508</td><td>31/03/2019 23:18</td><td>31/03/2019 23:30</td><td>1952</td><td>718</td><td>301</td><td><span style=white-space:pre-wrap>Clark St &amp; Schiller St             </span></td><td>210</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St           </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1988</td></tr>\n",
       "\t<tr><td>22178509</td><td>31/03/2019 23:20</td><td>31/03/2019 23:28</td><td>5331</td><td>456</td><td>115</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Wellington Ave     </span></td><td>313</td><td><span style=white-space:pre-wrap>Lakeview Ave &amp; Fullerton Pkwy       </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1987</td></tr>\n",
       "\t<tr><td>22178510</td><td>31/03/2019 23:21</td><td>31/03/2019 23:25</td><td><span style=white-space:pre-wrap>  67</span></td><td>245</td><td>325</td><td><span style=white-space:pre-wrap>Clark St &amp; Winnemac Ave            </span></td><td>464</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Foster Ave              </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1983</td></tr>\n",
       "\t<tr><td>22178515</td><td>31/03/2019 23:26</td><td>31/03/2019 23:37</td><td>2965</td><td>684</td><td>403</td><td><span style=white-space:pre-wrap>Wentworth Ave &amp; 33rd St            </span></td><td>263</td><td><span style=white-space:pre-wrap>Rhodes Ave &amp; 32nd St                </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1984</td></tr>\n",
       "\t<tr><td>22178516</td><td>31/03/2019 23:31</td><td>31/03/2019 23:35</td><td>5747</td><td>239</td><td>309</td><td><span style=white-space:pre-wrap>Leavitt St &amp; Armitage Ave          </span></td><td>219</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Cortland St             </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1970</td></tr>\n",
       "\t<tr><td>22178517</td><td>31/03/2019 23:32</td><td>31/03/2019 23:37</td><td>2846</td><td>296</td><td>181</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Illinois St           </span></td><td> 24</td><td><span style=white-space:pre-wrap>Fairbanks Ct &amp; Grand Ave            </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA    </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>22178518</td><td>31/03/2019 23:33</td><td>31/03/2019 23:43</td><td>2772</td><td>613</td><td>210</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St          </span></td><td>210</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St           </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1972</td></tr>\n",
       "\t<tr><td>22178519</td><td>31/03/2019 23:33</td><td>31/03/2019 23:37</td><td>4304</td><td>266</td><td>181</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Illinois St           </span></td><td> 24</td><td><span style=white-space:pre-wrap>Fairbanks Ct &amp; Grand Ave            </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA    </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>22178520</td><td>31/03/2019 23:34</td><td>31/03/2019 23:38</td><td> 667</td><td>239</td><td>199</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave             </span></td><td> 26</td><td><span style=white-space:pre-wrap>McClurg Ct &amp; Illinois St            </span></td><td>Subscriber</td><td>Female</td><td>1984</td></tr>\n",
       "\t<tr><td>22178521</td><td>31/03/2019 23:39</td><td>31/03/2019 23:41</td><td>4814</td><td>113</td><td>198</td><td><span style=white-space:pre-wrap>Green St &amp; Madison St              </span></td><td>233</td><td><span style=white-space:pre-wrap>Sangamon St &amp; Washington Blvd (*)   </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1971</td></tr>\n",
       "\t<tr><td>22178522</td><td>31/03/2019 23:47</td><td>31/03/2019 23:51</td><td>3873</td><td>270</td><td> 69</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Pierce Ave             </span></td><td>183</td><td>Damen Ave &amp; Thomas St (Augusta Blvd)</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1985</td></tr>\n",
       "\t<tr><td>22178524</td><td>31/03/2019 23:51</td><td>01/04/2019 00:04</td><td>1501</td><td>757</td><td> 38</td><td><span style=white-space:pre-wrap>Clark St &amp; Lake St                 </span></td><td> 29</td><td><span style=white-space:pre-wrap>Noble St &amp; Milwaukee Ave            </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1993</td></tr>\n",
       "\t<tr><td>22178525</td><td>31/03/2019 23:52</td><td>31/03/2019 23:58</td><td>3270</td><td>332</td><td>129</td><td><span style=white-space:pre-wrap>Blue Island Ave &amp; 18th St          </span></td><td>202</td><td><span style=white-space:pre-wrap>Halsted St &amp; 18th St                </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td></tr>\n",
       "\t<tr><td>22178526</td><td>31/03/2019 23:52</td><td>01/04/2019 00:06</td><td>3584</td><td>846</td><td>283</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Jackson Blvd          </span></td><td>273</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 18th St              </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1984</td></tr>\n",
       "\t<tr><td>22178527</td><td>31/03/2019 23:53</td><td>31/03/2019 23:56</td><td>4384</td><td>178</td><td>321</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; 9th St                </span></td><td> 39</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Adams St               </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1969</td></tr>\n",
       "\t<tr><td>22178528</td><td>31/03/2019 23:53</td><td>01/04/2019 00:01</td><td>5589</td><td>448</td><td>248</td><td><span style=white-space:pre-wrap>Woodlawn Ave &amp; 55th St             </span></td><td>247</td><td><span style=white-space:pre-wrap>Shore Dr &amp; 55th St                  </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A spec\\_tbl\\_df: 365069 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & tripduration & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual & gender & birthyear\\\\\n",
       " <dbl> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 21742443 & 01/01/2019 00:04 & 01/01/2019 00:11 & 2167 &  390 & 199 & Wabash Ave \\& Grand Ave              &  84 & Milwaukee Ave \\& Grand Ave      & Subscriber & Male   & 1989\\\\\n",
       "\t 21742444 & 01/01/2019 00:08 & 01/01/2019 00:15 & 4386 &  441 &  44 & State St \\& Randolph St              & 624 & Dearborn St \\& Van Buren St (*) & Subscriber & Female & 1990\\\\\n",
       "\t 21742445 & 01/01/2019 00:13 & 01/01/2019 00:27 & 1524 &  829 &  15 & Racine Ave \\& 18th St                & 644 & Western Ave \\& Fillmore St (*)  & Subscriber & Female & 1994\\\\\n",
       "\t 21742446 & 01/01/2019 00:13 & 01/01/2019 00:43 &  252 & 1783 & 123 & California Ave \\& Milwaukee Ave      & 176 & Clark St \\& Elm St              & Subscriber & Male   & 1993\\\\\n",
       "\t 21742447 & 01/01/2019 00:14 & 01/01/2019 00:20 & 1170 &  364 & 173 & Mies van der Rohe Way \\& Chicago Ave &  35 & Streeter Dr \\& Grand Ave        & Subscriber & Male   & 1994\\\\\n",
       "\t 21742448 & 01/01/2019 00:15 & 01/01/2019 00:19 & 2437 &  216 &  98 & LaSalle St \\& Washington St          &  49 & Dearborn St \\& Monroe St        & Subscriber & Female & 1983\\\\\n",
       "\t 21742449 & 01/01/2019 00:16 & 01/01/2019 00:19 & 2708 &  177 &  98 & LaSalle St \\& Washington St          &  49 & Dearborn St \\& Monroe St        & Subscriber & Male   & 1984\\\\\n",
       "\t 21742450 & 01/01/2019 00:18 & 01/01/2019 00:20 & 2796 &  100 & 211 & St. Clair St \\& Erie St              & 142 & McClurg Ct \\& Erie St           & Subscriber & Male   & 1990\\\\\n",
       "\t 21742451 & 01/01/2019 00:18 & 01/01/2019 00:47 & 6205 & 1727 & 150 & Fort Dearborn Dr \\& 31st St          & 148 & State St \\& 33rd St             & Subscriber & Male   & 1995\\\\\n",
       "\t 21742452 & 01/01/2019 00:19 & 01/01/2019 00:24 & 3939 &  336 & 268 & Lake Shore Dr \\& North Blvd          & 141 & Clark St \\& Lincoln Ave         & Subscriber & Male   & 1996\\\\\n",
       "\t 21742453 & 01/01/2019 00:20 & 01/01/2019 00:35 & 6243 &  886 & 299 & Halsted St \\& Roscoe St              & 295 & Broadway \\& Argyle St           & Subscriber & Male   & 1994\\\\\n",
       "\t 21742454 & 01/01/2019 00:21 & 01/01/2019 00:32 & 6300 &  653 & 204 & Prairie Ave \\& Garfield Blvd         & 420 & Ellis Ave \\& 55th St            & Subscriber & Female & 1994\\\\\n",
       "\t 21742455 & 01/01/2019 00:23 & 01/01/2019 00:33 & 3029 &  601 &  90 & Millennium Park                     & 255 & Indiana Ave \\& Roosevelt Rd     & Subscriber & Male   & 1986\\\\\n",
       "\t 21742456 & 01/01/2019 00:23 & 01/01/2019 00:33 &   84 &  562 &  90 & Millennium Park                     & 255 & Indiana Ave \\& Roosevelt Rd     & Customer   & Female & 1990\\\\\n",
       "\t 21742457 & 01/01/2019 00:23 & 01/01/2019 00:39 & 5019 &  906 & 289 & Wells St \\& Concord Ln               & 324 & Stockton Dr \\& Wrightwood Ave   & Subscriber & Female & 1989\\\\\n",
       "\t 21742458 & 01/01/2019 00:24 & 01/01/2019 00:39 & 5526 &  892 & 289 & Wells St \\& Concord Ln               & 324 & Stockton Dr \\& Wrightwood Ave   & Subscriber & Female & 1989\\\\\n",
       "\t 21742459 & 01/01/2019 00:24 & 01/01/2019 00:31 & 3373 &  407 & 152 & Lincoln Ave \\& Diversey Pkwy         & 166 & Ashland Ave \\& Wrightwood Ave   & Subscriber & Male   & 1967\\\\\n",
       "\t 21742460 & 01/01/2019 00:24 & 01/01/2019 00:47 & 5777 & 1356 & 268 & Lake Shore Dr \\& North Blvd          & 319 & Greenview Ave \\& Diversey Pkwy  & Customer   & Female & 1990\\\\\n",
       "\t 21742461 & 01/01/2019 00:25 & 01/01/2019 00:27 & 3940 &  102 &  35 & Streeter Dr \\& Grand Ave             &  35 & Streeter Dr \\& Grand Ave        & Subscriber & Male   & 1985\\\\\n",
       "\t 21742463 & 01/01/2019 00:29 & 01/01/2019 01:08 & 3914 & 2333 &  35 & Streeter Dr \\& Grand Ave             &  39 & Wabash Ave \\& Adams St          & Customer   & NA     &   NA\\\\\n",
       "\t 21742464 & 01/01/2019 00:29 & 01/01/2019 00:45 &  140 &  960 &  47 & State St \\& Kinzie St                & 111 & Sedgwick St \\& Huron St         & Subscriber & Male   & 1957\\\\\n",
       "\t 21742465 & 01/01/2019 00:29 & 01/01/2019 01:07 & 3355 & 2301 &  35 & Streeter Dr \\& Grand Ave             &  39 & Wabash Ave \\& Adams St          & Customer   & NA     &   NA\\\\\n",
       "\t 21742466 & 01/01/2019 00:29 & 01/01/2019 00:49 & 5026 & 1168 &  85 & Michigan Ave \\& Oak St               & 329 & Lake Shore Dr \\& Diversey Pkwy  & Subscriber & Male   & 1959\\\\\n",
       "\t 21742467 & 01/01/2019 00:30 & 01/01/2019 00:38 & 1998 &  474 & 289 & Wells St \\& Concord Ln               & 313 & Lakeview Ave \\& Fullerton Pkwy  & Subscriber & Male   & 1994\\\\\n",
       "\t 21742468 & 01/01/2019 00:33 & 01/01/2019 00:50 & 2630 & 1036 &  13 & Wilton Ave \\& Diversey Pkwy          &  61 & Wood St \\& Milwaukee Ave        & Subscriber & Male   & 1991\\\\\n",
       "\t 21742469 & 01/01/2019 00:34 & 01/01/2019 00:38 & 3722 &  230 & 520 & Greenview Ave \\& Jarvis Ave          & 523 & Eastlake Ter \\& Rogers Ave      & Subscriber & Male   & 1961\\\\\n",
       "\t 21742471 & 01/01/2019 00:38 & 01/01/2019 00:50 & 1166 &  747 & 256 & Broadway \\& Sheridan Rd              & 297 & Paulina St \\& Montrose Ave      & Subscriber & Male   & 1968\\\\\n",
       "\t 21742472 & 01/01/2019 00:38 & 01/01/2019 00:50 & 1704 &  711 & 256 & Broadway \\& Sheridan Rd              & 297 & Paulina St \\& Montrose Ave      & Subscriber & Male   & 1964\\\\\n",
       "\t 21742473 & 01/01/2019 00:40 & 01/01/2019 00:49 & 1476 &  553 & 254 & Pine Grove Ave \\& Irving Park Rd     & 465 & Marine Dr \\& Ainslie St         & Subscriber & Male   & 1990\\\\\n",
       "\t 21742474 & 01/01/2019 00:41 & 01/01/2019 00:50 & 4614 &  521 &  66 & Clinton St \\& Lake St                &  52 & Michigan Ave \\& Lake St         & Subscriber & Male   & 1994\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 22178488 & 31/03/2019 22:51 & 31/03/2019 22:54 & 4602 & 178 & 460 & Clark St \\& Bryn Mawr Ave            & 461 & Broadway \\& Ridge Ave                 & Subscriber & Male   & 1986\\\\\n",
       "\t 22178489 & 31/03/2019 22:54 & 31/03/2019 23:02 & 4151 & 529 &  47 & State St \\& Kinzie St                &  26 & McClurg Ct \\& Illinois St             & Subscriber & Male   & 1990\\\\\n",
       "\t 22178490 & 31/03/2019 22:55 & 31/03/2019 23:02 & 3833 & 402 & 108 & Halsted St \\& Polk St                &  19 & Loomis St \\& Taylor St (*)            & Subscriber & Male   & 1992\\\\\n",
       "\t 22178491 & 31/03/2019 22:58 & 31/03/2019 23:06 & 1374 & 492 & 108 & Halsted St \\& Polk St                &  41 & Federal St \\& Polk St                 & Subscriber & Male   & 1992\\\\\n",
       "\t 22178492 & 31/03/2019 22:59 & 31/03/2019 23:01 & 3723 & 123 &  66 & Clinton St \\& Lake St                &  77 & Clinton St \\& Madison St              & Subscriber & Female & 1985\\\\\n",
       "\t 22178493 & 31/03/2019 23:00 & 31/03/2019 23:10 & 2331 & 635 &  51 & Clark St \\& Randolph St              & 364 & Larrabee St \\& Oak St                 & Subscriber & Male   & 1972\\\\\n",
       "\t 22178494 & 31/03/2019 23:00 & 31/03/2019 23:09 & 1312 & 532 &  98 & LaSalle St \\& Washington St          &  22 & May St \\& Taylor St                   & Customer   & Male   & 1993\\\\\n",
       "\t 22178495 & 31/03/2019 23:00 & 31/03/2019 23:13 & 6205 & 741 & 301 & Clark St \\& Schiller St              & 115 & Sheffield Ave \\& Wellington Ave       & Subscriber & Male   & 1988\\\\\n",
       "\t 22178502 & 31/03/2019 23:03 & 31/03/2019 23:15 & 3360 & 739 & 295 & Broadway \\& Argyle St                & 451 & Sheridan Rd \\& Loyola Ave             & Subscriber & Male   & 1992\\\\\n",
       "\t 22178503 & 31/03/2019 23:09 & 31/03/2019 23:19 & 6416 & 590 & 114 & Sheffield Ave \\& Waveland Ave        & 330 & Lincoln Ave \\& Addison St             & Subscriber & Female & 1985\\\\\n",
       "\t 22178504 & 31/03/2019 23:10 & 31/03/2019 23:21 & 3767 & 674 &  50 & Clark St \\& Ida B Wells Dr           &  50 & Clark St \\& Ida B Wells Dr            & Subscriber & Male   & 1957\\\\\n",
       "\t 22178505 & 31/03/2019 23:11 & 31/03/2019 23:20 & 1646 & 552 & 111 & Sedgwick St \\& Huron St              & 301 & Clark St \\& Schiller St               & Subscriber & Male   & 1994\\\\\n",
       "\t 22178506 & 31/03/2019 23:15 & 31/03/2019 23:20 &  632 & 274 &  16 & Paulina Ave \\& North Ave             & 158 & Milwaukee Ave \\& Wabansia Ave         & Subscriber & Male   & 1991\\\\\n",
       "\t 22178507 & 31/03/2019 23:16 & 31/03/2019 23:22 & 1537 & 345 & 173 & Mies van der Rohe Way \\& Chicago Ave & 172 & Rush St \\& Cedar St                   & Subscriber & Male   & 1980\\\\\n",
       "\t 22178508 & 31/03/2019 23:18 & 31/03/2019 23:30 & 1952 & 718 & 301 & Clark St \\& Schiller St              & 210 & Ashland Ave \\& Division St            & Subscriber & Male   & 1988\\\\\n",
       "\t 22178509 & 31/03/2019 23:20 & 31/03/2019 23:28 & 5331 & 456 & 115 & Sheffield Ave \\& Wellington Ave      & 313 & Lakeview Ave \\& Fullerton Pkwy        & Subscriber & Male   & 1987\\\\\n",
       "\t 22178510 & 31/03/2019 23:21 & 31/03/2019 23:25 &   67 & 245 & 325 & Clark St \\& Winnemac Ave             & 464 & Damen Ave \\& Foster Ave               & Subscriber & Male   & 1983\\\\\n",
       "\t 22178515 & 31/03/2019 23:26 & 31/03/2019 23:37 & 2965 & 684 & 403 & Wentworth Ave \\& 33rd St             & 263 & Rhodes Ave \\& 32nd St                 & Subscriber & Male   & 1984\\\\\n",
       "\t 22178516 & 31/03/2019 23:31 & 31/03/2019 23:35 & 5747 & 239 & 309 & Leavitt St \\& Armitage Ave           & 219 & Damen Ave \\& Cortland St              & Subscriber & Male   & 1970\\\\\n",
       "\t 22178517 & 31/03/2019 23:32 & 31/03/2019 23:37 & 2846 & 296 & 181 & LaSalle St \\& Illinois St            &  24 & Fairbanks Ct \\& Grand Ave             & Customer   & NA     &   NA\\\\\n",
       "\t 22178518 & 31/03/2019 23:33 & 31/03/2019 23:43 & 2772 & 613 & 210 & Ashland Ave \\& Division St           & 210 & Ashland Ave \\& Division St            & Subscriber & Male   & 1972\\\\\n",
       "\t 22178519 & 31/03/2019 23:33 & 31/03/2019 23:37 & 4304 & 266 & 181 & LaSalle St \\& Illinois St            &  24 & Fairbanks Ct \\& Grand Ave             & Customer   & NA     &   NA\\\\\n",
       "\t 22178520 & 31/03/2019 23:34 & 31/03/2019 23:38 &  667 & 239 & 199 & Wabash Ave \\& Grand Ave              &  26 & McClurg Ct \\& Illinois St             & Subscriber & Female & 1984\\\\\n",
       "\t 22178521 & 31/03/2019 23:39 & 31/03/2019 23:41 & 4814 & 113 & 198 & Green St \\& Madison St               & 233 & Sangamon St \\& Washington Blvd (*)    & Subscriber & Male   & 1971\\\\\n",
       "\t 22178522 & 31/03/2019 23:47 & 31/03/2019 23:51 & 3873 & 270 &  69 & Damen Ave \\& Pierce Ave              & 183 & Damen Ave \\& Thomas St (Augusta Blvd) & Subscriber & Male   & 1985\\\\\n",
       "\t 22178524 & 31/03/2019 23:51 & 01/04/2019 00:04 & 1501 & 757 &  38 & Clark St \\& Lake St                  &  29 & Noble St \\& Milwaukee Ave             & Subscriber & Male   & 1993\\\\\n",
       "\t 22178525 & 31/03/2019 23:52 & 31/03/2019 23:58 & 3270 & 332 & 129 & Blue Island Ave \\& 18th St           & 202 & Halsted St \\& 18th St                 & Subscriber & Male   & 1992\\\\\n",
       "\t 22178526 & 31/03/2019 23:52 & 01/04/2019 00:06 & 3584 & 846 & 283 & LaSalle St \\& Jackson Blvd           & 273 & Michigan Ave \\& 18th St               & Subscriber & Male   & 1984\\\\\n",
       "\t 22178527 & 31/03/2019 23:53 & 31/03/2019 23:56 & 4384 & 178 & 321 & Wabash Ave \\& 9th St                 &  39 & Wabash Ave \\& Adams St                & Subscriber & Male   & 1969\\\\\n",
       "\t 22178528 & 31/03/2019 23:53 & 01/04/2019 00:01 & 5589 & 448 & 248 & Woodlawn Ave \\& 55th St              & 247 & Shore Dr \\& 55th St                   & Subscriber & Male   & 1998\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A spec_tbl_df: 365069 × 12\n",
       "\n",
       "| ride_id &lt;dbl&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | rideable_type &lt;dbl&gt; | tripduration &lt;dbl&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | gender &lt;chr&gt; | birthyear &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 21742443 | 01/01/2019 00:04 | 01/01/2019 00:11 | 2167 |  390 | 199 | Wabash Ave &amp; Grand Ave              |  84 | Milwaukee Ave &amp; Grand Ave      | Subscriber | Male   | 1989 |\n",
       "| 21742444 | 01/01/2019 00:08 | 01/01/2019 00:15 | 4386 |  441 |  44 | State St &amp; Randolph St              | 624 | Dearborn St &amp; Van Buren St (*) | Subscriber | Female | 1990 |\n",
       "| 21742445 | 01/01/2019 00:13 | 01/01/2019 00:27 | 1524 |  829 |  15 | Racine Ave &amp; 18th St                | 644 | Western Ave &amp; Fillmore St (*)  | Subscriber | Female | 1994 |\n",
       "| 21742446 | 01/01/2019 00:13 | 01/01/2019 00:43 |  252 | 1783 | 123 | California Ave &amp; Milwaukee Ave      | 176 | Clark St &amp; Elm St              | Subscriber | Male   | 1993 |\n",
       "| 21742447 | 01/01/2019 00:14 | 01/01/2019 00:20 | 1170 |  364 | 173 | Mies van der Rohe Way &amp; Chicago Ave |  35 | Streeter Dr &amp; Grand Ave        | Subscriber | Male   | 1994 |\n",
       "| 21742448 | 01/01/2019 00:15 | 01/01/2019 00:19 | 2437 |  216 |  98 | LaSalle St &amp; Washington St          |  49 | Dearborn St &amp; Monroe St        | Subscriber | Female | 1983 |\n",
       "| 21742449 | 01/01/2019 00:16 | 01/01/2019 00:19 | 2708 |  177 |  98 | LaSalle St &amp; Washington St          |  49 | Dearborn St &amp; Monroe St        | Subscriber | Male   | 1984 |\n",
       "| 21742450 | 01/01/2019 00:18 | 01/01/2019 00:20 | 2796 |  100 | 211 | St. Clair St &amp; Erie St              | 142 | McClurg Ct &amp; Erie St           | Subscriber | Male   | 1990 |\n",
       "| 21742451 | 01/01/2019 00:18 | 01/01/2019 00:47 | 6205 | 1727 | 150 | Fort Dearborn Dr &amp; 31st St          | 148 | State St &amp; 33rd St             | Subscriber | Male   | 1995 |\n",
       "| 21742452 | 01/01/2019 00:19 | 01/01/2019 00:24 | 3939 |  336 | 268 | Lake Shore Dr &amp; North Blvd          | 141 | Clark St &amp; Lincoln Ave         | Subscriber | Male   | 1996 |\n",
       "| 21742453 | 01/01/2019 00:20 | 01/01/2019 00:35 | 6243 |  886 | 299 | Halsted St &amp; Roscoe St              | 295 | Broadway &amp; Argyle St           | Subscriber | Male   | 1994 |\n",
       "| 21742454 | 01/01/2019 00:21 | 01/01/2019 00:32 | 6300 |  653 | 204 | Prairie Ave &amp; Garfield Blvd         | 420 | Ellis Ave &amp; 55th St            | Subscriber | Female | 1994 |\n",
       "| 21742455 | 01/01/2019 00:23 | 01/01/2019 00:33 | 3029 |  601 |  90 | Millennium Park                     | 255 | Indiana Ave &amp; Roosevelt Rd     | Subscriber | Male   | 1986 |\n",
       "| 21742456 | 01/01/2019 00:23 | 01/01/2019 00:33 |   84 |  562 |  90 | Millennium Park                     | 255 | Indiana Ave &amp; Roosevelt Rd     | Customer   | Female | 1990 |\n",
       "| 21742457 | 01/01/2019 00:23 | 01/01/2019 00:39 | 5019 |  906 | 289 | Wells St &amp; Concord Ln               | 324 | Stockton Dr &amp; Wrightwood Ave   | Subscriber | Female | 1989 |\n",
       "| 21742458 | 01/01/2019 00:24 | 01/01/2019 00:39 | 5526 |  892 | 289 | Wells St &amp; Concord Ln               | 324 | Stockton Dr &amp; Wrightwood Ave   | Subscriber | Female | 1989 |\n",
       "| 21742459 | 01/01/2019 00:24 | 01/01/2019 00:31 | 3373 |  407 | 152 | Lincoln Ave &amp; Diversey Pkwy         | 166 | Ashland Ave &amp; Wrightwood Ave   | Subscriber | Male   | 1967 |\n",
       "| 21742460 | 01/01/2019 00:24 | 01/01/2019 00:47 | 5777 | 1356 | 268 | Lake Shore Dr &amp; North Blvd          | 319 | Greenview Ave &amp; Diversey Pkwy  | Customer   | Female | 1990 |\n",
       "| 21742461 | 01/01/2019 00:25 | 01/01/2019 00:27 | 3940 |  102 |  35 | Streeter Dr &amp; Grand Ave             |  35 | Streeter Dr &amp; Grand Ave        | Subscriber | Male   | 1985 |\n",
       "| 21742463 | 01/01/2019 00:29 | 01/01/2019 01:08 | 3914 | 2333 |  35 | Streeter Dr &amp; Grand Ave             |  39 | Wabash Ave &amp; Adams St          | Customer   | NA     |   NA |\n",
       "| 21742464 | 01/01/2019 00:29 | 01/01/2019 00:45 |  140 |  960 |  47 | State St &amp; Kinzie St                | 111 | Sedgwick St &amp; Huron St         | Subscriber | Male   | 1957 |\n",
       "| 21742465 | 01/01/2019 00:29 | 01/01/2019 01:07 | 3355 | 2301 |  35 | Streeter Dr &amp; Grand Ave             |  39 | Wabash Ave &amp; Adams St          | Customer   | NA     |   NA |\n",
       "| 21742466 | 01/01/2019 00:29 | 01/01/2019 00:49 | 5026 | 1168 |  85 | Michigan Ave &amp; Oak St               | 329 | Lake Shore Dr &amp; Diversey Pkwy  | Subscriber | Male   | 1959 |\n",
       "| 21742467 | 01/01/2019 00:30 | 01/01/2019 00:38 | 1998 |  474 | 289 | Wells St &amp; Concord Ln               | 313 | Lakeview Ave &amp; Fullerton Pkwy  | Subscriber | Male   | 1994 |\n",
       "| 21742468 | 01/01/2019 00:33 | 01/01/2019 00:50 | 2630 | 1036 |  13 | Wilton Ave &amp; Diversey Pkwy          |  61 | Wood St &amp; Milwaukee Ave        | Subscriber | Male   | 1991 |\n",
       "| 21742469 | 01/01/2019 00:34 | 01/01/2019 00:38 | 3722 |  230 | 520 | Greenview Ave &amp; Jarvis Ave          | 523 | Eastlake Ter &amp; Rogers Ave      | Subscriber | Male   | 1961 |\n",
       "| 21742471 | 01/01/2019 00:38 | 01/01/2019 00:50 | 1166 |  747 | 256 | Broadway &amp; Sheridan Rd              | 297 | Paulina St &amp; Montrose Ave      | Subscriber | Male   | 1968 |\n",
       "| 21742472 | 01/01/2019 00:38 | 01/01/2019 00:50 | 1704 |  711 | 256 | Broadway &amp; Sheridan Rd              | 297 | Paulina St &amp; Montrose Ave      | Subscriber | Male   | 1964 |\n",
       "| 21742473 | 01/01/2019 00:40 | 01/01/2019 00:49 | 1476 |  553 | 254 | Pine Grove Ave &amp; Irving Park Rd     | 465 | Marine Dr &amp; Ainslie St         | Subscriber | Male   | 1990 |\n",
       "| 21742474 | 01/01/2019 00:41 | 01/01/2019 00:50 | 4614 |  521 |  66 | Clinton St &amp; Lake St                |  52 | Michigan Ave &amp; Lake St         | Subscriber | Male   | 1994 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 22178488 | 31/03/2019 22:51 | 31/03/2019 22:54 | 4602 | 178 | 460 | Clark St &amp; Bryn Mawr Ave            | 461 | Broadway &amp; Ridge Ave                 | Subscriber | Male   | 1986 |\n",
       "| 22178489 | 31/03/2019 22:54 | 31/03/2019 23:02 | 4151 | 529 |  47 | State St &amp; Kinzie St                |  26 | McClurg Ct &amp; Illinois St             | Subscriber | Male   | 1990 |\n",
       "| 22178490 | 31/03/2019 22:55 | 31/03/2019 23:02 | 3833 | 402 | 108 | Halsted St &amp; Polk St                |  19 | Loomis St &amp; Taylor St (*)            | Subscriber | Male   | 1992 |\n",
       "| 22178491 | 31/03/2019 22:58 | 31/03/2019 23:06 | 1374 | 492 | 108 | Halsted St &amp; Polk St                |  41 | Federal St &amp; Polk St                 | Subscriber | Male   | 1992 |\n",
       "| 22178492 | 31/03/2019 22:59 | 31/03/2019 23:01 | 3723 | 123 |  66 | Clinton St &amp; Lake St                |  77 | Clinton St &amp; Madison St              | Subscriber | Female | 1985 |\n",
       "| 22178493 | 31/03/2019 23:00 | 31/03/2019 23:10 | 2331 | 635 |  51 | Clark St &amp; Randolph St              | 364 | Larrabee St &amp; Oak St                 | Subscriber | Male   | 1972 |\n",
       "| 22178494 | 31/03/2019 23:00 | 31/03/2019 23:09 | 1312 | 532 |  98 | LaSalle St &amp; Washington St          |  22 | May St &amp; Taylor St                   | Customer   | Male   | 1993 |\n",
       "| 22178495 | 31/03/2019 23:00 | 31/03/2019 23:13 | 6205 | 741 | 301 | Clark St &amp; Schiller St              | 115 | Sheffield Ave &amp; Wellington Ave       | Subscriber | Male   | 1988 |\n",
       "| 22178502 | 31/03/2019 23:03 | 31/03/2019 23:15 | 3360 | 739 | 295 | Broadway &amp; Argyle St                | 451 | Sheridan Rd &amp; Loyola Ave             | Subscriber | Male   | 1992 |\n",
       "| 22178503 | 31/03/2019 23:09 | 31/03/2019 23:19 | 6416 | 590 | 114 | Sheffield Ave &amp; Waveland Ave        | 330 | Lincoln Ave &amp; Addison St             | Subscriber | Female | 1985 |\n",
       "| 22178504 | 31/03/2019 23:10 | 31/03/2019 23:21 | 3767 | 674 |  50 | Clark St &amp; Ida B Wells Dr           |  50 | Clark St &amp; Ida B Wells Dr            | Subscriber | Male   | 1957 |\n",
       "| 22178505 | 31/03/2019 23:11 | 31/03/2019 23:20 | 1646 | 552 | 111 | Sedgwick St &amp; Huron St              | 301 | Clark St &amp; Schiller St               | Subscriber | Male   | 1994 |\n",
       "| 22178506 | 31/03/2019 23:15 | 31/03/2019 23:20 |  632 | 274 |  16 | Paulina Ave &amp; North Ave             | 158 | Milwaukee Ave &amp; Wabansia Ave         | Subscriber | Male   | 1991 |\n",
       "| 22178507 | 31/03/2019 23:16 | 31/03/2019 23:22 | 1537 | 345 | 173 | Mies van der Rohe Way &amp; Chicago Ave | 172 | Rush St &amp; Cedar St                   | Subscriber | Male   | 1980 |\n",
       "| 22178508 | 31/03/2019 23:18 | 31/03/2019 23:30 | 1952 | 718 | 301 | Clark St &amp; Schiller St              | 210 | Ashland Ave &amp; Division St            | Subscriber | Male   | 1988 |\n",
       "| 22178509 | 31/03/2019 23:20 | 31/03/2019 23:28 | 5331 | 456 | 115 | Sheffield Ave &amp; Wellington Ave      | 313 | Lakeview Ave &amp; Fullerton Pkwy        | Subscriber | Male   | 1987 |\n",
       "| 22178510 | 31/03/2019 23:21 | 31/03/2019 23:25 |   67 | 245 | 325 | Clark St &amp; Winnemac Ave             | 464 | Damen Ave &amp; Foster Ave               | Subscriber | Male   | 1983 |\n",
       "| 22178515 | 31/03/2019 23:26 | 31/03/2019 23:37 | 2965 | 684 | 403 | Wentworth Ave &amp; 33rd St             | 263 | Rhodes Ave &amp; 32nd St                 | Subscriber | Male   | 1984 |\n",
       "| 22178516 | 31/03/2019 23:31 | 31/03/2019 23:35 | 5747 | 239 | 309 | Leavitt St &amp; Armitage Ave           | 219 | Damen Ave &amp; Cortland St              | Subscriber | Male   | 1970 |\n",
       "| 22178517 | 31/03/2019 23:32 | 31/03/2019 23:37 | 2846 | 296 | 181 | LaSalle St &amp; Illinois St            |  24 | Fairbanks Ct &amp; Grand Ave             | Customer   | NA     |   NA |\n",
       "| 22178518 | 31/03/2019 23:33 | 31/03/2019 23:43 | 2772 | 613 | 210 | Ashland Ave &amp; Division St           | 210 | Ashland Ave &amp; Division St            | Subscriber | Male   | 1972 |\n",
       "| 22178519 | 31/03/2019 23:33 | 31/03/2019 23:37 | 4304 | 266 | 181 | LaSalle St &amp; Illinois St            |  24 | Fairbanks Ct &amp; Grand Ave             | Customer   | NA     |   NA |\n",
       "| 22178520 | 31/03/2019 23:34 | 31/03/2019 23:38 |  667 | 239 | 199 | Wabash Ave &amp; Grand Ave              |  26 | McClurg Ct &amp; Illinois St             | Subscriber | Female | 1984 |\n",
       "| 22178521 | 31/03/2019 23:39 | 31/03/2019 23:41 | 4814 | 113 | 198 | Green St &amp; Madison St               | 233 | Sangamon St &amp; Washington Blvd (*)    | Subscriber | Male   | 1971 |\n",
       "| 22178522 | 31/03/2019 23:47 | 31/03/2019 23:51 | 3873 | 270 |  69 | Damen Ave &amp; Pierce Ave              | 183 | Damen Ave &amp; Thomas St (Augusta Blvd) | Subscriber | Male   | 1985 |\n",
       "| 22178524 | 31/03/2019 23:51 | 01/04/2019 00:04 | 1501 | 757 |  38 | Clark St &amp; Lake St                  |  29 | Noble St &amp; Milwaukee Ave             | Subscriber | Male   | 1993 |\n",
       "| 22178525 | 31/03/2019 23:52 | 31/03/2019 23:58 | 3270 | 332 | 129 | Blue Island Ave &amp; 18th St           | 202 | Halsted St &amp; 18th St                 | Subscriber | Male   | 1992 |\n",
       "| 22178526 | 31/03/2019 23:52 | 01/04/2019 00:06 | 3584 | 846 | 283 | LaSalle St &amp; Jackson Blvd           | 273 | Michigan Ave &amp; 18th St               | Subscriber | Male   | 1984 |\n",
       "| 22178527 | 31/03/2019 23:53 | 31/03/2019 23:56 | 4384 | 178 | 321 | Wabash Ave &amp; 9th St                 |  39 | Wabash Ave &amp; Adams St                | Subscriber | Male   | 1969 |\n",
       "| 22178528 | 31/03/2019 23:53 | 01/04/2019 00:01 | 5589 | 448 | 248 | Woodlawn Ave &amp; 55th St              | 247 | Shore Dr &amp; 55th St                   | Subscriber | Male   | 1998 |\n",
       "\n"
      ],
      "text/plain": [
       "       ride_id  started_at       ended_at         rideable_type tripduration\n",
       "1      21742443 01/01/2019 00:04 01/01/2019 00:11 2167           390        \n",
       "2      21742444 01/01/2019 00:08 01/01/2019 00:15 4386           441        \n",
       "3      21742445 01/01/2019 00:13 01/01/2019 00:27 1524           829        \n",
       "4      21742446 01/01/2019 00:13 01/01/2019 00:43  252          1783        \n",
       "5      21742447 01/01/2019 00:14 01/01/2019 00:20 1170           364        \n",
       "6      21742448 01/01/2019 00:15 01/01/2019 00:19 2437           216        \n",
       "7      21742449 01/01/2019 00:16 01/01/2019 00:19 2708           177        \n",
       "8      21742450 01/01/2019 00:18 01/01/2019 00:20 2796           100        \n",
       "9      21742451 01/01/2019 00:18 01/01/2019 00:47 6205          1727        \n",
       "10     21742452 01/01/2019 00:19 01/01/2019 00:24 3939           336        \n",
       "11     21742453 01/01/2019 00:20 01/01/2019 00:35 6243           886        \n",
       "12     21742454 01/01/2019 00:21 01/01/2019 00:32 6300           653        \n",
       "13     21742455 01/01/2019 00:23 01/01/2019 00:33 3029           601        \n",
       "14     21742456 01/01/2019 00:23 01/01/2019 00:33   84           562        \n",
       "15     21742457 01/01/2019 00:23 01/01/2019 00:39 5019           906        \n",
       "16     21742458 01/01/2019 00:24 01/01/2019 00:39 5526           892        \n",
       "17     21742459 01/01/2019 00:24 01/01/2019 00:31 3373           407        \n",
       "18     21742460 01/01/2019 00:24 01/01/2019 00:47 5777          1356        \n",
       "19     21742461 01/01/2019 00:25 01/01/2019 00:27 3940           102        \n",
       "20     21742463 01/01/2019 00:29 01/01/2019 01:08 3914          2333        \n",
       "21     21742464 01/01/2019 00:29 01/01/2019 00:45  140           960        \n",
       "22     21742465 01/01/2019 00:29 01/01/2019 01:07 3355          2301        \n",
       "23     21742466 01/01/2019 00:29 01/01/2019 00:49 5026          1168        \n",
       "24     21742467 01/01/2019 00:30 01/01/2019 00:38 1998           474        \n",
       "25     21742468 01/01/2019 00:33 01/01/2019 00:50 2630          1036        \n",
       "26     21742469 01/01/2019 00:34 01/01/2019 00:38 3722           230        \n",
       "27     21742471 01/01/2019 00:38 01/01/2019 00:50 1166           747        \n",
       "28     21742472 01/01/2019 00:38 01/01/2019 00:50 1704           711        \n",
       "29     21742473 01/01/2019 00:40 01/01/2019 00:49 1476           553        \n",
       "30     21742474 01/01/2019 00:41 01/01/2019 00:50 4614           521        \n",
       "⋮      ⋮        ⋮                ⋮                ⋮             ⋮           \n",
       "365040 22178488 31/03/2019 22:51 31/03/2019 22:54 4602          178         \n",
       "365041 22178489 31/03/2019 22:54 31/03/2019 23:02 4151          529         \n",
       "365042 22178490 31/03/2019 22:55 31/03/2019 23:02 3833          402         \n",
       "365043 22178491 31/03/2019 22:58 31/03/2019 23:06 1374          492         \n",
       "365044 22178492 31/03/2019 22:59 31/03/2019 23:01 3723          123         \n",
       "365045 22178493 31/03/2019 23:00 31/03/2019 23:10 2331          635         \n",
       "365046 22178494 31/03/2019 23:00 31/03/2019 23:09 1312          532         \n",
       "365047 22178495 31/03/2019 23:00 31/03/2019 23:13 6205          741         \n",
       "365048 22178502 31/03/2019 23:03 31/03/2019 23:15 3360          739         \n",
       "365049 22178503 31/03/2019 23:09 31/03/2019 23:19 6416          590         \n",
       "365050 22178504 31/03/2019 23:10 31/03/2019 23:21 3767          674         \n",
       "365051 22178505 31/03/2019 23:11 31/03/2019 23:20 1646          552         \n",
       "365052 22178506 31/03/2019 23:15 31/03/2019 23:20  632          274         \n",
       "365053 22178507 31/03/2019 23:16 31/03/2019 23:22 1537          345         \n",
       "365054 22178508 31/03/2019 23:18 31/03/2019 23:30 1952          718         \n",
       "365055 22178509 31/03/2019 23:20 31/03/2019 23:28 5331          456         \n",
       "365056 22178510 31/03/2019 23:21 31/03/2019 23:25   67          245         \n",
       "365057 22178515 31/03/2019 23:26 31/03/2019 23:37 2965          684         \n",
       "365058 22178516 31/03/2019 23:31 31/03/2019 23:35 5747          239         \n",
       "365059 22178517 31/03/2019 23:32 31/03/2019 23:37 2846          296         \n",
       "365060 22178518 31/03/2019 23:33 31/03/2019 23:43 2772          613         \n",
       "365061 22178519 31/03/2019 23:33 31/03/2019 23:37 4304          266         \n",
       "365062 22178520 31/03/2019 23:34 31/03/2019 23:38  667          239         \n",
       "365063 22178521 31/03/2019 23:39 31/03/2019 23:41 4814          113         \n",
       "365064 22178522 31/03/2019 23:47 31/03/2019 23:51 3873          270         \n",
       "365065 22178524 31/03/2019 23:51 01/04/2019 00:04 1501          757         \n",
       "365066 22178525 31/03/2019 23:52 31/03/2019 23:58 3270          332         \n",
       "365067 22178526 31/03/2019 23:52 01/04/2019 00:06 3584          846         \n",
       "365068 22178527 31/03/2019 23:53 31/03/2019 23:56 4384          178         \n",
       "365069 22178528 31/03/2019 23:53 01/04/2019 00:01 5589          448         \n",
       "       start_station_id start_station_name                  end_station_id\n",
       "1      199              Wabash Ave & Grand Ave               84           \n",
       "2       44              State St & Randolph St              624           \n",
       "3       15              Racine Ave & 18th St                644           \n",
       "4      123              California Ave & Milwaukee Ave      176           \n",
       "5      173              Mies van der Rohe Way & Chicago Ave  35           \n",
       "6       98              LaSalle St & Washington St           49           \n",
       "7       98              LaSalle St & Washington St           49           \n",
       "8      211              St. Clair St & Erie St              142           \n",
       "9      150              Fort Dearborn Dr & 31st St          148           \n",
       "10     268              Lake Shore Dr & North Blvd          141           \n",
       "11     299              Halsted St & Roscoe St              295           \n",
       "12     204              Prairie Ave & Garfield Blvd         420           \n",
       "13      90              Millennium Park                     255           \n",
       "14      90              Millennium Park                     255           \n",
       "15     289              Wells St & Concord Ln               324           \n",
       "16     289              Wells St & Concord Ln               324           \n",
       "17     152              Lincoln Ave & Diversey Pkwy         166           \n",
       "18     268              Lake Shore Dr & North Blvd          319           \n",
       "19      35              Streeter Dr & Grand Ave              35           \n",
       "20      35              Streeter Dr & Grand Ave              39           \n",
       "21      47              State St & Kinzie St                111           \n",
       "22      35              Streeter Dr & Grand Ave              39           \n",
       "23      85              Michigan Ave & Oak St               329           \n",
       "24     289              Wells St & Concord Ln               313           \n",
       "25      13              Wilton Ave & Diversey Pkwy           61           \n",
       "26     520              Greenview Ave & Jarvis Ave          523           \n",
       "27     256              Broadway & Sheridan Rd              297           \n",
       "28     256              Broadway & Sheridan Rd              297           \n",
       "29     254              Pine Grove Ave & Irving Park Rd     465           \n",
       "30      66              Clinton St & Lake St                 52           \n",
       "⋮      ⋮                ⋮                                   ⋮             \n",
       "365040 460              Clark St & Bryn Mawr Ave            461           \n",
       "365041  47              State St & Kinzie St                 26           \n",
       "365042 108              Halsted St & Polk St                 19           \n",
       "365043 108              Halsted St & Polk St                 41           \n",
       "365044  66              Clinton St & Lake St                 77           \n",
       "365045  51              Clark St & Randolph St              364           \n",
       "365046  98              LaSalle St & Washington St           22           \n",
       "365047 301              Clark St & Schiller St              115           \n",
       "365048 295              Broadway & Argyle St                451           \n",
       "365049 114              Sheffield Ave & Waveland Ave        330           \n",
       "365050  50              Clark St & Ida B Wells Dr            50           \n",
       "365051 111              Sedgwick St & Huron St              301           \n",
       "365052  16              Paulina Ave & North Ave             158           \n",
       "365053 173              Mies van der Rohe Way & Chicago Ave 172           \n",
       "365054 301              Clark St & Schiller St              210           \n",
       "365055 115              Sheffield Ave & Wellington Ave      313           \n",
       "365056 325              Clark St & Winnemac Ave             464           \n",
       "365057 403              Wentworth Ave & 33rd St             263           \n",
       "365058 309              Leavitt St & Armitage Ave           219           \n",
       "365059 181              LaSalle St & Illinois St             24           \n",
       "365060 210              Ashland Ave & Division St           210           \n",
       "365061 181              LaSalle St & Illinois St             24           \n",
       "365062 199              Wabash Ave & Grand Ave               26           \n",
       "365063 198              Green St & Madison St               233           \n",
       "365064  69              Damen Ave & Pierce Ave              183           \n",
       "365065  38              Clark St & Lake St                   29           \n",
       "365066 129              Blue Island Ave & 18th St           202           \n",
       "365067 283              LaSalle St & Jackson Blvd           273           \n",
       "365068 321              Wabash Ave & 9th St                  39           \n",
       "365069 248              Woodlawn Ave & 55th St              247           \n",
       "       end_station_name                     member_casual gender birthyear\n",
       "1      Milwaukee Ave & Grand Ave            Subscriber    Male   1989     \n",
       "2      Dearborn St & Van Buren St (*)       Subscriber    Female 1990     \n",
       "3      Western Ave & Fillmore St (*)        Subscriber    Female 1994     \n",
       "4      Clark St & Elm St                    Subscriber    Male   1993     \n",
       "5      Streeter Dr & Grand Ave              Subscriber    Male   1994     \n",
       "6      Dearborn St & Monroe St              Subscriber    Female 1983     \n",
       "7      Dearborn St & Monroe St              Subscriber    Male   1984     \n",
       "8      McClurg Ct & Erie St                 Subscriber    Male   1990     \n",
       "9      State St & 33rd St                   Subscriber    Male   1995     \n",
       "10     Clark St & Lincoln Ave               Subscriber    Male   1996     \n",
       "11     Broadway & Argyle St                 Subscriber    Male   1994     \n",
       "12     Ellis Ave & 55th St                  Subscriber    Female 1994     \n",
       "13     Indiana Ave & Roosevelt Rd           Subscriber    Male   1986     \n",
       "14     Indiana Ave & Roosevelt Rd           Customer      Female 1990     \n",
       "15     Stockton Dr & Wrightwood Ave         Subscriber    Female 1989     \n",
       "16     Stockton Dr & Wrightwood Ave         Subscriber    Female 1989     \n",
       "17     Ashland Ave & Wrightwood Ave         Subscriber    Male   1967     \n",
       "18     Greenview Ave & Diversey Pkwy        Customer      Female 1990     \n",
       "19     Streeter Dr & Grand Ave              Subscriber    Male   1985     \n",
       "20     Wabash Ave & Adams St                Customer      NA       NA     \n",
       "21     Sedgwick St & Huron St               Subscriber    Male   1957     \n",
       "22     Wabash Ave & Adams St                Customer      NA       NA     \n",
       "23     Lake Shore Dr & Diversey Pkwy        Subscriber    Male   1959     \n",
       "24     Lakeview Ave & Fullerton Pkwy        Subscriber    Male   1994     \n",
       "25     Wood St & Milwaukee Ave              Subscriber    Male   1991     \n",
       "26     Eastlake Ter & Rogers Ave            Subscriber    Male   1961     \n",
       "27     Paulina St & Montrose Ave            Subscriber    Male   1968     \n",
       "28     Paulina St & Montrose Ave            Subscriber    Male   1964     \n",
       "29     Marine Dr & Ainslie St               Subscriber    Male   1990     \n",
       "30     Michigan Ave & Lake St               Subscriber    Male   1994     \n",
       "⋮      ⋮                                    ⋮             ⋮      ⋮        \n",
       "365040 Broadway & Ridge Ave                 Subscriber    Male   1986     \n",
       "365041 McClurg Ct & Illinois St             Subscriber    Male   1990     \n",
       "365042 Loomis St & Taylor St (*)            Subscriber    Male   1992     \n",
       "365043 Federal St & Polk St                 Subscriber    Male   1992     \n",
       "365044 Clinton St & Madison St              Subscriber    Female 1985     \n",
       "365045 Larrabee St & Oak St                 Subscriber    Male   1972     \n",
       "365046 May St & Taylor St                   Customer      Male   1993     \n",
       "365047 Sheffield Ave & Wellington Ave       Subscriber    Male   1988     \n",
       "365048 Sheridan Rd & Loyola Ave             Subscriber    Male   1992     \n",
       "365049 Lincoln Ave & Addison St             Subscriber    Female 1985     \n",
       "365050 Clark St & Ida B Wells Dr            Subscriber    Male   1957     \n",
       "365051 Clark St & Schiller St               Subscriber    Male   1994     \n",
       "365052 Milwaukee Ave & Wabansia Ave         Subscriber    Male   1991     \n",
       "365053 Rush St & Cedar St                   Subscriber    Male   1980     \n",
       "365054 Ashland Ave & Division St            Subscriber    Male   1988     \n",
       "365055 Lakeview Ave & Fullerton Pkwy        Subscriber    Male   1987     \n",
       "365056 Damen Ave & Foster Ave               Subscriber    Male   1983     \n",
       "365057 Rhodes Ave & 32nd St                 Subscriber    Male   1984     \n",
       "365058 Damen Ave & Cortland St              Subscriber    Male   1970     \n",
       "365059 Fairbanks Ct & Grand Ave             Customer      NA       NA     \n",
       "365060 Ashland Ave & Division St            Subscriber    Male   1972     \n",
       "365061 Fairbanks Ct & Grand Ave             Customer      NA       NA     \n",
       "365062 McClurg Ct & Illinois St             Subscriber    Female 1984     \n",
       "365063 Sangamon St & Washington Blvd (*)    Subscriber    Male   1971     \n",
       "365064 Damen Ave & Thomas St (Augusta Blvd) Subscriber    Male   1985     \n",
       "365065 Noble St & Milwaukee Ave             Subscriber    Male   1993     \n",
       "365066 Halsted St & 18th St                 Subscriber    Male   1992     \n",
       "365067 Michigan Ave & 18th St               Subscriber    Male   1984     \n",
       "365068 Wabash Ave & Adams St                Subscriber    Male   1969     \n",
       "365069 Shore Dr & 55th St                   Subscriber    Male   1998     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "(q1_2019 <- rename(q1_2019, ride_id = trip_id, rideable_type = bikeid, started_at = start_time,\n",
    "                   ended_at = end_time, start_station_name = from_station_name,\n",
    "                   start_station_id = from_station_id, end_station_name = to_station_name,\n",
    "                   end_station_id = to_station_id, member_casual = usertype))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fe47c3c0",
   "metadata": {
    "papermill": {
     "duration": 0.009191,
     "end_time": "2024-12-19T00:36:37.013332",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.004141",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Inspect the data frames and look for incongruencies"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "54b20326",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:37.034370Z",
     "iopub.status.busy": "2024-12-19T00:36:37.033032Z",
     "iopub.status.idle": "2024-12-19T00:36:37.107182Z",
     "shell.execute_reply": "2024-12-19T00:36:37.105207Z"
    },
    "papermill": {
     "duration": 0.086713,
     "end_time": "2024-12-19T00:36:37.109136",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.022423",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [365,069 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : num [1:365069] 21742443 21742444 21742445 21742446 21742447 ...\n",
      " $ started_at        : chr [1:365069] \"01/01/2019 00:04\" \"01/01/2019 00:08\" \"01/01/2019 00:13\" \"01/01/2019 00:13\" ...\n",
      " $ ended_at          : chr [1:365069] \"01/01/2019 00:11\" \"01/01/2019 00:15\" \"01/01/2019 00:27\" \"01/01/2019 00:43\" ...\n",
      " $ rideable_type     : num [1:365069] 2167 4386 1524 252 1170 ...\n",
      " $ tripduration      : num [1:365069] 390 441 829 1783 364 ...\n",
      " $ start_station_id  : num [1:365069] 199 44 15 123 173 98 98 211 150 268 ...\n",
      " $ start_station_name: chr [1:365069] \"Wabash Ave & Grand Ave\" \"State St & Randolph St\" \"Racine Ave & 18th St\" \"California Ave & Milwaukee Ave\" ...\n",
      " $ end_station_id    : num [1:365069] 84 624 644 176 35 49 49 142 148 141 ...\n",
      " $ end_station_name  : chr [1:365069] \"Milwaukee Ave & Grand Ave\" \"Dearborn St & Van Buren St (*)\" \"Western Ave & Fillmore St (*)\" \"Clark St & Elm St\" ...\n",
      " $ member_casual     : chr [1:365069] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n",
      " $ gender            : chr [1:365069] \"Male\" \"Female\" \"Female\" \"Male\" ...\n",
      " $ birthyear         : num [1:365069] 1989 1990 1994 1993 1994 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   trip_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_time = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_time = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   bikeid = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   tripduration = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   from_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   from_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   to_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   to_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   usertype = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   gender = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   birthyear = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [426,887 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:426887] \"EACB19130B0CDA4A\" \"8FED874C809DC021\" \"789F3C21E472CA96\" \"C9A388DAC6ABF313\" ...\n",
      " $ rideable_type     : chr [1:426887] \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : POSIXct[1:426887], format: \"2020-01-21 20:06:59\" \"2020-01-30 14:22:39\" ...\n",
      " $ ended_at          : POSIXct[1:426887], format: \"2020-01-21 20:14:30\" \"2020-01-30 14:26:22\" ...\n",
      " $ start_station_name: chr [1:426887] \"Western Ave & Leland Ave\" \"Clark St & Montrose Ave\" \"Broadway & Belmont Ave\" \"Clark St & Randolph St\" ...\n",
      " $ start_station_id  : num [1:426887] 239 234 296 51 66 212 96 96 212 38 ...\n",
      " $ end_station_name  : chr [1:426887] \"Clark St & Leland Ave\" \"Southport Ave & Irving Park Rd\" \"Wilton Ave & Belmont Ave\" \"Fairbanks Ct & Grand Ave\" ...\n",
      " $ end_station_id    : num [1:426887] 326 318 117 24 212 96 212 212 96 100 ...\n",
      " $ start_lat         : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:426887] -87.7 -87.7 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:426887] -87.7 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr [1:426887] \"member\" \"member\" \"member\" \"member\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(q1_2019)\n",
    "str(q1_2020)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "48184de7",
   "metadata": {
    "papermill": {
     "duration": 0.009346,
     "end_time": "2024-12-19T00:36:37.127912",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.118566",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Convert ride_id and rideable_type to character so that they can stack correctly"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "7fa64676",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:37.149128Z",
     "iopub.status.busy": "2024-12-19T00:36:37.148017Z",
     "iopub.status.idle": "2024-12-19T00:36:37.165670Z",
     "shell.execute_reply": "2024-12-19T00:36:37.164331Z"
    },
    "papermill": {
     "duration": 0.030604,
     "end_time": "2024-12-19T00:36:37.167793",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.137189",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "q1_2019 <- mutate(q1_2019, ride_id = as.character(ride_id),\n",
    "                  rideable_type = as.character(rideable_type))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f63171f",
   "metadata": {
    "papermill": {
     "duration": 0.009702,
     "end_time": "2024-12-19T00:36:37.187298",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.177596",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Stack individual quarter's data frames into one big data frame\n",
    "\n",
    "Joining the Datasets together (Data Aggregation)\n",
    "\n",
    "Would add the 2019 Q3, Q4 if had downloaded"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "7b8bdd84",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:37.208615Z",
     "iopub.status.busy": "2024-12-19T00:36:37.207485Z",
     "iopub.status.idle": "2024-12-19T00:36:41.990604Z",
     "shell.execute_reply": "2024-12-19T00:36:41.989186Z"
    },
    "papermill": {
     "duration": 4.796349,
     "end_time": "2024-12-19T00:36:41.993047",
     "exception": false,
     "start_time": "2024-12-19T00:36:37.196698",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      " POSIXct[1:365069], format: \"2001-01-20 19:00:04\" \"2001-01-20 19:00:08\" \"2001-01-20 19:00:13\" ...\n"
     ]
    }
   ],
   "source": [
    "# There was an error\n",
    "# The started_at column in q1_2019 is in a character datatype\n",
    "# Use the lubridate package to fix this\n",
    "library(lubridate)\n",
    "q1_2019$started_at <- ymd_hms(q1_2019$started_at)\n",
    "q1_2020$started_at <- ymd_hms(q1_2020$started_at)\n",
    "str(q1_2019$started_at)\n",
    "# same problem with ended_at station\n",
    "# Do the same as before but with end_station this time\n",
    "q1_2019$ended_at <- ymd_hms(q1_2019$ended_at)\n",
    "q1_2020$ended_at <- ymd_hms(q1_2020$ended_at)\n",
    "all_trips <- bind_rows(q1_2019, q1_2020)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3a1e8c24",
   "metadata": {
    "papermill": {
     "duration": 0.008937,
     "end_time": "2024-12-19T00:36:42.011373",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.002436",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Remove the lat, long, birthyear and gender fields as this data was dropped beginning in 2020"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "531c2277",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.032521Z",
     "iopub.status.busy": "2024-12-19T00:36:42.031322Z",
     "iopub.status.idle": "2024-12-19T00:36:42.044520Z",
     "shell.execute_reply": "2024-12-19T00:36:42.043212Z"
    },
    "papermill": {
     "duration": 0.026426,
     "end_time": "2024-12-19T00:36:42.047012",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.020586",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- all_trips %>% \n",
    "  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, \"tripduration\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bf61e121",
   "metadata": {
    "papermill": {
     "duration": 0.008997,
     "end_time": "2024-12-19T00:36:42.065274",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.056277",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 3: Clean up and add Data to prepare for Analysis\n",
    "\n",
    "Inspect the new table that has been created"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "90b40fcd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.086080Z",
     "iopub.status.busy": "2024-12-19T00:36:42.085000Z",
     "iopub.status.idle": "2024-12-19T00:36:42.098044Z",
     "shell.execute_reply": "2024-12-19T00:36:42.096271Z"
    },
    "papermill": {
     "duration": 0.025698,
     "end_time": "2024-12-19T00:36:42.099996",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.074298",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. 'start_station_id'\n",
       "6. 'start_station_name'\n",
       "7. 'end_station_id'\n",
       "8. 'end_station_name'\n",
       "9. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"ride_id\"            \"started_at\"         \"ended_at\"          \n",
       "[4] \"rideable_type\"      \"start_station_id\"   \"start_station_name\"\n",
       "[7] \"end_station_id\"     \"end_station_name\"   \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# List of Column names\n",
    "colnames(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "1241dbda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.121015Z",
     "iopub.status.busy": "2024-12-19T00:36:42.119902Z",
     "iopub.status.idle": "2024-12-19T00:36:42.133160Z",
     "shell.execute_reply": "2024-12-19T00:36:42.131396Z"
    },
    "papermill": {
     "duration": 0.02582,
     "end_time": "2024-12-19T00:36:42.135044",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.109224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "791956"
      ],
      "text/latex": [
       "791956"
      ],
      "text/markdown": [
       "791956"
      ],
      "text/plain": [
       "[1] 791956"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# How many Rows are in the data frame\n",
    "nrow(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "90e80fe7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.156625Z",
     "iopub.status.busy": "2024-12-19T00:36:42.155536Z",
     "iopub.status.idle": "2024-12-19T00:36:42.170048Z",
     "shell.execute_reply": "2024-12-19T00:36:42.168178Z"
    },
    "papermill": {
     "duration": 0.027549,
     "end_time": "2024-12-19T00:36:42.172061",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.144512",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>791956</li><li>9</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 791956\n",
       "\\item 9\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 791956\n",
       "2. 9\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 791956      9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# The dimensions of the data frame\n",
    "dim(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "e1ce8bf0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.217969Z",
     "iopub.status.busy": "2024-12-19T00:36:42.216890Z",
     "iopub.status.idle": "2024-12-19T00:36:42.261477Z",
     "shell.execute_reply": "2024-12-19T00:36:42.259783Z"
    },
    "papermill": {
     "duration": 0.081675,
     "end_time": "2024-12-19T00:36:42.263557",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.181882",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>21742443</td><td>2001-01-20 19:00:04</td><td>2001-01-20 19:00:11</td><td>2167</td><td>199</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave             </span></td><td> 84</td><td><span style=white-space:pre-wrap>Milwaukee Ave &amp; Grand Ave     </span></td><td>Subscriber</td></tr>\n",
       "\t<tr><td>21742444</td><td>2001-01-20 19:00:08</td><td>2001-01-20 19:00:15</td><td>4386</td><td> 44</td><td><span style=white-space:pre-wrap>State St &amp; Randolph St             </span></td><td>624</td><td>Dearborn St &amp; Van Buren St (*)</td><td>Subscriber</td></tr>\n",
       "\t<tr><td>21742445</td><td>2001-01-20 19:00:13</td><td>2001-01-20 19:00:27</td><td>1524</td><td> 15</td><td><span style=white-space:pre-wrap>Racine Ave &amp; 18th St               </span></td><td>644</td><td>Western Ave &amp; Fillmore St (*) </td><td>Subscriber</td></tr>\n",
       "\t<tr><td>21742446</td><td>2001-01-20 19:00:13</td><td>2001-01-20 19:00:43</td><td>252 </td><td>123</td><td><span style=white-space:pre-wrap>California Ave &amp; Milwaukee Ave     </span></td><td>176</td><td><span style=white-space:pre-wrap>Clark St &amp; Elm St             </span></td><td>Subscriber</td></tr>\n",
       "\t<tr><td>21742447</td><td>2001-01-20 19:00:14</td><td>2001-01-20 19:00:20</td><td>1170</td><td>173</td><td>Mies van der Rohe Way &amp; Chicago Ave</td><td> 35</td><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave       </span></td><td>Subscriber</td></tr>\n",
       "\t<tr><td>21742448</td><td>2001-01-20 19:00:15</td><td>2001-01-20 19:00:19</td><td>2437</td><td> 98</td><td><span style=white-space:pre-wrap>LaSalle St &amp; Washington St         </span></td><td> 49</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St       </span></td><td>Subscriber</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual\\\\\n",
       " <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 21742443 & 2001-01-20 19:00:04 & 2001-01-20 19:00:11 & 2167 & 199 & Wabash Ave \\& Grand Ave              &  84 & Milwaukee Ave \\& Grand Ave      & Subscriber\\\\\n",
       "\t 21742444 & 2001-01-20 19:00:08 & 2001-01-20 19:00:15 & 4386 &  44 & State St \\& Randolph St              & 624 & Dearborn St \\& Van Buren St (*) & Subscriber\\\\\n",
       "\t 21742445 & 2001-01-20 19:00:13 & 2001-01-20 19:00:27 & 1524 &  15 & Racine Ave \\& 18th St                & 644 & Western Ave \\& Fillmore St (*)  & Subscriber\\\\\n",
       "\t 21742446 & 2001-01-20 19:00:13 & 2001-01-20 19:00:43 & 252  & 123 & California Ave \\& Milwaukee Ave      & 176 & Clark St \\& Elm St              & Subscriber\\\\\n",
       "\t 21742447 & 2001-01-20 19:00:14 & 2001-01-20 19:00:20 & 1170 & 173 & Mies van der Rohe Way \\& Chicago Ave &  35 & Streeter Dr \\& Grand Ave        & Subscriber\\\\\n",
       "\t 21742448 & 2001-01-20 19:00:15 & 2001-01-20 19:00:19 & 2437 &  98 & LaSalle St \\& Washington St          &  49 & Dearborn St \\& Monroe St        & Subscriber\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| ride_id &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;chr&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 21742443 | 2001-01-20 19:00:04 | 2001-01-20 19:00:11 | 2167 | 199 | Wabash Ave &amp; Grand Ave              |  84 | Milwaukee Ave &amp; Grand Ave      | Subscriber |\n",
       "| 21742444 | 2001-01-20 19:00:08 | 2001-01-20 19:00:15 | 4386 |  44 | State St &amp; Randolph St              | 624 | Dearborn St &amp; Van Buren St (*) | Subscriber |\n",
       "| 21742445 | 2001-01-20 19:00:13 | 2001-01-20 19:00:27 | 1524 |  15 | Racine Ave &amp; 18th St                | 644 | Western Ave &amp; Fillmore St (*)  | Subscriber |\n",
       "| 21742446 | 2001-01-20 19:00:13 | 2001-01-20 19:00:43 | 252  | 123 | California Ave &amp; Milwaukee Ave      | 176 | Clark St &amp; Elm St              | Subscriber |\n",
       "| 21742447 | 2001-01-20 19:00:14 | 2001-01-20 19:00:20 | 1170 | 173 | Mies van der Rohe Way &amp; Chicago Ave |  35 | Streeter Dr &amp; Grand Ave        | Subscriber |\n",
       "| 21742448 | 2001-01-20 19:00:15 | 2001-01-20 19:00:19 | 2437 |  98 | LaSalle St &amp; Washington St          |  49 | Dearborn St &amp; Monroe St        | Subscriber |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type\n",
       "1 21742443 2001-01-20 19:00:04 2001-01-20 19:00:11 2167         \n",
       "2 21742444 2001-01-20 19:00:08 2001-01-20 19:00:15 4386         \n",
       "3 21742445 2001-01-20 19:00:13 2001-01-20 19:00:27 1524         \n",
       "4 21742446 2001-01-20 19:00:13 2001-01-20 19:00:43 252          \n",
       "5 21742447 2001-01-20 19:00:14 2001-01-20 19:00:20 1170         \n",
       "6 21742448 2001-01-20 19:00:15 2001-01-20 19:00:19 2437         \n",
       "  start_station_id start_station_name                  end_station_id\n",
       "1 199              Wabash Ave & Grand Ave               84           \n",
       "2  44              State St & Randolph St              624           \n",
       "3  15              Racine Ave & 18th St                644           \n",
       "4 123              California Ave & Milwaukee Ave      176           \n",
       "5 173              Mies van der Rohe Way & Chicago Ave  35           \n",
       "6  98              LaSalle St & Washington St           49           \n",
       "  end_station_name               member_casual\n",
       "1 Milwaukee Ave & Grand Ave      Subscriber   \n",
       "2 Dearborn St & Van Buren St (*) Subscriber   \n",
       "3 Western Ave & Fillmore St (*)  Subscriber   \n",
       "4 Clark St & Elm St              Subscriber   \n",
       "5 Streeter Dr & Grand Ave        Subscriber   \n",
       "6 Dearborn St & Monroe St        Subscriber   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6F4D221BDDFD943F</td><td>2020-03-10 10:40:27</td><td>2020-03-10 10:40:29</td><td>docked_bike</td><td>675</td><td>HQ QR                    </td><td>675</td><td>HQ QR                       </td><td>casual</td></tr>\n",
       "\t<tr><td>ADDAA33CEBCAE733</td><td>2020-03-10 10:40:06</td><td>2020-03-10 10:40:07</td><td>docked_bike</td><td>675</td><td>HQ QR                    </td><td>675</td><td>HQ QR                       </td><td>casual</td></tr>\n",
       "\t<tr><td>82B10FA3994BC66A</td><td>2020-03-07 15:25:55</td><td>2020-03-07 16:14:03</td><td>docked_bike</td><td>161</td><td><span style=white-space:pre-wrap>Rush St &amp; Superior St    </span></td><td>240</td><td>Sheridan Rd &amp; Irving Park Rd</td><td>member</td></tr>\n",
       "\t<tr><td>AA0D5AAA0B59C8AA</td><td>2020-03-01 13:12:38</td><td>2020-03-01 13:38:29</td><td>docked_bike</td><td>141</td><td><span style=white-space:pre-wrap>Clark St &amp; Lincoln Ave   </span></td><td>210</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St   </span></td><td>casual</td></tr>\n",
       "\t<tr><td>3296360A7BC20FB8</td><td>2020-03-07 18:02:45</td><td>2020-03-07 18:13:18</td><td>docked_bike</td><td>672</td><td>Franklin St &amp; Illinois St</td><td>264</td><td>Stetson Ave &amp; South Water St</td><td>member</td></tr>\n",
       "\t<tr><td>064EC7698E4FF9B3</td><td>2020-03-08 13:03:57</td><td>2020-03-08 13:32:27</td><td>docked_bike</td><td>110</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Erie St    </span></td><td> 85</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St       </span></td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual\\\\\n",
       " <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 6F4D221BDDFD943F & 2020-03-10 10:40:27 & 2020-03-10 10:40:29 & docked\\_bike & 675 & HQ QR                     & 675 & HQ QR                        & casual\\\\\n",
       "\t ADDAA33CEBCAE733 & 2020-03-10 10:40:06 & 2020-03-10 10:40:07 & docked\\_bike & 675 & HQ QR                     & 675 & HQ QR                        & casual\\\\\n",
       "\t 82B10FA3994BC66A & 2020-03-07 15:25:55 & 2020-03-07 16:14:03 & docked\\_bike & 161 & Rush St \\& Superior St     & 240 & Sheridan Rd \\& Irving Park Rd & member\\\\\n",
       "\t AA0D5AAA0B59C8AA & 2020-03-01 13:12:38 & 2020-03-01 13:38:29 & docked\\_bike & 141 & Clark St \\& Lincoln Ave    & 210 & Ashland Ave \\& Division St    & casual\\\\\n",
       "\t 3296360A7BC20FB8 & 2020-03-07 18:02:45 & 2020-03-07 18:13:18 & docked\\_bike & 672 & Franklin St \\& Illinois St & 264 & Stetson Ave \\& South Water St & member\\\\\n",
       "\t 064EC7698E4FF9B3 & 2020-03-08 13:03:57 & 2020-03-08 13:32:27 & docked\\_bike & 110 & Dearborn St \\& Erie St     &  85 & Michigan Ave \\& Oak St        & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| ride_id &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;chr&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 6F4D221BDDFD943F | 2020-03-10 10:40:27 | 2020-03-10 10:40:29 | docked_bike | 675 | HQ QR                     | 675 | HQ QR                        | casual |\n",
       "| ADDAA33CEBCAE733 | 2020-03-10 10:40:06 | 2020-03-10 10:40:07 | docked_bike | 675 | HQ QR                     | 675 | HQ QR                        | casual |\n",
       "| 82B10FA3994BC66A | 2020-03-07 15:25:55 | 2020-03-07 16:14:03 | docked_bike | 161 | Rush St &amp; Superior St     | 240 | Sheridan Rd &amp; Irving Park Rd | member |\n",
       "| AA0D5AAA0B59C8AA | 2020-03-01 13:12:38 | 2020-03-01 13:38:29 | docked_bike | 141 | Clark St &amp; Lincoln Ave    | 210 | Ashland Ave &amp; Division St    | casual |\n",
       "| 3296360A7BC20FB8 | 2020-03-07 18:02:45 | 2020-03-07 18:13:18 | docked_bike | 672 | Franklin St &amp; Illinois St | 264 | Stetson Ave &amp; South Water St | member |\n",
       "| 064EC7698E4FF9B3 | 2020-03-08 13:03:57 | 2020-03-08 13:32:27 | docked_bike | 110 | Dearborn St &amp; Erie St     |  85 | Michigan Ave &amp; Oak St        | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          started_at          ended_at            rideable_type\n",
       "1 6F4D221BDDFD943F 2020-03-10 10:40:27 2020-03-10 10:40:29 docked_bike  \n",
       "2 ADDAA33CEBCAE733 2020-03-10 10:40:06 2020-03-10 10:40:07 docked_bike  \n",
       "3 82B10FA3994BC66A 2020-03-07 15:25:55 2020-03-07 16:14:03 docked_bike  \n",
       "4 AA0D5AAA0B59C8AA 2020-03-01 13:12:38 2020-03-01 13:38:29 docked_bike  \n",
       "5 3296360A7BC20FB8 2020-03-07 18:02:45 2020-03-07 18:13:18 docked_bike  \n",
       "6 064EC7698E4FF9B3 2020-03-08 13:03:57 2020-03-08 13:32:27 docked_bike  \n",
       "  start_station_id start_station_name        end_station_id\n",
       "1 675              HQ QR                     675           \n",
       "2 675              HQ QR                     675           \n",
       "3 161              Rush St & Superior St     240           \n",
       "4 141              Clark St & Lincoln Ave    210           \n",
       "5 672              Franklin St & Illinois St 264           \n",
       "6 110              Dearborn St & Erie St      85           \n",
       "  end_station_name             member_casual\n",
       "1 HQ QR                        casual       \n",
       "2 HQ QR                        casual       \n",
       "3 Sheridan Rd & Irving Park Rd member       \n",
       "4 Ashland Ave & Division St    casual       \n",
       "5 Stetson Ave & South Water St member       \n",
       "6 Michigan Ave & Oak St        casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# First 6 Rows of the data frame\n",
    "head(all_trips)\n",
    "tail(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "a48fe43a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.287769Z",
     "iopub.status.busy": "2024-12-19T00:36:42.286595Z",
     "iopub.status.idle": "2024-12-19T00:36:42.307770Z",
     "shell.execute_reply": "2024-12-19T00:36:42.305772Z"
    },
    "papermill": {
     "duration": 0.035576,
     "end_time": "2024-12-19T00:36:42.309791",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.274215",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [791,956 × 9] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:791956] \"21742443\" \"21742444\" \"21742445\" \"21742446\" ...\n",
      " $ started_at        : POSIXct[1:791956], format: \"2001-01-20 19:00:04\" \"2001-01-20 19:00:08\" ...\n",
      " $ ended_at          : POSIXct[1:791956], format: \"2001-01-20 19:00:11\" \"2001-01-20 19:00:15\" ...\n",
      " $ rideable_type     : chr [1:791956] \"2167\" \"4386\" \"1524\" \"252\" ...\n",
      " $ start_station_id  : num [1:791956] 199 44 15 123 173 98 98 211 150 268 ...\n",
      " $ start_station_name: chr [1:791956] \"Wabash Ave & Grand Ave\" \"State St & Randolph St\" \"Racine Ave & 18th St\" \"California Ave & Milwaukee Ave\" ...\n",
      " $ end_station_id    : num [1:791956] 84 624 644 176 35 49 49 142 148 141 ...\n",
      " $ end_station_name  : chr [1:791956] \"Milwaukee Ave & Grand Ave\" \"Dearborn St & Van Buren St (*)\" \"Western Ave & Fillmore St (*)\" \"Clark St & Elm St\" ...\n",
      " $ member_casual     : chr [1:791956] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n"
     ]
    }
   ],
   "source": [
    "# List of Columns and data types\n",
    "str(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "0e0fbf1b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.332913Z",
     "iopub.status.busy": "2024-12-19T00:36:42.331766Z",
     "iopub.status.idle": "2024-12-19T00:36:42.759242Z",
     "shell.execute_reply": "2024-12-19T00:36:42.758159Z"
    },
    "papermill": {
     "duration": 0.440719,
     "end_time": "2024-12-19T00:36:42.760834",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.320115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id            started_at                    \n",
       " Length:791956      Min.   :2001-01-20 19:00:04.00  \n",
       " Class :character   1st Qu.:2016-03-20 19:13:41.00  \n",
       " Mode  :character   Median :2020-02-03 13:36:11.00  \n",
       "                    Mean   :2018-01-04 23:07:28.75  \n",
       "                    3rd Qu.:2020-03-09 12:17:46.50  \n",
       "                    Max.   :2031-03-20 19:23:53.00  \n",
       "                                                    \n",
       "    ended_at                      rideable_type      start_station_id\n",
       " Min.   :2001-01-20 19:00:11.00   Length:791956      Min.   :  2.0   \n",
       " 1st Qu.:2016-03-20 19:14:01.00   Class :character   1st Qu.: 77.0   \n",
       " Median :2020-02-03 13:58:15.50   Mode  :character   Median :174.0   \n",
       " Mean   :2018-01-05 01:07:52.65                      Mean   :204.4   \n",
       " 3rd Qu.:2020-03-09 12:34:02.50                      3rd Qu.:291.0   \n",
       " Max.   :2031-03-20 19:23:58.00                      Max.   :675.0   \n",
       "                                                                     \n",
       " start_station_name end_station_id  end_station_name   member_casual     \n",
       " Length:791956      Min.   :  2.0   Length:791956      Length:791956     \n",
       " Class :character   1st Qu.: 77.0   Class :character   Class :character  \n",
       " Mode  :character   Median :174.0   Mode  :character   Mode  :character  \n",
       "                    Mean   :204.4                                        \n",
       "                    3rd Qu.:291.0                                        \n",
       "                    Max.   :675.0                                        \n",
       "                    NA's   :1                                            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Statistical summary of the data (mainly for Numerics)\n",
    "summary(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "08762940",
   "metadata": {
    "papermill": {
     "duration": 0.009833,
     "end_time": "2024-12-19T00:36:42.780802",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.770969",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There are a few problems we will need to fix:\n",
    "\n",
    "1. In the \"member_casual\" column, there are two names for members (\"member\" and \"Subscriber\") and two names for casual riders (\"Customer\" and \"casual\"). We will need to consolidate that from four to two labels.\n",
    "\n",
    "2. The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data such as day, month, year. That provide additional opportunities to aggregate the data\n",
    "\n",
    "3. We will want to add a calculated field for length of ride since the 2020q1 data did not have the tripduration column. We will add \"ride_length\" to the entire data frame for consistency.\n",
    "\n",
    "4. There are some rides where tripduration shows up as a negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides\n",
    "\n",
    "### Problem (1)\n",
    "\n",
    "In the \"member_casual\" column, replace \"Subscriber\" with \"member\" and \"Customer\" with \"casual\"\n",
    "Before 2020, Divvy used different labels for these two types of riders, we will want to make our data frame consistent with their current nomenclature\n",
    "Note: \"Level\" is a special property of a column that is retained even if a subset does not contain any values from a specific level\n",
    "Start by seeing how many observations fall under each usertype"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "a61d5895",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.802989Z",
     "iopub.status.busy": "2024-12-19T00:36:42.801945Z",
     "iopub.status.idle": "2024-12-19T00:36:42.851068Z",
     "shell.execute_reply": "2024-12-19T00:36:42.849908Z"
    },
    "papermill": {
     "duration": 0.061972,
     "end_time": "2024-12-19T00:36:42.852476",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.790504",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "    casual   Customer     member Subscriber \n",
       "     48480      23163     378407     341906 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(all_trips$member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "33875bd0",
   "metadata": {
    "papermill": {
     "duration": 0.009539,
     "end_time": "2024-12-19T00:36:42.871965",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.862426",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Reassign to the desired values (we will go with the current 2020 labels)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "00e8c4c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:42.895361Z",
     "iopub.status.busy": "2024-12-19T00:36:42.894276Z",
     "iopub.status.idle": "2024-12-19T00:36:43.020762Z",
     "shell.execute_reply": "2024-12-19T00:36:43.019437Z"
    },
    "papermill": {
     "duration": 0.13948,
     "end_time": "2024-12-19T00:36:43.022342",
     "exception": false,
     "start_time": "2024-12-19T00:36:42.882862",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- all_trips %>% \n",
    "  mutate(member_casual = recode(member_casual, \"Subscriber\" = \"member\", \"Customer\" = \"casual\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2e305a3",
   "metadata": {
    "papermill": {
     "duration": 0.00949,
     "end_time": "2024-12-19T00:36:43.041759",
     "exception": false,
     "start_time": "2024-12-19T00:36:43.032269",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Check to make sure the proper number of observations were reassigned"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "fe5ac722",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:43.063706Z",
     "iopub.status.busy": "2024-12-19T00:36:43.062600Z",
     "iopub.status.idle": "2024-12-19T00:36:43.101916Z",
     "shell.execute_reply": "2024-12-19T00:36:43.100759Z"
    },
    "papermill": {
     "duration": 0.051933,
     "end_time": "2024-12-19T00:36:43.103355",
     "exception": false,
     "start_time": "2024-12-19T00:36:43.051422",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "casual member \n",
       " 71643 720313 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(all_trips$member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c8942b4e",
   "metadata": {
    "papermill": {
     "duration": 0.009614,
     "end_time": "2024-12-19T00:36:43.122920",
     "exception": false,
     "start_time": "2024-12-19T00:36:43.113306",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Problem (2)\n",
    "\n",
    "Add columns that list the data, month, day and year of each ride\n",
    "This will allow us to aggregate ride data for each month, day or year\n",
    "Before completing these operations we could only aggregate at the ride level"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "c9bee003",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:43.145531Z",
     "iopub.status.busy": "2024-12-19T00:36:43.144391Z",
     "iopub.status.idle": "2024-12-19T00:36:44.258611Z",
     "shell.execute_reply": "2024-12-19T00:36:44.257240Z"
    },
    "papermill": {
     "duration": 1.127293,
     "end_time": "2024-12-19T00:36:44.260155",
     "exception": false,
     "start_time": "2024-12-19T00:36:43.132862",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$date <- as.Date(all_trips$started_at) # The default format is yyyy-mm-dd\n",
    "all_trips$month <- format(as.Date(all_trips$date), \"%m\")\n",
    "all_trips$day <- format(as.Date(all_trips$date), \"%d\")\n",
    "all_trips$year <- format(as.Date(all_trips$date), \"%Y\")\n",
    "all_trips$day_of_week <- format(as.Date(all_trips$date), \"%A\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85887a37",
   "metadata": {
    "papermill": {
     "duration": 0.010801,
     "end_time": "2024-12-19T00:36:44.281842",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.271041",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Problem (3)\n",
    "\n",
    "Add \"ride_length\" calculation to all_trips (in seconds)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "4bf39dd6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:44.305727Z",
     "iopub.status.busy": "2024-12-19T00:36:44.304657Z",
     "iopub.status.idle": "2024-12-19T00:36:44.316884Z",
     "shell.execute_reply": "2024-12-19T00:36:44.315515Z"
    },
    "papermill": {
     "duration": 0.02673,
     "end_time": "2024-12-19T00:36:44.319364",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.292634",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "482beb9a",
   "metadata": {
    "papermill": {
     "duration": 0.010138,
     "end_time": "2024-12-19T00:36:44.339703",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.329565",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Inspect the structure of the columns "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "f979829d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:44.363414Z",
     "iopub.status.busy": "2024-12-19T00:36:44.362281Z",
     "iopub.status.idle": "2024-12-19T00:36:44.382720Z",
     "shell.execute_reply": "2024-12-19T00:36:44.381430Z"
    },
    "papermill": {
     "duration": 0.034924,
     "end_time": "2024-12-19T00:36:44.384790",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.349866",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [791,956 × 15] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:791956] \"21742443\" \"21742444\" \"21742445\" \"21742446\" ...\n",
      " $ started_at        : POSIXct[1:791956], format: \"2001-01-20 19:00:04\" \"2001-01-20 19:00:08\" ...\n",
      " $ ended_at          : POSIXct[1:791956], format: \"2001-01-20 19:00:11\" \"2001-01-20 19:00:15\" ...\n",
      " $ rideable_type     : chr [1:791956] \"2167\" \"4386\" \"1524\" \"252\" ...\n",
      " $ start_station_id  : num [1:791956] 199 44 15 123 173 98 98 211 150 268 ...\n",
      " $ start_station_name: chr [1:791956] \"Wabash Ave & Grand Ave\" \"State St & Randolph St\" \"Racine Ave & 18th St\" \"California Ave & Milwaukee Ave\" ...\n",
      " $ end_station_id    : num [1:791956] 84 624 644 176 35 49 49 142 148 141 ...\n",
      " $ end_station_name  : chr [1:791956] \"Milwaukee Ave & Grand Ave\" \"Dearborn St & Van Buren St (*)\" \"Western Ave & Fillmore St (*)\" \"Clark St & Elm St\" ...\n",
      " $ member_casual     : chr [1:791956] \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ date              : Date[1:791956], format: \"2001-01-20\" \"2001-01-20\" ...\n",
      " $ month             : chr [1:791956] \"01\" \"01\" \"01\" \"01\" ...\n",
      " $ day               : chr [1:791956] \"20\" \"20\" \"20\" \"20\" ...\n",
      " $ year              : chr [1:791956] \"2001\" \"2001\" \"2001\" \"2001\" ...\n",
      " $ day_of_week       : chr [1:791956] \"Saturday\" \"Saturday\" \"Saturday\" \"Saturday\" ...\n",
      " $ ride_length       : 'difftime' num [1:791956] 7 7 14 30 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n"
     ]
    }
   ],
   "source": [
    "str(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7459e5f6",
   "metadata": {
    "papermill": {
     "duration": 0.010222,
     "end_time": "2024-12-19T00:36:44.405769",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.395547",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Convert \"ride_length\" from Factor to Numeric so we can run Calculations on the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "4175442f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:44.428859Z",
     "iopub.status.busy": "2024-12-19T00:36:44.427802Z",
     "iopub.status.idle": "2024-12-19T00:36:45.001708Z",
     "shell.execute_reply": "2024-12-19T00:36:45.000563Z"
    },
    "papermill": {
     "duration": 0.587656,
     "end_time": "2024-12-19T00:36:45.003730",
     "exception": false,
     "start_time": "2024-12-19T00:36:44.416074",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.factor(all_trips$ride_length)\n",
    "all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))\n",
    "is.numeric(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "10372026",
   "metadata": {
    "papermill": {
     "duration": 0.009828,
     "end_time": "2024-12-19T00:36:45.024073",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.014245",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Problem (4)\n",
    "\n",
    "Remove \"bad\" Data\n",
    "The data frame includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative\n",
    "We will create a new version of the data frame (v2) since data is being removed"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "69ebd7b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.046244Z",
     "iopub.status.busy": "2024-12-19T00:36:45.045147Z",
     "iopub.status.idle": "2024-12-19T00:36:45.203322Z",
     "shell.execute_reply": "2024-12-19T00:36:45.202023Z"
    },
    "papermill": {
     "duration": 0.171078,
     "end_time": "2024-12-19T00:36:45.204944",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.033866",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips_v2 <- all_trips[!(all_trips$start_station_name == \"HQ QR\" | all_trips$ride_length<0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "effc972f",
   "metadata": {
    "papermill": {
     "duration": 0.010105,
     "end_time": "2024-12-19T00:36:45.225467",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.215362",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 4: Conduct Descriptive Analysis\n",
    "**Descriptive Analysis on ride_length (all figures in seconds)**\n",
    "\n",
    "* Straight Average (total ride length/rides)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "69669831",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.249227Z",
     "iopub.status.busy": "2024-12-19T00:36:45.248175Z",
     "iopub.status.idle": "2024-12-19T00:36:45.263155Z",
     "shell.execute_reply": "2024-12-19T00:36:45.261559Z"
    },
    "papermill": {
     "duration": 0.028858,
     "end_time": "2024-12-19T00:36:45.264813",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.235955",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "43958.6501325889"
      ],
      "text/latex": [
       "43958.6501325889"
      ],
      "text/markdown": [
       "43958.6501325889"
      ],
      "text/plain": [
       "[1] 43958.65"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d63fc9fc",
   "metadata": {
    "papermill": {
     "duration": 0.01099,
     "end_time": "2024-12-19T00:36:45.286295",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.275305",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Midpoint number in the ascending array of ride lengths"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "6964a6f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.310252Z",
     "iopub.status.busy": "2024-12-19T00:36:45.309176Z",
     "iopub.status.idle": "2024-12-19T00:36:45.375800Z",
     "shell.execute_reply": "2024-12-19T00:36:45.374686Z"
    },
    "papermill": {
     "duration": 0.079698,
     "end_time": "2024-12-19T00:36:45.377297",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.297599",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "191"
      ],
      "text/latex": [
       "191"
      ],
      "text/markdown": [
       "191"
      ],
      "text/plain": [
       "[1] 191"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "median(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9ea7d0bf",
   "metadata": {
    "papermill": {
     "duration": 0.010429,
     "end_time": "2024-12-19T00:36:45.398370",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.387941",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Longest Ride"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "8be920e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.422346Z",
     "iopub.status.busy": "2024-12-19T00:36:45.421211Z",
     "iopub.status.idle": "2024-12-19T00:36:45.432065Z",
     "shell.execute_reply": "2024-12-19T00:36:45.431020Z"
    },
    "papermill": {
     "duration": 0.024443,
     "end_time": "2024-12-19T00:36:45.433498",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.409055",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "570498468"
      ],
      "text/latex": [
       "570498468"
      ],
      "text/markdown": [
       "570498468"
      ],
      "text/plain": [
       "[1] 570498468"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "max(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "33f202ca",
   "metadata": {
    "papermill": {
     "duration": 0.010232,
     "end_time": "2024-12-19T00:36:45.454181",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.443949",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Shortest Ride"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "2d7fd024",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.477744Z",
     "iopub.status.busy": "2024-12-19T00:36:45.476655Z",
     "iopub.status.idle": "2024-12-19T00:36:45.487387Z",
     "shell.execute_reply": "2024-12-19T00:36:45.486350Z"
    },
    "papermill": {
     "duration": 0.024838,
     "end_time": "2024-12-19T00:36:45.489372",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.464534",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "min(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d5f99fc9",
   "metadata": {
    "papermill": {
     "duration": 0.010693,
     "end_time": "2024-12-19T00:36:45.510823",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.500130",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Condense the four lines above to one line using summary() on the specific attribute"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "a104dcf0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.535118Z",
     "iopub.status.busy": "2024-12-19T00:36:45.533996Z",
     "iopub.status.idle": "2024-12-19T00:36:45.775321Z",
     "shell.execute_reply": "2024-12-19T00:36:45.774157Z"
    },
    "papermill": {
     "duration": 0.255015,
     "end_time": "2024-12-19T00:36:45.776807",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.521792",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. \n",
       "        1         9       191     43959       595 570498468 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "60f37922",
   "metadata": {
    "papermill": {
     "duration": 0.010394,
     "end_time": "2024-12-19T00:36:45.797921",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.787527",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Compare Members and Casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "7fd461ac",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:45.821350Z",
     "iopub.status.busy": "2024-12-19T00:36:45.820261Z",
     "iopub.status.idle": "2024-12-19T00:36:47.048598Z",
     "shell.execute_reply": "2024-12-19T00:36:47.047391Z"
    },
    "papermill": {
     "duration": 1.241862,
     "end_time": "2024-12-19T00:36:47.050170",
     "exception": false,
     "start_time": "2024-12-19T00:36:45.808308",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>143783.29</td></tr>\n",
       "\t<tr><td>member</td><td> 34553.66</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 143783.29\\\\\n",
       "\t member &  34553.66\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 143783.29 |\n",
       "| member |  34553.66 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     143783.29               \n",
       "2 member                      34553.66               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>760</td></tr>\n",
       "\t<tr><td>member</td><td>163</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 760\\\\\n",
       "\t member & 163\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 760 |\n",
       "| member | 163 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     760                     \n",
       "2 member                     163                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>347068443</td></tr>\n",
       "\t<tr><td>member</td><td>570498468</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 347068443\\\\\n",
       "\t member & 570498468\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 347068443 |\n",
       "| member | 570498468 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     347068443               \n",
       "2 member                     570498468               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1                       \n",
       "2 member                     1                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2383414f",
   "metadata": {
    "papermill": {
     "duration": 0.01147,
     "end_time": "2024-12-19T00:36:47.072903",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.061433",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "See the Average ride time by each day for members vs casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "26f4e8d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:47.099131Z",
     "iopub.status.busy": "2024-12-19T00:36:47.097935Z",
     "iopub.status.idle": "2024-12-19T00:36:47.415781Z",
     "shell.execute_reply": "2024-12-19T00:36:47.413887Z"
    },
    "papermill": {
     "duration": 0.333691,
     "end_time": "2024-12-19T00:36:47.418276",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.084585",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td> 94783.20</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 40897.59</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>165755.49</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 27118.08</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>188179.26</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 40977.24</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>121029.72</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 35256.72</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>196726.49</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 31474.27</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>146574.57</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 32262.87</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>102550.51</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 36456.62</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    &  94783.20\\\\\n",
       "\t member & Friday    &  40897.59\\\\\n",
       "\t casual & Monday    & 165755.49\\\\\n",
       "\t member & Monday    &  27118.08\\\\\n",
       "\t casual & Saturday  & 188179.26\\\\\n",
       "\t member & Saturday  &  40977.24\\\\\n",
       "\t casual & Sunday    & 121029.72\\\\\n",
       "\t member & Sunday    &  35256.72\\\\\n",
       "\t casual & Thursday  & 196726.49\\\\\n",
       "\t member & Thursday  &  31474.27\\\\\n",
       "\t casual & Tuesday   & 146574.57\\\\\n",
       "\t member & Tuesday   &  32262.87\\\\\n",
       "\t casual & Wednesday & 102550.51\\\\\n",
       "\t member & Wednesday &  36456.62\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    |  94783.20 |\n",
       "| member | Friday    |  40897.59 |\n",
       "| casual | Monday    | 165755.49 |\n",
       "| member | Monday    |  27118.08 |\n",
       "| casual | Saturday  | 188179.26 |\n",
       "| member | Saturday  |  40977.24 |\n",
       "| casual | Sunday    | 121029.72 |\n",
       "| member | Sunday    |  35256.72 |\n",
       "| casual | Thursday  | 196726.49 |\n",
       "| member | Thursday  |  31474.27 |\n",
       "| casual | Tuesday   | 146574.57 |\n",
       "| member | Tuesday   |  32262.87 |\n",
       "| casual | Wednesday | 102550.51 |\n",
       "| member | Wednesday |  36456.62 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Friday                    94783.20               \n",
       "2  member                     Friday                    40897.59               \n",
       "3  casual                     Monday                   165755.49               \n",
       "4  member                     Monday                    27118.08               \n",
       "5  casual                     Saturday                 188179.26               \n",
       "6  member                     Saturday                  40977.24               \n",
       "7  casual                     Sunday                   121029.72               \n",
       "8  member                     Sunday                    35256.72               \n",
       "9  casual                     Thursday                 196726.49               \n",
       "10 member                     Thursday                  31474.27               \n",
       "11 casual                     Tuesday                  146574.57               \n",
       "12 member                     Tuesday                   32262.87               \n",
       "13 casual                     Wednesday                102550.51               \n",
       "14 member                     Wednesday                 36456.62               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cde81939",
   "metadata": {
    "papermill": {
     "duration": 0.011143,
     "end_time": "2024-12-19T00:36:47.440737",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.429594",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The list is out of order so lets fix that"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "a40ca4b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:47.465997Z",
     "iopub.status.busy": "2024-12-19T00:36:47.464884Z",
     "iopub.status.idle": "2024-12-19T00:36:47.483991Z",
     "shell.execute_reply": "2024-12-19T00:36:47.482714Z"
    },
    "papermill": {
     "duration": 0.034051,
     "end_time": "2024-12-19T00:36:47.486120",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.452069",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c(\"Sunday\", \"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "13415441",
   "metadata": {
    "papermill": {
     "duration": 0.011146,
     "end_time": "2024-12-19T00:36:47.508922",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.497776",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The Average ride time by each day for members vs casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "f5107188",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:47.534240Z",
     "iopub.status.busy": "2024-12-19T00:36:47.533129Z",
     "iopub.status.idle": "2024-12-19T00:36:47.864078Z",
     "shell.execute_reply": "2024-12-19T00:36:47.862881Z"
    },
    "papermill": {
     "duration": 0.345552,
     "end_time": "2024-12-19T00:36:47.865772",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.520220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>121029.72</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 35256.72</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>165755.49</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 27118.08</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>146574.57</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 32262.87</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>102550.51</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 36456.62</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>196726.49</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 31474.27</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td> 94783.20</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 40897.59</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>188179.26</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 40977.24</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 121029.72\\\\\n",
       "\t member & Sunday    &  35256.72\\\\\n",
       "\t casual & Monday    & 165755.49\\\\\n",
       "\t member & Monday    &  27118.08\\\\\n",
       "\t casual & Tuesday   & 146574.57\\\\\n",
       "\t member & Tuesday   &  32262.87\\\\\n",
       "\t casual & Wednesday & 102550.51\\\\\n",
       "\t member & Wednesday &  36456.62\\\\\n",
       "\t casual & Thursday  & 196726.49\\\\\n",
       "\t member & Thursday  &  31474.27\\\\\n",
       "\t casual & Friday    &  94783.20\\\\\n",
       "\t member & Friday    &  40897.59\\\\\n",
       "\t casual & Saturday  & 188179.26\\\\\n",
       "\t member & Saturday  &  40977.24\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;ord&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 121029.72 |\n",
       "| member | Sunday    |  35256.72 |\n",
       "| casual | Monday    | 165755.49 |\n",
       "| member | Monday    |  27118.08 |\n",
       "| casual | Tuesday   | 146574.57 |\n",
       "| member | Tuesday   |  32262.87 |\n",
       "| casual | Wednesday | 102550.51 |\n",
       "| member | Wednesday |  36456.62 |\n",
       "| casual | Thursday  | 196726.49 |\n",
       "| member | Thursday  |  31474.27 |\n",
       "| casual | Friday    |  94783.20 |\n",
       "| member | Friday    |  40897.59 |\n",
       "| casual | Saturday  | 188179.26 |\n",
       "| member | Saturday  |  40977.24 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Sunday                   121029.72               \n",
       "2  member                     Sunday                    35256.72               \n",
       "3  casual                     Monday                   165755.49               \n",
       "4  member                     Monday                    27118.08               \n",
       "5  casual                     Tuesday                  146574.57               \n",
       "6  member                     Tuesday                   32262.87               \n",
       "7  casual                     Wednesday                102550.51               \n",
       "8  member                     Wednesday                 36456.62               \n",
       "9  casual                     Thursday                 196726.49               \n",
       "10 member                     Thursday                  31474.27               \n",
       "11 casual                     Friday                    94783.20               \n",
       "12 member                     Friday                    40897.59               \n",
       "13 casual                     Saturday                 188179.26               \n",
       "14 member                     Saturday                  40977.24               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2ee5a397",
   "metadata": {
    "papermill": {
     "duration": 0.011185,
     "end_time": "2024-12-19T00:36:47.888559",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.877374",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Analyse ridership data by type and weekday"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "f5191cd9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:47.915103Z",
     "iopub.status.busy": "2024-12-19T00:36:47.913976Z",
     "iopub.status.idle": "2024-12-19T00:36:48.542255Z",
     "shell.execute_reply": "2024-12-19T00:36:48.540576Z"
    },
    "papermill": {
     "duration": 0.644222,
     "end_time": "2024-12-19T00:36:48.544186",
     "exception": false,
     "start_time": "2024-12-19T00:36:47.899964",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td> 17648</td><td>121029.72</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>  8894</td><td>165755.49</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>  7932</td><td>146574.57</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>  8265</td><td>102550.51</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>  7940</td><td>196726.49</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>  7050</td><td> 94783.20</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td> 10133</td><td>188179.26</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td> 86907</td><td> 35256.72</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>105356</td><td> 27118.08</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>125897</td><td> 32262.87</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>111359</td><td> 36456.62</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>111635</td><td> 31474.27</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>102189</td><td> 40897.59</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td> 76945</td><td> 40977.24</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun &  17648 & 121029.72\\\\\n",
       "\t casual & Mon &   8894 & 165755.49\\\\\n",
       "\t casual & Tue &   7932 & 146574.57\\\\\n",
       "\t casual & Wed &   8265 & 102550.51\\\\\n",
       "\t casual & Thu &   7940 & 196726.49\\\\\n",
       "\t casual & Fri &   7050 &  94783.20\\\\\n",
       "\t casual & Sat &  10133 & 188179.26\\\\\n",
       "\t member & Sun &  86907 &  35256.72\\\\\n",
       "\t member & Mon & 105356 &  27118.08\\\\\n",
       "\t member & Tue & 125897 &  32262.87\\\\\n",
       "\t member & Wed & 111359 &  36456.62\\\\\n",
       "\t member & Thu & 111635 &  31474.27\\\\\n",
       "\t member & Fri & 102189 &  40897.59\\\\\n",
       "\t member & Sat &  76945 &  40977.24\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun |  17648 | 121029.72 |\n",
       "| casual | Mon |   8894 | 165755.49 |\n",
       "| casual | Tue |   7932 | 146574.57 |\n",
       "| casual | Wed |   8265 | 102550.51 |\n",
       "| casual | Thu |   7940 | 196726.49 |\n",
       "| casual | Fri |   7050 |  94783.20 |\n",
       "| casual | Sat |  10133 | 188179.26 |\n",
       "| member | Sun |  86907 |  35256.72 |\n",
       "| member | Mon | 105356 |  27118.08 |\n",
       "| member | Tue | 125897 |  32262.87 |\n",
       "| member | Wed | 111359 |  36456.62 |\n",
       "| member | Thu | 111635 |  31474.27 |\n",
       "| member | Fri | 102189 |  40897.59 |\n",
       "| member | Sat |  76945 |  40977.24 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun      17648          121029.72       \n",
       "2  casual        Mon       8894          165755.49       \n",
       "3  casual        Tue       7932          146574.57       \n",
       "4  casual        Wed       8265          102550.51       \n",
       "5  casual        Thu       7940          196726.49       \n",
       "6  casual        Fri       7050           94783.20       \n",
       "7  casual        Sat      10133          188179.26       \n",
       "8  member        Sun      86907           35256.72       \n",
       "9  member        Mon     105356           27118.08       \n",
       "10 member        Tue     125897           32262.87       \n",
       "11 member        Wed     111359           36456.62       \n",
       "12 member        Thu     111635           31474.27       \n",
       "13 member        Fri     102189           40897.59       \n",
       "14 member        Sat      76945           40977.24       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% # Creates weekday field using wday()\n",
    "  group_by(member_casual, weekday) %>% # Groups by usertype and weekday\n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% # Calculates the Average duration\n",
    "  arrange(member_casual, weekday) # sorts"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa74299b",
   "metadata": {
    "papermill": {
     "duration": 0.011442,
     "end_time": "2024-12-19T00:36:48.567900",
     "exception": false,
     "start_time": "2024-12-19T00:36:48.556458",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Visualise the number of rides by rider type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "cbd210a7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:48.594786Z",
     "iopub.status.busy": "2024-12-19T00:36:48.593612Z",
     "iopub.status.idle": "2024-12-19T00:36:49.705709Z",
     "shell.execute_reply": "2024-12-19T00:36:49.703786Z"
    },
    "papermill": {
     "duration": 1.128539,
     "end_time": "2024-12-19T00:36:49.707936",
     "exception": false,
     "start_time": "2024-12-19T00:36:48.579397",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ2BUVd7A4TMpJIQAaTYEC8WKBXtHrKuydkHFLpa1r12xYF91FcSGuvZ1FexY\n97UhFuy6VpAVOyodCSmkzPshilgWJ5iZgZPn+TS5mdzzP0Tl552WSCaTAQCAxV9OtgcAAKBl\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEjkZXuA7Kitra2qqsr2FD/p0KFD\nIpGorq6eO3dutmfJkFa75Zqamtra2mzPkiHt27fPycmx5bgVFxfn5ubW1tbW1NRke5YMWWS3\nXFpamu0RyL5WGnbJZLKhoSHbU/wkNzc3LHpTpVVOTk4ikWhVW04kEjk5Oa1qyzk5OTk5OSGE\n1rPlpt9yaE1b9luGRYqHYgEAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACKRl+0BoBVJjH4pk8tN6blyJpcDIOtcsQMAiISwAwCIhLADAIhE\nK32OXSKRyMtb5Paek5OzCE6VVrm5ua1ny4lEIsMrLiJ/tq3qH+ym33Kr2nKTVrXlRfO3XF9f\nn+0RWCQkkslktmfIgrq6uvz8/GxPQauT4RdPJLfcNJPLAVk0derUioqKbE9B9i1C/7eRSQ0N\nDbNmzcr2FD9p+rexsrKypqYm27NkSHl5eSKRaFVbLisry/CKU6dOzfCKv1BWVpaTk1NVVVVV\nVZXdSTKmtLQ0Nze3FW65urp6zpw52Z4lQ0pKSvLy8lrVllmMeI4dAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\n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\n5M2V6idPnP3C42t+eezRwx6e9vNPFQMAYpVftEpThIUQCst2ap+bU9FzaFOEhRCW2GTzEEJ1\nXWMIob7qgws+nL7KX27/MbNCCGHHc64KIYy4/uOFOGEIoXiZw3+ouhBCIm//IQ8W5ea8cM7o\nVJdLFNxxxNop7nT210OenlGz7mVXNVVdCKGwrPdD119z9qEVIYQ9Xxz/3aQPfwyvkGycU5tM\nJhuqflgnp22bRJj50QNvfDm76cjGl700ZcqUVKrud0/eXKm+j13ffoMal1ru+hN2u/6vhUst\ns0Rh/s+K8NNPP1245QGARVZOXvn8X+YlQsESpfO+TOTkz7tdM/2JhmTyvSs2SFzxy5PMem/W\nQpwwhFC6xp4/u3Nh953KCh//7oUQDkxluTbFay+Zn+oFrO8nPBdC2HSrpeY/uPmhf9k8hBBC\nUUnZ9NefvP3JMR98/MnnX3z20bv/+XpmbeGP7xeSW9Dl35fs3/fMf26w/N3L99xwk4022mKr\n7ffac7uy1F4dsuCTN1eqYVdYWBhCp5126rSQ6wAAEctpE0JY49Rb5l2Qm6egY6qXzX7h11mU\nlwg/vBFbCsslctqlvlZjbWMIoU3it1Ps/pO23mvIc8v22urPfTbqu+mfTjp/ra8P3/aYyT/d\nYYtTb5980BkPPfTo6DEvvvTUbf+6aciJf93oofef23a+C4rzJBt/9sKI3z15s6Qado888sjv\n3qf3Kj2eHzdhIQcBABZbhWU75iZOqJ+58vbbbzLvYH31uPtH/WfptYoW7pzT338ohG3nfdlQ\n+9kj02o6bLx1OpbrsNI6ITz10mtTw/Id5h189rS/3Dmt9IYhO/cf8lyXHYd//ujh875163w/\nW1c5/q0PZpavte7eh5+89+EnhxA+euKC1XY85/iz3v7w+o2bZp9/re/emD7v9tzZryz45M2V\n6iXKVHz1+WcteDYAYHGRV9h98GplE+488Jlvf3py2N1H77LPPvt8sbCtUTnpujMfm/jjVw3/\nOnmXyobGXS7bNB3LdVj+jLWK27x63Mmf1vwQYXNnjT3gqpsefW3J+qpxDclk2drrzrtz1Tcv\nX/H17BB+uPA257vrN9poo35/++lTuFZYb/0QQv2c+hBCUW5OzfTHpv74xMGaaa8c9ezX8+75\nuydvruZ9ViwAwG864fHrblppwA7deu62987r9ih7/9kRdz718RoH3bn/kgt5xa5gicK/7bza\n+wMOWb9b+7efG/ng85912f6CazdeKh3LJXI7PvzPo3rsdtUa3XsfvN/2S+fPfPCm4d80tLv2\nvoOKlijcpvyo5y7ve0z+yet2Lpr4wSv/GD6q29KFc798a9hd9x66z54dVzhvmyVufOaCLXac\nePBGq3dtnPnZQ/+4JTe/fPDFvUIIO++/0nkXvr7WVgecut9Wdd+Ou+3Kq76raBO+qm9at2iJ\nvRd88uZupCWv2AEArVbxcv3efffRQ7ZbbswDN599wVWvTyk796Yn3rplv4U+4YZDX77p7AO+\nfPHBiy8c+uKn7Q8566b3Hxs070lwLb7c8rsM+ejx67fuOuuOqy+4YMitydX/fPuY8UeuVBJy\nCh96+5H9tlr+oavPPeGsv7/4ceNNb0x86N6zl2s/95Qjj55Z35jI7TjqvaeP2WuzD56464Iz\nT7/ypodLNtv3vtfG79u5OITQ67zR15y4T/svnznlLwNPGXz5zDX2/r+RvX9a9fdO3txdJJLJ\nFvtAiW5t8z+prmups6VVTU1NZWVltqf4SUVFRWL0S5lccUrPlTO53K+Vl5fnPP9yJlfM+pbL\nyspyx4zN5Iq2nHmlpaV5L7ySyRVtOfNKSkryX3w1kyumuOWKiop0T8If0Vj7/VdT6pfrXJbW\nVTwUCwCQdjkFHZbrnPZVhB0AELPPHuzb65AFPSxW0LH3t589lLF50krYAQAxW2G3R2fslu0h\nMsWLJwAAIiHsAAAiIewAACKxoLDbaq2eh77wTdPtVVdd9fwvZi/4XIOHDmuxuQAAaKYFvXhi\n0n8/nnDxTS+es31+Thg3bty7r7/66jftf/OeG264YQhh/yP+kpYZAQBIwYLC7vpjNtvqsnM3\nf/Lcpi/v33Pb+//HPVvwXY4BAFg4Cwq7Ppc+O3GvMW9O/LYhmdx77723u+qWQ5ZayI97AwAg\n3X7nfexWXG+LFdcLIYT77rtv+379+i/dLhNDAQBZNXXq1DSd2UefpVWqb1B87733pnUOAGCR\n0v7y81v8nLNPOafFz8n8mvfJE1Vfv3Pfw099OHFSVUPeMl1X327XPdftUpymyQAAaJZmhN39\n5+w94KKRtY0/vU5i0AlH7jXorhHn75GGwQAAaJ5U36D403sH7HnBiCV7HzLiqVe/njxtxpRJ\nrz9736FbLjXygj33f+CzdE4IAEBKUr1i9/cTRhUve9C4p28qykk0HVmvzx7r9t6hcfmlRx57\nRdj96rRNCABASlK9YnfPlKqVDj9+XtU1SeQUHX/MytVT7k7DYAAANE+qYVeck1PzXc2vj9d8\nV5PI9foJAIDsSzXsTujR8b93HPXGjNr5D86d9dYx//i4Y/fj0zAYAADNk+pz7A6+7/xzVz92\n0xXWOuSYgzdds3thqP7kvZdvu+aWj6vaDLv34LSOCACQVmX5ubt9OPXmHqXZHuSPSjXsSlY+\n6sOn8vY76szhF58+/MeDZStvce21dx65SkmahgMAIHXNeB+7zn0OH/3RYV+Ne/ODTybVhoJO\nXVdbZ9Uu8z+U23uVHs+Pm9DiIwIAkIpUn2P3o0TnVdbbfqedd95p+/V+XnUhhK8+/6ylxgIA\nWpu6yg9O3XeHlZYtKSpZauu9T36vsq7pePXkl/+y2xZLlxTnFRSt2HPzi+8d13T8syeH77T+\namXtCiqW7brLkX/7viEZQgjJ2kQicdGXs+edtlNB3qETZizgPDFpbtgBAKRBcu5hvTa95aPS\nS2997JkHhi/5n5u33PCMpu+cvulO909a7eZRz7zx4lMnbNt49j4bfFrTMPf7F9bse3T4018f\nH/PKyGtOfvO2s3a8+sMFr/Cb50n/xjKqeZ8VCwCQDtM/OuWOiXNHT79ti45tQghrPjO174B/\nfTO3cZk2OSscfsbNBx270xJtQwirdDvzhKF9354zt3z2k7MbGo84asBGyxSFdXs9ff8yE4rK\nF7zEb55nxcK2Gdhdxgg7ACD7vhr1cmHpdk1VF0Jo1+mw5547rOn2CSf+5blR91/2/vjPPpv4\nzouPNR0s7vzX/da/dfcVVuy9w3abbbrptjvs+ueeSy94id88T2Q8FAsAZF9jbWMip/DXxxtq\nv+zbo3P/8++elVu+ed/9ht17V9PxnLyKO1/76r1nb915/c4fPXvHtmt33uH0p37zzDWNyQWc\nJzKu2AEA2bds3zVrLrj/jcq69YrzQwhV393Zbe1Tb/3ws/W+OOmJz2u+qXlkqfycEELV5B+C\n7LuXrrzkwblD/376qpvueHwIHw7fpNcpp4a/vd303el1jU03qibfO6O+MYQwY9xvnycyrtgB\nANlXsfbVf16qcadtDn/0udfeeumJo7b7a03xzn8qLSgoXz/ZOPfv94z+/KtPX/737XtvdVoI\n4cNPJuctOfuqK8444MLbXnn7vVdHP3TJteM7rrxXCCEkCjbqUHDPYRe/Oe2Vt/UAACAASURB\n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\nZR9edN3VS7dpevy08flJVSXrrBRCKFpq+9D42pPTG3bt1PSa1uQtZ58+c7PjTtx+v1Gj9gsh\n1FeP23PAz55jFwr6dGoz/N8vTt6mb5cQQt2cd16bPXf3bZbuln/mlbv98M99svH7k04evOmg\ni/ZasjzduwMAWHSkPew6dO1fXnXkaYNvOGbfrUoS1W8+9c8xc9qfM3ClEEKb9usNXLv89tMu\nLDx8z1WWLX7nqVse+WjauactuaDTJdqcvOcqp9w2+OllTl29tG7UtVcULbP1AZ2Lc0Jx96V+\nuEvTc+xKlu/a1RsUAwCtSdrDLiev4oJrz7t1+F3DLjyrJrd91x49Tx0yuFfxDy9r7XvOkNob\nr7l3+KUz6vI7d13zxEsGrV38O+9d3L3/hUfVDr1nyDnTahLd1up94fmHpfixaAAAccvEc+wK\nSlc/8oyLj/ytbyVyO+75l0F7/uW3fzCv7So/exz2x5/Z9sCTtj3wfy6XyC0dNWrUQs4KALDY\ncrULACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEnnZHiA7cnJyiouLsz1FNmV9+4lEIsMr2nLmtcIt5+Rk+v+WbTnzFs0t\nV1ZWZmASFn2tNOxCCMlkMtsjZFMr3L4ttwa23BoGyPqWM68VbpmF1krDrrGxcc6cOdme4idt\n27bN8IpZ335hYWGGV8z6lgsKCjK8oi1nXps2bTK8oi1nXn5+foZXzPqWWYx4jh0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk8rI9wKKr/eXnZ2yt2hDCDv0zthwAECVX7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAikZftAQDgj2p/+fkZW6shhLBD\n/4wtB83iih0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkvN0JP8nk+wXMDd4vAABamCt2\nAACREHYAAJHwUCy0Lpl8wL0ueMAdIKNcsQMAiIQrdrRqLl+1Bpn8LdcHv2Ugm1yxAwCIhLAD\nAIiEsAMAiISwAwCIhBdPAMTG60Wg1XLFDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBJ5GVmlcfQ91z0y5q0vZ+eu0nODg449uGvRH1n3\nf52tZVcBAFjMZOKK3cT7zxoyYuxGux927gkHFH/yzKC/3tCYhrO17CoAAIud9Iddcu6VIz7q\nts/5e22z8errbn78ZcfM+ebfd309p4XP1rKrAAAshtIedrWzxnxR07Dttss2fVlQslmv4jZv\njv626ctk/fT7hv/tuCMO3qPfgGPPuPSZcTPm/9lksvazz75M5WwLXgUAoDVI+7PQ5s55N4Sw\nWlH+vCOrFuU9+e6sMCCEEO4844Qnq1c//LATu3RIjBv72LDTj2i47rbtOhU13bOh5tMTTrzk\noQdu/92zzd1yQas0efbZZxsbf3h4dskll1xxxRVbfLOLkYKCgmyPkGm23BrYcmtgy7+ptrY2\nA5Ow6Et72DXWzgkhlOf9dGmwIj+3vrImhFAz7eH7P5510b9O7NkuP4TQbaWeDa8OuOf6D7a7\nYP3mnm0Bq8xz5pln1tfXN93eY489zjjjjAVPHve/Iu3bt//1QVuOjC03seXI2PJvEnY0SXvY\n5bRpG0KYUd9YnJvbdGRaXUNuSZsQQuVXbyWTyTP32WP++7er/zok16mprQsh1NfUhhBqan7o\ns4LCwv91tgWsstAKLh32R368uZKZXOx/sOV0s+WssOV0s2VYdKQ97PLbrRHCmPHV9V0Kfkiu\nCdX1HTcrCSHktWuTyG034u5b579/Iie/asrdew8cOe9Iv379mm4MHflgp/9xtgWsMs///d//\nzbvd2Ng4bdq0Ft7qH1BeXh5CqKysbD3/y1VWVpZIJObMmTMv3KNXWlqak5NTVVVVXV2d7Vky\npBVuuaSkJDc3t7q6uqqqKtuzZEgr3HLHjh3z8vJqamrmzPESPRY5aQ+7wpI+ndoM//eLk7fp\n2yWEUDfnnddmz919m6VDCEVLbR8aX3tyesOundqFEEJI3nL26TM3O+7E7fcbNWq/EEJ99bg9\nB/zsOXah4LfPVliy3P9aZZ4OHTrMu11TU1NZWZnuvS+EZLJ1/X9gMpm05dagtW3Zb7k1aJ2/\nZRZ96X+7k0Sbk/dc5b+3DX76zfHfTHz/lnOuKFpm6wM6F4cQ2rRfb+Da5f887cInX3jzs4nj\nH7rh9Ec+mrbVpksuzNn+9yoAAK1EJj6boXv/C4+qHXrPkHOm1SS6rdX7wvMPm5eTfc8ZUnvj\nNfcOv3RGXX7nrmueeMmgtYvzF3Su/322BawCANAaJFrnleRF7aHYioqKEEJlZWXrecJZeXl5\nIpFoVVsuKyvLycmZM2dO63nCWdOWq6qqWs+zr0pLS3Nzc1vhlqurq1vPE85KSkry8vIWwS03\n/VVCK+eqFgBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhN0iYZtttunTp8/j\njz+e7UEyZ8cdd+zTp8/DDz+c7UEyZ7fdduvTp8/IkSOzPUjm7LXXXn369LnrrruyPUjmDBgw\noE+fPrfeemu2B8mcgw8+uE+fPjfeeGO2B8mcI444ok+fPldffXW2B4HfkJftAbKjsLCwsLAw\n21P8pLKysr6+vqCgoKKiItuzZMicOXOqqqry8/Nbz5arqqpmz57dqrZcXV09e/bs3Nzc1rPl\n2tra2bNn5+XltbYtJxKJ1rPlurq62bNn5+TktJ4tsxhxxQ4AIBLCDgAgEq30odhFzVZbbdXY\n2NipU6dsD5I5ffr0qa2t7dKlS7YHyZwttthizpw5yy+/fLYHyZzNN9981qxZK664YrYHyZxN\nNtlk2rRpXbt2zfYgmbPRRhutuOKK3bt3z/YgmbPBBht06tRppZVWyvYg8BsSyWQy2zMAANAC\nPBQLABAJYQcAEAnPscuQ956+Z+Tjz3/8xbcNuUVLdunRe4f+/bdeNdtDpcvZ++z5nzlz97z+\nXwcsWzz/8XcuP/ycF75dfue/Xz0wwuemvHDUgMu/mv3r44lEm4cfvi/z86TP+OFHn/rk5Dvu\nH9kxN9F05N/H7Xfd55VXjLi/e2Fu05G3zjv0gvdy7r33prxESue869C939jm4iH7LOpPTVvw\nb/nA3Xdd8+o7T1q2feYHy5g3TznwvPEzfnGwbcXuI2456BcHd955511vuueQpYoyNFkaLNx/\ntyv/v717D4gpbQMA/py5X7rMNN1LJKkUhdZl3bNyTWmTVApr+UqWsEgIIVn3yl0oNrflQ4td\n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\nL4sAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at,label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1657d6df",
   "metadata": {
    "papermill": {
     "duration": 0.012145,
     "end_time": "2024-12-19T00:36:49.732865",
     "exception": false,
     "start_time": "2024-12-19T00:36:49.720720",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Visualisation for average duration"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "468c260f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:49.759600Z",
     "iopub.status.busy": "2024-12-19T00:36:49.758479Z",
     "iopub.status.idle": "2024-12-19T00:36:50.699717Z",
     "shell.execute_reply": "2024-12-19T00:36:50.697737Z"
    },
    "papermill": {
     "duration": 0.9571,
     "end_time": "2024-12-19T00:36:50.702019",
     "exception": false,
     "start_time": "2024-12-19T00:36:49.744919",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIhEKt8DdDjFxcX5HmGuVGrus9NxRmpXhYWFIYREItFJ1ptMJkMIBQUFnWq9\nyWSyk6y3SSqV6lTrbfpfcedRVFTU9Ae7I6iurs73CHQIwu770ul0vkeYq6Bg7vnUjjNSu+ps\n620Ou06y3qbnN+/rzeT2cKlUKpFI5PaY+ZRKpZr/h5wXOX5+CwsLm/8GnnfCjiYd5U9kxzFj\nxox8jzBXOp3u2rVr6EgjtauSkpIuXbo0NjZ2kvWWlZUVFxfX19d3kvWWl5cXFRXV1dVVVlbm\ncYyuuT1cdXV1VVVVbo+ZH7169QohzJkzJ795kePnd/bs2XV1dbk9JiyG99gBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAEQile8B6Oi6njMmZ8eqCaHwzHE5\nOxwARMYZOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBIpHJ8vOsO2ad4zBXDe5c0\nXf3yqVEjz3x13jvsd+0tO/YsDiHzyE2X3T3xhU8qkwMH/WLf349YobR51IXd1IpdAADikcu+\naXznsatvnzx918bG5k3TX5pe0nP7I0au3rxl2a6FIYT3x598wc0f7XnY4ft1r//PlZeOOqr2\nhisPazq7uLCbWrELAEBMchR2Xz017oSLH586q/b729+YWbHahhtuuPp8Wxtrz7/5zQG7n7vr\nlgNCCCuendh177Nv+Gzfvfp2WehNSxe2eJe+XXKzdgCA3MjReauK1XcdNeasc/98wve2vzSz\npvvgioY5M7/4anrzebyaGRM/rm4YOrRv09V0xcaDy4qef+SLRdzUil3adb0AALmXozN2ReV9\nVywPDbXF39v+4qy6xscv2u3it+oaG1Ndem/1uyMO2n7N2tmvhBBWKy1svtuqpakJr8wIe4SF\n3VS7aYt3CXvMvTpx4sQPPvig6XI6nd5+++3bcuU/Qio199kpKSnJ7yS5lEgkOsl6m57fgoKC\nTrLeZDLZ9J+dZL1NCgsLO9t6E4lEvqfInXQ63fwv6rybM2dOvkegQ8jnn8iG2s9mJQuX67Xh\nn28YU9FY+b97rjnnqpPTK12/U9HsEELP1HdnE3sVJutnVYcQMjULvmlh2xexS/PV//73vxMm\nTGi63L179+HDh7fLan+ELl3y+apxTW4Pl0gk8rveHEsmk51qvalUKr//R5jjP8+FhYWFhYWL\nv18s0ul0Op3O4wA5fn6Li79/tiKPhB1N8vlv2GRR31tuueXba+lNhh3/9oTnH/rra789siSE\n8E19piyZbLptal1DsqIohFBQtOCbFrZ9Ebs0j9GjR4++fee+UNutW7eGhoZ2XHNLJBKJgoKC\nEELHGSk3Osl6CwoKEolEY2NjJpPJ9yy50NnW26TzrLfpjGwmk2mc5+Nx0ets6+UnoaOcQ24y\neMmSB6ZNKeyyRggTJ82p75+em2LvzKnvtnFFCGFhN7Vil+aDHn300UcffXTT5UwmM23atJys\ndfHS6XTXrl1DCN98800ex+ia28NlMpn8rjdnysrKiouL6+vrZ8yYke9ZcqG8vLyoqKi2tray\nsjKPY+T4z/OcOXOqqqpye8z86NWrVwihqqqqurp6sXduPzl+fisrK+vq6nJ7TFiMfH7px/S3\nL93/gMO+qG3+62zm0clVFautXFyx2dJFyfse/6ppa93sl56prF1ny6VCCAu7qRW75G6dAAA5\nkc+wK19hWM+qL08YfeWzr0165/WXbhp3/MTZXQ88YOWQKDp2l4HvXjf6gecnff7+a9eccl5p\nny327lcWQljoTa3YBQAgLvl8KbYg1ev0S0+79oobLhp7cnWy6worDTr+gtGDywpDCCsOG3to\nzbibLjhlanViwFpDxo4Z2VygC7upFbsAAMQk4Y2f8+qY77H7+uuv8zhG13PG5PJwhWeO6zhP\nQbtqeo9dXV1dp3qPXU1NTZ7fY5fbP88Np57Vqd5jN2vWrDy/xy63z2/1Sad3qPfYNT0LdHJO\nXQEARELYAQBEQtgBAERC2AEARELYAQBEomP98gTkXS4/VVcTQsHY83J2OACi54wdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkUvkeoMMp\nLi7O9whzpVJzn52OM1IOJBKJTrXegoKCTrLeZDLZ9J+dZL1NUqlUp1pvYWFhvkfIqaKioqY/\n2B1BdXV1vkegQxB239dx/i2cSCSaLuR3pIbcHi7vYZfj9XaesCsoKAgdIOxy/PymUqmmhXcS\nhYWF+Q2dHD+/RUVFjY2NuT3mQgk7mgi775s+fXq+R5grnU537do15Hukrrk9XCaT6VTrra+v\nnzFjRm6PmR/l5eVFRUW1tbWVlZV5HCPHz291dXVVVVVuj5kfvXr1CiFUVVXlNy9y/PzOmjWr\nrq4ut8eExehEf5UEAIibsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIRCrfA/z0dD1nTM6OVRNC+s8X5exwAMBPmjN2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJFo2RcUT/v0/Smz6364fZVVVmmjeQAAaKVsw676\n6wd+u/GweyZNW+CtjY2NbTcSAACtkW3Y/eU3e937TuV2h/zx12sul0q060gAALRGtmE39tkp\nKwy77e7LdmjXaQAAaLWsPjzR2FA5pa5h2WFrtvc0AAC0WlZhl0iWbVpR/P51z7X3NAAAtFqW\nX3eSuOnfp9feu+e+p//ty9n17TsRAACtku177Hb5451L9in82yn7Xn/q/j2WWqokOd8HKD75\n5JN2mA0AgBbINux69erVq9eWy67drsMAANB62Ybd7bff3q5zAADwI/lJMQCASLTsJ8WqPnvp\n1jvvf+P9yVUNqT4rrP6rHXdZt39ZO00GAECLtCDsxp8yfI//u6Um892vh4068uBdR91w85jf\ntsNgAAC0TLYvxX7wrz12Of3mJYbsd/P9//vsq6nfTJn87EO37r/pkrecvstet33YnhMCAJCV\nbM/YnXvkXWV9933rgatKC+Z+0cnPNvvtukO2ziy71C2/Py/sfHG7TQgAQFayPWN305SqlQ88\nornqmiQKSo84fJU5U25sh8EAAGiZbMOurKCg+svqH26v/rI6kfT5CQCA/Ms27I5cqdu71x/6\n3Dc1826snfHC4X99u9uKR7TDYAAAtEy277EbceuYU1f//UbLrbXf4SM2WnPF4jDnvVefvO6S\na96uKrroXyPadUQAALKRbdhVrHLoG/en9jz0pCvO+OMV327sscovL7307wcPrGin4QAAyF4L\nvseu32YHPvLmyE/fev719ybXhPTSK6y2zqr9/XIFAEAH0bJfnggh0W/gz/oNbJdRAAD4MRYV\ndoMHD04UpF94/ummy4u454svvtjGcwEA0EKLCruysrJEQbrpckWFN9IBAHRoiwq7xx57rPny\nww8/3P7DAADQetl++GGDDTY499NZP9z+xZN/2GTzvdp0JAAAWmMxH56Y+cG7n9c2hBCefvrp\nFd58c9Ls8vlvb3ztPxOffOzD9poOAICsLSbsxv96vf3entZ0+Z+/+sU/F3Sf8uUOa+upAABo\nscWE3YZjzr9ienUI4eCDDx5y+gW79y753h0KCrtu8Ntd2ms6AACytpiwW2XYPquEEEK46aab\n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\nPeZ8crze4uLixsbG3B5zoYQdTYTd933zzTeLvkPX3Mwxj8WO1K5yvN5MJtOp1ltfXz9jxozc\nHnM+OV5vbW1tZWVlbo85nxyvd86cOVVVVbk95nxyvN6qqqrq6urcHnM+OV5vZWVlXV1dbo8J\ni9FRziEDAPAjCTsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBIpPJ7+C+fGjXyzFfn3bLftbfs\n2LM4hMwjN11298QXPqlMDhz0i31/P2KF0uZRF3ZTK3YBAIhHnvtm+kvTS3puf8TI1Zu3LNu1\nMITw/viTL7j5oz0PO3y/7vX/ufLSUUfV3nDlYU1nFxd2Uyt2AQCISZ7D7qs3ZlastuGGG64+\n39bG2vNvfnPA7ufuuuWAEMKKZyd23fvsGz7bd6++XRZ609KFLd6lb5c8LBgAoN3k+bzVSzNr\nug+uaJgz84uvpjd+u7FmxsSPqxuGDu3bdDVdsfHgsqLnH/liETe1YpfcLRIAICfyfMbuxVl1\njY9ftNvFb9U1Nqa69N7qd0cctP2atbNfCSGsVlrYfLdVS1MTXpkR9ggLu6l20xbvEvaYe/XZ\nZ5/95JNPmi4XFRVtuumm7bXa1iouLs73CLmTSCQ61XoLCgo61XqTyWSnWm8qlepU6y0sLFz8\nnSJSVFSUTCbzPcVc1dXV+R6BDiGfYddQ+9msZOFyvTb88w1jKhor/3fPNedcdXJ6pet3Kpod\nQuiZ+u5sYq/CZP2s6hBCpmbBNy1s+yJ2ab565513Tpgwoely9+7dt9tuu0WPXdPqBbdWWVlZ\nzo/5nRyvN5FIdKr1JpPJTrXeVCrVqdZbVFRUVFSU22POJ8frTafT6XQ6t8ecT47XW1JSktsD\nLoqwo0k+wy5Z1PeWW2759lp6k2HHvz3h+Yf++tpvjywJIXxTnyn79m9CU+sakhVFIYSCogXf\ntLDti9glN2sEAMiZjvWtH4OXLHlg2pTCLmuEMHHSnPr+6bkp9s6c+m4bV4QQFnZTK3ZpPujY\nsWPHjh3bdDmTyXz99deLHrJrmy03W4sdqV3leL2ZTGbatGm5PeZ8crzeurq6GTNm5PaY88nx\nemtqaiorK3N7zPnkeL1VVVVVVVW5PeZ8crzeWbNm5fe8UY7XO2PGjLq6utweExYjnx+emP72\npfsfcNgXtZlvN2QenVxVsdrKxRWbLV2UvO/xr5q21s1+6ZnK2nW2XCqEsLCbWrFL7tYJAJAT\n+Qy78hWG9az68oTRVz772qR3Xn/ppnHHT5zd9cADVg6JomN3GfjudaMfeH7S5++/ds0p55X2\n2WLvfmUhhIXe1IpdAADiks+XYgtSvU6/9LRrr7jhorEnVye7rrDSoOMvGD24rDCEsOKwsYfW\njLvpglOmVicGrDVk7JiRzQW6sJtasQsAQEzy/B67dPfVDz7xjIN/eEMiOXSfY4bus6B9FnZT\nK3YBAIiIU1cAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkUjlewAAYlC89bDw3Ms5O9yUQavk7FgLVLz1\nsPDiazk7XN7Xy0+FM3YAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACRSOV7AKCzKN56WHjquZwdbsqgVXJ2\nLIAOwhk7AIBICDsAgEgIOwCASHiPXYdWvPWw8MgTOTuc9yQBwE+aM3YAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJHwk2KQN8VbDwtPPJOzw/nJOIDo\nOWMHABAJYQcAEAkvxQK0i+Kth4VnXszZ4bzUDgRn7AAAoiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAikcr3APCd4q2H\nhYlP5exwUwatkrNjAUAOOGMHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCV938n2FhYX5\nHiFvOtvarTdu1hs36/2eurq63ExCByfsvq+8vHzRd6jNzRz5sMC1W280rDdYb0Ss93umTp2a\nm0no4ITd9y32fxtdczNHPixw7dYbDesN1hsR64UF8h47AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDuA/2/vzgNjOtc/gD9n9iXLTCYiEXuEEEsstRRlCKWtLY2dxN6frdaG\niH2tXW21FCWW2K9SpehCad2qS9GgRe2CrDNZZn1/f0wakVa4bjInc+b7+WvOe96ZPM+c5Mw3\nZ+acAQAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7\nAAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMA\nAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAQ7AAAAAIFAsAMAAAAQCAnfBTiH\n/buE1QdPnr9rEIfUbNhvZP/KKjdpHAAAANyIWxyxu7l38tKdPzaOzSgbMwAAFSNJREFUGDxt\ndJTHjRNxY9ba+S4JAAAAoMi5QbBj5iU7E4N6zuwa3iS0fvNRC0ZkPjy67X4m32UBAAAAFDHh\n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\nEIj/B9YOdQdwPcoGAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8715ce34",
   "metadata": {
    "papermill": {
     "duration": 0.013227,
     "end_time": "2024-12-19T00:36:50.729823",
     "exception": false,
     "start_time": "2024-12-19T00:36:50.716596",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 5: Export Summary File for further Analysis\n",
    "\n",
    "Create a csv file that we will visualise in Excel, Tableau or my presentation software\n",
    "\n",
    "Had to change the file location to Kaggle Output"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "f7e6e99c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:50.758920Z",
     "iopub.status.busy": "2024-12-19T00:36:50.757771Z",
     "iopub.status.idle": "2024-12-19T00:36:51.046516Z",
     "shell.execute_reply": "2024-12-19T00:36:51.045238Z"
    },
    "papermill": {
     "duration": 0.306324,
     "end_time": "2024-12-19T00:36:51.049229",
     "exception": false,
     "start_time": "2024-12-19T00:36:50.742905",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)\n",
    "\n",
    "write.csv(counts, file = '/kaggle/working/avg_ride_length.csv')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c90d33c5",
   "metadata": {
    "papermill": {
     "duration": 0.012499,
     "end_time": "2024-12-19T00:36:51.074474",
     "exception": false,
     "start_time": "2024-12-19T00:36:51.061975",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "From the visualisation of Number of rides by rider type generated in RStudio, it is evident from the chart that annual members account for the majority of rides across all days of the week. The highest ride counts occur during the weekdays, reflecting potential commuting behaviour. Casual riders, contribute far fewer rides compared to members, but their usage increases on weekends. This suggests that causal riders predominantly use the service for leisure or recreational purposes on non-working days.\n",
    "\n",
    "The insights gained from the analysis directly supports Cyclistic’s goal of converting casual riders into annual members. Causal riders primarily use bikes for leisure activities on weekends and tend to have longer ride duration's. In contrast, annual members use bikes for short, frequent trips, particularly on weekdays which likely aligns with commuting purposes. The distinct difference in behaviour highlights an opportunity for Cyclistic to promote the value of annual memberships by emphasising the benefits such as convenience, cost savings and suitability for frequent, shorter trips.\n",
    "\n",
    "Due to the fact that casual riders’ usage peaks during the weekends, Cyclistic can design targeted campaigns for this time frame, thereby showcasing the advantages of switching to annual memberships. Marketing strategies could include discounts for first-time memberships, referral bonuses or seasonal promotions aimed at encouraging casual riders to take advantage of cost savings and unlimited rides. By aligning campaigns with peak usage times, Cyclistic can effectively capture the attention of casual riders when they are most likely to engage with the service.\n",
    "\n",
    "In addition, causal riders longer ride duration's suggest they value the experience of cycling, whether for leisure or exploration. This behaviour can be leveraged in marketing messaging by highlighting the flexibility and freedom that comes with annual memberships, thereby allowing riders to explore and enjoy the city without worrying about per-ride costs. Combining this messaging with digital media campaigns can help communicate the value of memberships in both recreational and practical use cases. \n",
    "\n",
    "In Conclusion, these insights help Cyclistic design data driven marketing strategies that appeal to casual riders unique behaviours and motivations. By emphasising cost-effectiveness, flexibility and convenience, Cyclistic can increase the likelihood of converting casual users into annual members, thereby ultimately driving higher profitability and customer retention.\n",
    "\n",
    "# **Share**\n",
    "\n",
    "The data tells a story of two distinct user groups: casual riders who have longer average ride duration with higher usage on weekends, and annual members who have shorter, frequent rides throughout the week, peaking on weekdays. This highlights that casual riders are leisure focused, while annual members are consistent, frequent users likely leveraging the service for daily commutes.\n",
    "\n",
    "The findings address the question of how casual riders and annual members use bikes differently. Understanding these patterns provides a foundation for designing targeted marketing campaigns to convert casual riders into annual members. The audience of this study includes Cyclistic’s executive team and marketing analysts. To effectively communicate the findings a combination of data visualisations and a clear, concise summary of insights will be used. Charts created with ggplot2 clearly illustrate the differences in ride duration, frequency and usage patterns between the two groups.\n",
    "\n",
    "Data visualisations are essential for clearly communicating trends and insights. Bar charts showing the average ride duration and the number of rides by weekday help the stakeholders quickly grasp the key behavioural differences between casual riders and annual members. The presentation would be accessible to the audience as it will feature clean, professional visuals, clear labels and a brief narrative explaining the findings and their implications. Supporting data and summaries will be included in an accessible format such as slides, PDF report or a dashboard.\n",
    "\n",
    "## **Data Visualisations**\n",
    "\n",
    "### **Number of Rides by Weekday**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "cdc6ed85",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:51.103140Z",
     "iopub.status.busy": "2024-12-19T00:36:51.102050Z",
     "iopub.status.idle": "2024-12-19T00:36:51.884952Z",
     "shell.execute_reply": "2024-12-19T00:36:51.882976Z"
    },
    "papermill": {
     "duration": 0.80025,
     "end_time": "2024-12-19T00:36:51.887687",
     "exception": false,
     "start_time": "2024-12-19T00:36:51.087437",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nki2vAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at,label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + labs(title = \"Number of Rides by Weekday\", fontface = \"bold\", subtitle = \"Casual Riders vs. Annual Members\", caption = \"Made using 2019_Q1 and 2020_Q1 Data\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "050eba1c",
   "metadata": {
    "papermill": {
     "duration": 0.013256,
     "end_time": "2024-12-19T00:36:51.914579",
     "exception": false,
     "start_time": "2024-12-19T00:36:51.901323",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Average Ride Duration for each Rider Type**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "7f17d37f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-12-19T00:36:51.944340Z",
     "iopub.status.busy": "2024-12-19T00:36:51.943205Z",
     "iopub.status.idle": "2024-12-19T00:36:52.732062Z",
     "shell.execute_reply": "2024-12-19T00:36:52.730208Z"
    },
    "papermill": {
     "duration": 0.805981,
     "end_time": "2024-12-19T00:36:52.734200",
     "exception": false,
     "start_time": "2024-12-19T00:36:51.928219",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nVDk/ii1qH+UdSKRBV73XWt/bswfnSK6PYqvelX1+V8a/dr2uaqcPiuwr7zAvcFcCAPzER7H5\nqNnvzVviw7fO63nfy+uzX0bbtWrWTSv+scZcu/iyiq60P92qGtWitW9q2tEfnzmcLJK1ROrx\n59u1a3fzvF/Pr7bNZSLiSnWJiE2vy0j4zPdTURmnN9/1zWHfnEWuvGT0iuJ2HM3bHtNsbkWT\n/qsR9+9JdXlbMpN+GzNpm28Gg6XOjEZRe98ase5Ymq9xxd19Bg8efLCAI6jw4efVauZo1ZNx\n9/9mrD6V3u+5PiVbSS7z5+5QdOaFg2vnaFUMT91SW/U4Hlx9wJ+VFKmQXVmK+9Fe9e7uEZa1\nE7+ctXxf1SufCdHlvppWgn1UpJQjSx/+bN+5d+63J/RJcXv6PNkxAMcDAKCEgp0sy6n00xt6\nxNlFpHKTzreNvf/Be8dc36G+oihGW5239iSqqqq603tEW/WmynfPePrVl5dOe2B4ZWtEx1qh\nOkPEs/97N8Xt8bgSe1SwKjrLNcPGzpz31PQpdzePseqN0cv/S1ZVdeu0y0SkaqchC5e98tSM\niY3DTLZqNvHdPFHUykt2xW5FoxgR8T3PIsfjThYNEBFrhTajH5g27YE7WkRaavW6VbLdFZt8\n4J3qZoPRVuvmW+9/Yu7MYT0biUjTkVnP4Mh7xa7w4efH0z3CougVk71FmtvflRzZ2Ndutzce\nlM+11bST74pITLP5eSelHHleRMJrPZy1WS7sil1hu7Ko/aj6fcVOVdUf72qk6Mwicu+OrBtX\nc90VW/g+KsEVO3MFi6Iz3zBs7KwZk27sWlNE4q6e7fGjLzXPIVH84wEAUBIEuwK5Mg6+MGNs\np2a1wkPMBnNI1fjmA++a+cvx809nSDn49Yhel8dGh4RVrn3FdUM/2ZlwcsuTNSNtJnuFQw6X\nqqppx364d2CP6jFhBp0+NLpa1763rfo16xzscac+9+Dg+jUqGxVFRGI7Dv/+x2uyn8ULX3nJ\ngt32x1uLSN1bVnjfZg92qqpuXv7YlS1r282G0Ji4m+5+LjllV/Zgp6pq4p4v7uzbtXKE3WSL\natCi0/SXPneeewhZ3mBX+PDztXlcExFpNPZ7/1dyeH0vEanV95u8a9vycHMRGbTuUN5Jqqre\nGGNVFL03415gsCt8VxZ5kPgf7JL/WygiBkutZFfWds8V7NRC91EJgl2X5dtenn5Hi1qVLQZT\nhepNb532UpLr/HPnCulLze+QKO7xAAAoAUVVuTEtmDyOs4dOuqpXiwp2IbhQ7EoAQNAR7AAA\nADSCmycAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBG\nEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaIQh2AWUL6qqpqamBruKLDqdzmg0iojD4Qh2LYGg\n1+sNBoOqqpmZmcGuJRAMBoNer790xms0GnU6ncfjcTqdwa4lEEwmk6Iobrfb5XIFu5ZAMJvN\nIuJyudxud7BrKXOKophMJhFxOp0ejyfY5Zxnt9uDXQKCj2CXg6qqGRkZwa4ii9lsttlsIpKU\nlBTsWgLBarUajUaPx3P27Nlg1xIIdrvdaDQ6nc7yc8iVKZPJZDQaHQ7HJTJeq9Wq1+svnf3r\njRSXyP7V6XQhISEikpaWVq7+oUKwg/BRLAAAgGYQ7AAAADSCYAcAAKARBDsAAACNINgBAABo\nBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEO\nAABAIwyB6UZ1nVn10guf//jb6Qxdlbi6vYeNubplZRER8axfufST77b9l6xv0KTtyHtH1bYZ\nCm0v3UUAAAC0I0BX7L56fMLyDcd7j7rvidmTu8U7ls64e/V/KSKy74NpC97Z1K7fHdPHDbf/\ns27qAy94RAppL91FAAAAtCQQwc7t+G/Z1lOdH3n0hm7t6zZodtPdj/eM0K9e+oeomfPf2R0/\neNaAHu0bt+58/5P3pB79cvnh1ALbRUpzEQAAAG0JSLDL2F+jVq1ra4eda1BahpudiSmOpO8O\nZrh79oz1tpojOrW0m7auP1ZQu4iU4iIBGDgAAEAgBeKrZqbwzgsXdva9dab8+eqRlBqj6mem\nvicijWxG36SGNsMXO5Iyr9iRb7sMkczU/CeVYBEZkvV26dKlmzZt8r622+2LFy8uvaFfEEVR\nvC8iIiKCW0lg6HQ6738vqfEaDIZLZLx6vV5ETCbTJTJe7/61WCwmkynYtQSOzWazWCzBriJw\n7Ha7qqrBriJLYmJisEtAuRDoewgObFmz6NlXnbWvmdqrmutAqohEG85fNYwx6l0pGR5H/u0i\nUtCkEizie3vkyJHdu3d7X0dGRhoM5e6+inJYUpm6pMarKArj1TCdTudNeJeIS2283n+uAOVK\n4P6GzTyz59XFiz7/NaFr/7GP3dLNoijJJquInHF57Of+bJx2uvURJl0B7SJS0KQSLOIr7LLL\nLrPZbN7XVqs1I+N85gsuvV5vNBpFpPyUVKYMBoPBYFBV1eFwBLuWQDAajXq93uPxZGZmBruW\nQDCZTDqdzu12O53OYNcSCGazWVEUl8vlcrmCXUsgeC/UOZ1Ot9sd7FrKnKIoZrNZRDIzMz0e\nbsZD+RKgYJd8YN34Cc/pm17z5EvD68dkXag3hjQV+W5PuivOnBW59qa7wjtFFNReuov4auvT\np0+fPn28rz0eT0JCQpluCv+ZzWZvsEtJSQl2LYFgtVq9we4SGa/dbtfr9W63+xIZb1hYmMlk\ncrlcl8h4vcE9MzMzLS0t2LUEgjfYORyOS+Efojqdzhvs0tPTL5F/qOAiEohr5qon7bHJS83d\n71v66GhfqhMRS8SVVU36L78/4X3rTN3+c3Jmqx6VC2ov3UUCMHAAAIBACsQVu7QTy3elOUc1\ntW3dsuV8x9Y6LRpHTOjfYOLrM76uMqlxpPPjJc/YqnQfXs0uIgW1i2IqxUUAAAC0RAnAHT3H\nvp86+snfczWGxT38vyXtRHWvfXPhO2t/Pp2hxDfvOubBO+qEGESkwPZCJpVgkTzK20exoaGh\nInLq1Klg1xIIVqs1JCSkXO2CMmW32y0Wi9PpTEpKCnYtgeD9KNbhcCQnJwe7lkCIjIzU6/Vp\naWmXyEexMTExIpKSknKJfBQbFRUlIklJSeXqo1jvXsAlLhDB7iJSrlIFwU7bCHbaRrDTMIId\nyrNL6L50AAAAbSPYAQAAaATBDgAAQCMuoUfAA0DoU7MC05FLxCUi0+cFpjsA8OKKHQAAgEYQ\n7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAA\nADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSC\nYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcA\nAKARhmAXAABA6Qh9alZgOnJ4//fw7MB0B/iPK3YAAAAaQbADAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAA\noBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEE\nOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g\n2AEAAGgEwQ4AAEAjDMEuoNwxGo3BLiGLXq/3vig/JZWpS228Op3O+1/Gq2F6vZ7xapjBUI7O\noU6nM9gloFwoRwdlOREWFhbsEnIrhyWVHZ1Od4mMV1EUEdHr9ZfUeI1GY3DHmxnY7sxms8lk\nCmyfwWSxWCwWSxALCPD+tdlsge2wMKdPnw52CSgXCHa5lZ8/G2azOTQ0VMpTSWXKarWGhIR4\nPJ6EhIRg1xIIdrvdYrE4nc6kpKRg1xIIYWFhJpPJ4XAkJycHsYzQwHaXlpaWlpYW2D6DIyYm\nRkRSU1MzMjKCWEaA9+/Zs2e5Tobyhu/YAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBG\nEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwA\nAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0\ngmAHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABphCHYBKO9Cn5oVsL4cIsa5CwPWHQAA\nGsMVOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEE\nOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g\n2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEA\nAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgE\nwQ4AAEAjCHYAAAAaQbADAADQCEOA+3t97AjLrGWDKli9b49vmnrH3N+zz3Dra+/2jbaIeNav\nXPrJd9v+S9Y3aNJ25L2jatt8pRY0qQSLAAAAaEcg8426d+Mrq44kDlBVX1Pi9kRr9A3339HY\n11Ij1Cgi+z6YtuCdA0PvvufWSNdnLyyZ+kDm8hfu9l5dLGhSCRYBAADQkgAFuxObFk5e/P3p\nlMzc7bvORjTq0KFD4xytaub8d3bHD356QI94EanzpDJg+JPLD48cFhtS4KSqxmIvEhsSmLED\nAAAERoCuW0U0HjB11rynn5icq337WUdkywh3+tljJxJ91/EcSd8dzHD37BnrfWuO6NTSbtq6\n/lghk0qwSJmOFwAAIPACdMXOFBZbJ0zcmZZc7b+mONXvF928+E+nqhpCKlx9y/133tAsM3WH\niDSyGX2zNbQZvtiRJEOkoEmZVxR7ERmS9Xb+/PkbNmzwvg4PD3/ttddKc+QXQFEU74vIyMgg\nluEKbHc6nS644w0YnU4nIgaD4ZIar8lkuqSOZ6vVajabA9tnMNlsNqvVGsQCArx/Q0ND1Wxf\nLgquM2fOBLsElAvBvIfAnXk4RW+sGdPhieWzItTkn9a8+tRL08x137zRlCoi0YbzVxNjjHpX\nSoaIeBz5TyqovZBFfG8TEhIOHz7sfZ2WlqbX68tktBcguCUF+C9KCfZ4A0xRFMYbSAE+noM+\n3gDzxvcgCvw/RAPbIVC0YAY7vSn23XffPffO3HngpL++2PrNy3/cNM4qImdcHvu5vxBPO936\nCJOI6Ez5TyqovZBFfGV06dKlUqVK3tcWiyU9Pb0Mx1wcer3eZDKJSHBLCvDfW6qqZmRkFD3f\nxc9oNBoMBo/H43A4gl1LIJhMJr1e73a7MzNzf9c2kAJ8PLtcLqfTGdg+g8N7oc7pdLpcgf/H\n4HkB3r8Oh8Pj8QS2T6AI5eupHy0rWb9OOGkMaSry3Z50V5w5K4rtTXeFd4oQkYImlWARX6dX\nXXXVVVdd5X3t8XgSEhICMtaimc1mb7BLTU0NYhmhge1OVdXgjjdg7Ha7wWBwu92XyHj1er1e\nr3e5XJfU8ZyZmZmWlhbYPoPDG+wcDkdw/2EW4P2bkZFxiQR3XESCeRk58a8lt91+97FM3z93\nPBuOpEU0qmeJuLKqSf/l9ye8rc7U7T8nZ7bqUVlECppUgkUCN04AAICACGawC6s9MDrt+OQZ\nL/zyx569O7evXDjpu9TQ0bfXE8U0oX+Dv1+f8fXWPUf3/fHqo8/YqnQfXs0uIgVOKsEiAAAA\n2hLMj2J1hpjZS2a+tmz5ojnTMvShtes2mbRgRku7UUTqDJxzl2PhygWPns5Q4pt3nTPrDl8C\nLWhSCRYBAADQEqX83KpdHpS379iFhoaKyKlTp4JYRuhTswLZnXHuwvKzC8qU3W63WCxOpzMp\nKSnYtQRCWFiYyWRyOBzJyclBLCPAx7N7+rxL5Dt2MTExIpKSkhLk79gFdv9mPDy7XH3HzrsX\ncInj0hUAAIBGEOwAAAA0gmAHAACgEQQ7AAAAjShfDygGgi6QX752iOjmPBOw7gAAmscVOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g\n2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEA\nAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgE\nwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4A\nAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAj\nCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYA\nAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAa\nQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjDMEuoNwxGo3B\nLiGLXq/3vig/JQXGJTVenU53iYxXp9PJpTReL71ez3g1zGAoR+dQp9MZ7BJQLpSjg7KcsNvt\nwS4hi6Io3hfBLckV2O50Oh3j1SRvsDMYDJfU/jWZTOXq3F/WzGazyWQKYgEB3r9Wq1VV1cD2\nWaAzZ84EuwSUC5fQ3zh+Kj9/Nsxmc2hoqAS7pNDAdufxeC6p8bpcrqSkpMD2GRxhYWEmkykz\nMzM5OTmIZQR4/6anp6elpQW2z+CIiYkRkbS0tIyMjCCWEeD9m5yczHUylDd8xw4AAEAjCHYA\nAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAa\nQbADAADQiOL9VmzCoX0nU/P5Xbz69euXUj0XgdCnZgWsL4eI+YlFAesOAABc1PwNdhmnvr6p\n08A1exLynaqqaumVBAAAgJLwN9i92GfY53uTrx87pVezmgalTEsCAABASfgb7Ob8crL2wA8/\nWdq7TKsBAABAifl184TqTj7pdNcY2KysqwEAAECJ+RXsFL39igjLvte3lHU1AAAAKDE/H3ei\nrPx0dubnQ0fOfuN4qqtsKwIAAECJ+Psdu/5TPqpUxfjGoyPfnH5bVOXKVn2OGyj++++/MqgN\nAAAAxeBvsIuJiYmJ6VGjRZkWAwAAgJLzN9itWrWqTOsAAADABeInxQAAADSieD8plnZ4+/sf\nrd2170ia21ClduOr+vZvHWcvo8oAAABQLMUIdh88OmjIY+86POd/PWzquDEDpi5/Z9ZNZVAY\nAAAAisffj2L/fW9I/9nvVOx66ztrfzp84vSZk0d++eb9266o9O7s/sM+3F+WFQIAAMAv/l6x\ne3rcx/bYkX9+/ZJNl/WgkzZX3tS66zWeGpXfvfcZ6be4zCoEAACAX/y9YrfyZFq90ff7Up2X\norPdf0/99JMryqAwAAAAFI+/wc6u02Ucz8jbnnE8Q9Fz/wQAAEDw+RvsxtUN//vNu7accWRv\nzEzads/Lf4XXub8MCgMAAEDx+Psdu1Hvz5re+N6ONZvfes+ojs3qWCT9n99/fP25V/9KMy16\nb1SZlggAAAB/+BvsIurftWutYehdDy97fMqyc41R9bssWfLWmAYRZVQcAAAA/FeM59hVu3L0\n+t13HPpz685/jjjEXLV2o1YN4/jlCgAAgHKieL88IaJUa9CmWoMyKQUAAAAXorBg17JlS0Vn\n3rZ1s/d1IXP++uuvpVwXAAAAiqmwYGe32xWd2fs6IoIv0gEAAJRrhQW7jRs3+l5/++23ZV8M\nAAAASs7fmx/at2//9KGUvO3Hfryvc7dhpVoSAAAASqKImyfO/vv30Uy3iGzevLn27t17UsNy\nTlf/+Oy7HzfuL6vqAAAA4Lcigt0HvS6/9a8E7+u3r2r7dn7zhNW8u7SrAgAAQLEVEew6zJq/\nLDFDRMaMGdN19oLBFay5ZtAZQ9vf1L+sqgMAAIDfigh29QeOqC8iIitXrux76+13VrXnmkH1\npCWnukRMZVMeAAAA/OXvA4oLuiv20Nc31u79pzPjQOmVBAAAgJLwN9ip7pTnxt3xxrotp9Nd\n2duPHTygWBuVQWEAAAAoHn8fd/LrrCvue27l2Yha9aq49u/f36BZi+bNGhhOH1Girlz60Rdl\nWiIAALjU2PS6uoO/C3YVwbcgPtIWfb3/8/t7xe7hxTujm8z568epqjultj2y03NvTo0LTT+x\noUmta1OqhpSoVAAAAJQmf6/YbTybWXPQ9SKi6O3DKtq+2XZaRKwVu745suac/i+VYYEAAADw\nj7/BLtKgOJOd3teXVws5/NFh7+sa/aol/r2gTEoDAADlgZrpcKnleoWF8rgS3QHrLNj8DXa3\nx4b+/dq8/xxuEYnrHXtozYve9mPrjpdVaQAAIHhWNowJr/HoLy8+WC3cbjXpIyrWHvrwmx6R\nLa9PblmzktVsr9Xo8hkrdmVfJOXAd+MGXV29QoQ5JKpBy24zX1jjubAV7nh/btemNUJM5pjY\nBoPvf+ZwptvP7l6rHx0Zv8CR+PPQKxrZzVEpbr9y5NEflt/cs010qMUWXqHdNUPe++Wkb9Lu\nj5f0vaJVTHiIwWStEt9sxKRFCdmyqcd5asmUW5vFV7YYjWHRcd0H3rf5VIZ30qS4sLC4Sdl7\n2T6ztaIo+x1uP1deLP5+x+7OV++YdeXT8THV95w8GD/89rSHxrYfValfLeczz/wR1fjpkvUN\nAADKs7QTyzvdc2bIuEcujzN/vHTu8rkj9ux7Zee6tAcfnDbc/e+zjy2eNaxNj+sSO4WZRCT1\nyOoWDW8+qMQOGXVHnRj9b+vfmzHmutU/vvbrGyNLtsKT2x5t9e6PPQaMGN8n9LcN769cNOHr\n7/Ye3LrMqhN/uvO4Eka06HW687DHF91n1SlFDvbY93PqXjFdjbls+J2TK+oTPnzl5UEdvzi7\n59/baoX999ndTfo+H1a/6+33To4yuXb98OGbT92/6Uj8X/+7zrvswmtbTFh37MqBowfcHnf2\n4JZlLy3psfHgmcOrjUV3K0WuvFj8DXZVuj756wdVZr7wiU6RkCp3rhj3/pCFT29W1bD4q9//\n4s4SdAwAAMo5V8a+CesOP9WtqoiMGNLYGn39r6v/3nBsX8cIs4j0jv+tzi3fLD6U3KlRtIg8\nfdXtB5U6Gw5uax9tERGReavHt7xx/qjHpt84tXZ4CVaY9NeG8R/uefrGeiIi6pOv3dXy1mUv\nDP30oQ961/Cnu+T/HktctGXtPa38GqqaOaz3Y56Iq7b983GDEKOIPDS5f2zlbtNuWXPbpkHf\nTn5XZ477bfvX1c16ERGZVaFa2LIvXhC5TkRc6X9NXHckrtf761b0866sX2jH3q/98OGp9IF5\nfrIrr8JXXlx+fhTrcTgcjfo+8OEX39Qw60Vk4Py1CQf+3L77wKm9X/SsWHTRAADgomO0NfCG\nMBGxRF0XqtfFNFnoDWEiUqFDZxFJd3pExJW2c/auhAZj3zgXs0RErn30WRF55/m/SrBCEbFX\nGZ2V6kREMQxbsMqm1218dL2/3SnmN+9s4edIkw8v+PpMRusnn/WmOhGxRHVd/fxzj9wWIyL9\nv99z/Miuc8FLVE+qQ1VVd1pWPzqrSZHE3R9u+S/Z29L+yR9OnjzpT6orcuXF5dcVO9WdHGGL\nvPztvesHxvsaw+LqNS9ZnwAA4GKgM0Rnf2tQxFwh0vdW0Rl9rzMSPner6u/PtFWeyb2SpN+T\nSrBCEYlsmuPH6A2WOtdFWdYc3ygywp/uTPYWFY3+3ktwdu+3ItKxW6XsjZ1vG9tZRERsEVEJ\nv3zxxhff7fzrnwMH9+/e8dvhRIclIms2vTnuy7nDrn/4f21rrKjR5PIO7dp16Xb1gP5XRRn8\n+CC2qJUXl1/BTtGHj28Y9earv0i2YAcAAJBFZxKRppNe9V2Q8zGH+3vZLJe8scigiKIz+9md\noivGc3Y9Do+ImJT8o9gH47sPWPBtbMtuN1zZ7vqOvcbPan54dM97TpyfocukN06MfGj16k/X\nf/f9D2tff/ulBQ8+0G71H9/2zHZB0Uf15LgxosiVF4u/37F7ZOOa7R2vu3uRddad10efu1oI\nAAAgIpaoa/XKOFdi/auv7uBrdKX/+cHHv1VubivZOhP+WC3S0/fW7dj/yemMsPbdy6K7sHqt\nRNb+8PMpqRHma/xm8ti3Tke+sKD3wAXfxl277MCno32TXsu2rDNlz7adidHNWw8aPWHQ6Aki\nsvvz2Y2uffT+ab/uer69t/bsfR3fkuB7nZm8ufCVF5e/lyivv3lqeqXqz4+7sYIttEq1GrVy\nuoACAADARc9gqTOjUdTet0asO3b+y2Er7u4zePDgg/5mjdxSjix9+LN95965357QJ8Xt6fNk\nx7LoLqzGQ83tpp/um/BvRlYIy0zaNPzZlz79uaIr7U+3qka1aO2bdYHsdAAAIABJREFUOe3o\nj88cThbJuvCWevz5du3a3TzvV98MNdtcJiKuVJeI2PS6jITPTp374mDG6c13fXPYN2eRKy8u\nf6/YWSwWkarXXZf7gicAAICIjFuz9KV6Q66Jb3LjoN6t60b98c07b639q+nIt4ZVLOEVO3MF\ny7zejf4Ycutl8aG/fvvuqg37466evaR9pbLoTtGHf/S/u+re+GzTOl1HDb26sjFx1UvLjrpD\nlrw/0lbB0iP6rm+fuv4e44TW1Wz7dm5+ednH8ZUtmf9tW7T8vdsG9w+vObNHhRfXze5y7b5R\n7RrX9iTuX/3yq3pj9IzHW4pI72H1Zs75pXm34ZOGdnMe+/P1+c8ejzHJIZe3X1uFQYWvvLgD\n8TfYffLJJ8VdNQAAuHTYq9+8Y0f45MlzP/rwldWZptr1Gk1/6fNpt/Uq8QovX/jj8L+ef+7N\nVWtXJIRWrX/rtJcWzLjN9yW4Uu+uRp8Fu9c0ePDx595cPNuh2BtffsMbcxYOrRchIqt//eTu\n0VNXL57+lrFSq9YdXtqyr136y5f1nDFxzN03DegXYgr/+PevJ98//aPPl69dnmqNrNKq8y3v\nT3+ibzW7iLScuf65tNsXf7Bu4ti3naoa23H4V0+d7NTh86xedZbCV17cUSiqGrjf9Cj/PB5P\nQkJC4fOEPjUrMMV4mZ9YdOrUqUD2mEuAx2ucu7DIXVCmAjxe3ZxnkpKSip7v4hcWFmYymRwO\nR3JychDLCPD+dU+fl5ZWwmcWXFxiYmJEJCUlJSMjI4hlBHj/Zjw82+l0BrLHwnn3Asotj+Ps\noZOu6tWiyrQXf6/YFX7uCQ8PL41iAAAAtElnDqtercx78TfYRUQU9kAVLvsBAIDyaf+q61ve\n+kMhM5jDux7bvzpg9ZQpf4PdjBkzcrxXXUf27Vr9zkcJSuyM5x8v9bIAAABKRc0bPz1zY7CL\nCBR/g9306dPzNi586qfu9boufHbr1FFDSrUqAAAAFFtJny0jIiLWSpe/NKvFqd8WbEhylFZB\nAAAAKJkLCnYiYqtmUxR9fZux6FkBAABQli4o2HmcJxc8st1ob1nZ7x/ZBQAAQBnx9zt27du3\nz9PmObp3x4HTGW2mPVe6NQEAAKAE/A12+dHFNe3Wt/vQJ6deXmrlAAAAoKT8DXabNm0q0zoA\nAABwgQoLdh999JGfa+nTp09pFAMAAMqFsvs1S376rEwVFuz69u3r51r45QkAADSmLH57N3ni\no6W+TmRXWLBbv36977XHeeKRISN/Sa96672ju7VrEqHP2Ltz07InFx+N679+zfwyLxNA2QjY\n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\nTgAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + labs(title = \"Average Ride Duration for each Rider Type\", subtitle = \"Casual Riders vs. Annual Members\", caption = \"Made using 2019_Q1 and 2020_Q1 Data\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f89af15f",
   "metadata": {
    "papermill": {
     "duration": 0.014252,
     "end_time": "2024-12-19T00:36:52.762963",
     "exception": false,
     "start_time": "2024-12-19T00:36:52.748711",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Presentation**\n",
    "\n",
    "To view my presentation click [here](https://docs.google.com/presentation/d/1_TtCAj7LnrqlN8IK_eXAM33pKqr4IB8s/edit?usp=sharing&ouid=104952222776858457522&rtpof=true&sd=true)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "17c03a49",
   "metadata": {
    "papermill": {
     "duration": 0.014676,
     "end_time": "2024-12-19T00:36:52.792503",
     "exception": false,
     "start_time": "2024-12-19T00:36:52.777827",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Act**\n",
    "\n",
    "The analysis highlights that casual riders and annual members use Cyclistic bikes differently. Casual riders tend to use the bikes for longer duration's, primarily on weekends, which suggests a preference for leisure and recreational activities. In contrast, annual members use the bikes for shorter, frequent rides throughout the weekdays, indicating routine commuting behaviour. To convert casual riders into annual members, Cyclistic should emphasise the cost-effectiveness, convenience and flexibility of annual memberships while tailoring marketing to align with casual riders habits.\n",
    "\n",
    "The marketing team can apply these insights via designing targeted campaigns and promotional offer. For example, focusing on weekends with specific promotions for leisure riders, creating cost comparisons to highlight the savings of an annual membership and offering seasonal discounts or event based incentives. These strategies directly address the behaviours and motivations identified in the analysis, making the marketing initiatives more effective.\n",
    "\n",
    "The next steps would involve implementing and testing these strategies to measure their impact. Cyclistic should roll out targeted campaigns, introduce limited time offers like seasonal discounts or free trials, and then monitor key performance indicators such as membership sign ups, conversion rates and changes in casual rider behaviour. By tracking these metrics, the team can evaluate the effectiveness of the campaigns and would be able to refine the strategies as needed in order to optimise the results.\n",
    "\n",
    "In order to expand on these findings, additional data could provide a deeper understanding of user behaviours and preferences. For example, demographic data such as age, location or occupation, could help tailor the marketing messages to specific user segments. Long term seasonality trends from multiple years would offer more predictive insights for peak usage times. In addition, conducting customer surveys would allow for Cyclistic to gather direct feedback from casual riders to understand their barriers to purchasing memberships and identify which benefits they value the most.\n",
    "\n",
    "By consolidating these insights into a final presentation or report, Cyclistic can confidently move forward with data-driven strategies in order to increase annual memberships. This process ensures that the findings are actionable, measurable and aligned with the company’s goals of profitability and growth."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "56700b52",
   "metadata": {
    "papermill": {
     "duration": 0.014259,
     "end_time": "2024-12-19T00:36:52.821244",
     "exception": false,
     "start_time": "2024-12-19T00:36:52.806985",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **References**\n",
    "\n",
    "## Data Sources\n",
    "\n",
    "1. Cyclistic bike-share trip data for Q1 2019 and Q1 2020, provided by Motivate International Inc. under the Divvy Data License Agreement. Available at [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html).\n",
    "2. Divvy Data License Agreement: [https://www.divvybikes.com/data-license-agreement](https://www.divvybikes.com/data-license-agreement)."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 6332685,
     "sourceId": 10240343,
     "sourceType": "datasetVersion"
    },
    {
     "datasetId": 6332689,
     "sourceId": 10240349,
     "sourceType": "datasetVersion"
    },
    {
     "datasetId": 6332885,
     "sourceId": 10240636,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 23.905642,
   "end_time": "2024-12-19T00:36:53.055033",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-12-19T00:36:29.149391",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
