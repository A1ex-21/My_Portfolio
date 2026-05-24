# Sentiment Analysis Web Application

*Alexander Thompson, B.S.c*

This is a web application that runs through the Flask channel using the IBM Watson Embedded AI Sentiment Library.

This uses the IBM Watson's NLP BERT Sentiment Analysis Function, via a pretrained model.

## Pretrained Model

```
sentiment_aggregated-bert-workflow_lang_multi_stock
```

This BERT Model uses the Google Multilingual BERT Foundation Model as a base.

This pretrained sentiment model is one of many pretrained sentiment classification models by IBM for sentiment analysis.

When the pretrained model predicts the sentiment the expected output is one of 3 predictions that of Positive, Neutral or Negative along with its sentiment analysis score. The predictions are returned in JSON format and so must be parsed in order to be used for analysis.

The Model can be accessed via a REST API with the REST Hostname being:

```
https://sn-watson-sentiment-bert.labs.skills.network
```

## The sentiment_analyzer() Function

The `sentiment_analyzer()` function is used to apply Sentiment Analysis to the text.

### Functionality

It takes in the text inputed by the user and sends it in a POST request to the IBM Watson Model endpoint. If the status code of the request is 200, then the response from the Model is then parsed using the `json.loads()` function and the inner dictionary is accessed. Then the label and score is stored in their respective variables which is then formatted into a dictionary. From the servers endpoint for the function, it will return the string `"The given text has been identified as POSITIVE/NEGATIVE/NEUTRAL with a score of ..."`. 

### Error Handling

Error handling for a server error with a status code of 500, assigns the variabels `label` and `score` as `None`. On the sevrer side, if the `label` is equal to the value `None` for error handling, then it returns the string `"Invalid input! Try again!"`. The same error handling is conducted for any other types of errors.

## More information

To find out more about the IBM Watson BERT NLP Sentiment Model, click [here](https://www.ibm.com/docs/en/watson-libraries?topic=catalog-sentiment).
