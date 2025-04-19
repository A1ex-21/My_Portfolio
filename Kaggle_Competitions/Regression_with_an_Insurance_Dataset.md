---
title: "Regression with an Insurance Dataset"
author: "Alexander Thompson"
date: "2025-02-07"
output: html_document
---

## Introduction
This project focuses on building a regression model to predict insurance premium amounts using a dataset from the Kaggle competition, *Regression with an Insurance Dataset*. The dataset contains demographic, financial, and behavioral information about individuals, with the goal of predicting the target variable, premium_amount.

The analysis involves data preprocessing steps such as handling missing values, encoding categorical variables, and aligning features between training and test datasets. An XGBoost model was used for prediction, with hyperparameter tuning and feature engineering to improve performance. This document outlines the end-to-end workflow, including data cleaning, exploratory data analysis (EDA), model training, and evaluation.
## Loading the Packages
```{r}
library(data.table)
library(janitor)
library(caret)
library(xgboost)
```

## Loading the Data
```{r}
setwd("E:/R/Spreadsheets")
train <- fread("train.csv")
test <- fread("test.csv")
```

## Exploratory Data Analysis (EDA)
```{r}
summary(train)
summary(test)
str(train)
str(test)
View(train)
View(test)
```

## Cleaning Column Names
```{r}
train <- janitor::clean_names(train)
test <- janitor::clean_names(test)
```

## Handling Null Values
```{r}
colSums(is.na(train))
colSums(is.na(test))

train[is.na(age), age := median(train$age, na.rm = TRUE)]
train[is.na(annual_income), annual_income := median(train$annual_income, na.rm = TRUE)]
train[is.na(number_of_dependents), number_of_dependents := median(train$number_of_dependents, na.rm = TRUE)]
train[is.na(health_score), health_score := median(train$health_score, na.rm = TRUE)]
train[is.na(previous_claims), previous_claims := median(train$previous_claims, na.rm = TRUE)]
train[is.na(vehicle_age), vehicle_age := median(train$vehicle_age, na.rm = TRUE)]
train[is.na(credit_score), credit_score := median(train$credit_score, na.rm = TRUE)]
train[is.na(insurance_duration), insurance_duration := median(train$insurance_duration, na.rm = TRUE)]

test[is.na(age), age := median(test$age, na.rm = TRUE)]
test[is.na(annual_income), annual_income := median(test$annual_income, na.rm = TRUE)]
test[is.na(number_of_dependents), number_of_dependents := median(test$number_of_dependents, na.rm = TRUE)]
test[is.na(health_score), health_score := median(test$health_score, na.rm = TRUE)]
test[is.na(previous_claims), previous_claims := median(test$previous_claims, na.rm = TRUE)]
test[is.na(vehicle_age), vehicle_age := median(test$vehicle_age, na.rm = TRUE)]
test[is.na(credit_score), credit_score := median(test$credit_score, na.rm = TRUE)]
test[is.na(insurance_duration), insurance_duration := median(test$insurance_duration, na.rm = TRUE)]
```

## Checking Column Consistency
```{r}
setdiff(names(train), names(test))
setdiff(names(test), names(train))
```

## Ensuring Column Consistency
```{r}
missing_vars <- setdiff(names(train), names(test))
for (var in missing_vars) {
  test[[var]] <- 0  
}
```

## Creating a DummyVars Object
```{r}
dummies <- dummyVars("~ .", data = train[, !names(train) %in% "premium_amount", with = FALSE])
```

## Applying Encoding
```{r}
train_encoded <- as.data.frame(predict(dummies, newdata = train))
test_encoded <- as.data.frame(predict(dummies, newdata = test))
```

## Spliting Train into Train/Validation
```{r}
set.seed(123)
trainIndex <- createDataPartition(train$premium_amount, p = 0.8, list = FALSE)
train_data <- train[trainIndex, ]
val_data <- train[-trainIndex, ]
```

## Encoding the Validation Data
```{r}
val_encoded <- as.data.frame(predict(dummies, newdata = val_data))
```

## Encoding the Train and Test Datasets
```{r}
train_data_encoded <- as.data.frame(predict(dummies, newdata = train_data))
test_encoded <- as.data.frame(predict(dummies, newdata = test))
```

## Aligning Columns test_encoded with train_data_encoded
```{r}
missing_cols <- setdiff(colnames(train_data_encoded), colnames(test_encoded))
for (col in missing_cols) {
  test_encoded[[col]] <- 0
}

extra_cols <- setdiff(colnames(test_encoded), colnames(train_data_encoded))
test_encoded <- test_encoded[, !(colnames(test_encoded) %in% extra_cols)]
test_encoded <- test_encoded[, colnames(train_data_encoded)]
```

## Converting to Numerical Values
```{r}
train_matrix <- xgb.DMatrix(data = as.matrix(train_data_encoded[, -ncol(train_data_encoded)]), label = train_data$premium_amount)
test_matrix <- as.matrix(test_encoded)
```

## The Model
```{r}
params <- list(objective = "reg:squarederror", eval_metric = "rmse")
xgb_model <- xgboost(params = params, data = train_matrix, nrounds = 100)
```

## Features in train data used to train the Model
```{r}
trained_features <- colnames(as.matrix(train_data_encoded[, -ncol(train_data_encoded)]))
```

## Features in the test data
```{r}
test_features <- colnames(test_encoded)
```

## Identifying any mismatches
```{r}
setdiff(trained_features, test_features)
setdiff(test_features, trained_features)
```

## Adding missing Columns to test_encoded
```{r}
missing_cols <- setdiff(trained_features, test_features)
for (col in missing_cols) {
  test_encoded[["property_typeHouse"]] <- 0  
}
```

## Remvoing extra Columns from test_encoded
```{r}
extra_cols <- setdiff(test_features, trained_features)
test_encoded <- test_encoded[, !(colnames(test_encoded) %in% extra_cols)]
```

## Reordering the Columns
```{r}
test_encoded <- test_encoded[, trained_features]
```

## Verifying the Alignment
```{r}
all.equal(colnames(as.matrix(train_data_encoded[, -ncol(train_data_encoded)])), colnames(as.matrix(test_encoded)))
```

## Converting to Matrix and Predicting
```{r}
test_matrix <- as.matrix(test_encoded)
test_predictions <- predict(xgb_model, test_matrix)
```

## Saving the Submission
```{r}
submission <- data.frame(Id = test$id, Premium_Amount = test_predictions)
```

## Exporting the Submission
```{r}
write.csv(submission, "E:/R/Spreadsheets/Exported from R/submission.csv", row.names = FALSE)
```

When Submitting the Submission file on Kaggle, had to load the file on Excel and change the Column Name for Premium_Amount to Premium Amount.