# Emotion Detection Web Application

*Alexander Thompson, B.S.c*

This is an emotion detection web application that runs through the Flask channel using the IBM Watson Embedded AI Library.

From this library it uses the IBM Watson's NLP Emotion Predition Function.

Emotion Prediction extends on the concepts of Sentiment Analysis by extracting the finer emotions such as joy and anger rather than the single polarity that Sentiment Analysis provides.

## Pretrained Model

The pretrained model by IBM that will be used in this web application is:

```
emotion_aggregated-workflow_lang_en_stock
```

This is for the English language.

This emotion detection pretrained model is one of two models, with the other being for the french language. The pretrained models were trained on data by IBM on varying types of data such as social media conversations/commentary, TED Talks and movie scripts.

The model can be accessed via a REST API with the Rest Hostname of:

```
https://sn-watson-emotion.labs.skills.network
```

## The emotion_detector() Function

This function is used to carry out the emotion detection for the web application. It is imported via the package `EmotionDetection` and is activated in the endpoint `/emotionDetector` in the server.

### Functionality

The function takes the user text and sends it over to the IBM Watson Emotion Detection Model endpoint via a POST request. If the status code is 200, as in everything went successful, then the seriallised JSON response is deserialised and formatted into a python dictionary and the dominant emotion is found in the dictionary. This is then formated into a dictionary which is returned to the server.

On the server side, a filtered version of the dictionary is created to not include the `dominant_emotion` key for listing out just the emotions to the client. This follows the format of the response to the client being:

`For the given statement, the system responsse is anger {score}, disgust {score}, fear{score}, joy {score}, sadness{score}. The dominant emotion is {dominant_emotion}`

Therfore we need to have the filtered dictionary for the first part of the response and then implement the `dominant_emotion` key in the latter part of the response.

### Error Handling

If the status code from the request is 400, that being an invalid input such as a blank space, then it will assign a value of `None` to all the keys in the dictionary. On the server side, if the `dominant_emotion` key has a value of `None`, then it will return the text `Invalid text! Please try again!` to the client.

### Unit Testing

Using the `unittest` package, the function passed all the unit tests for each emotion.

## Static Code Analysis

Static code analysis was conducted on the server's Python file via the package Pylint and reached a score of 10/10.

Results:

```
theia@theiadocker-alexanderth3:/home/project/final_project$ pylint server.py

-------------------------------------------------------------------
Your code has been rated at 10.00/10 (previous run: 8.67/10, +1.33)

theia@theiadocker-alexanderth3:/home/project/final_project$ 
```

## More information

To find out more information about the IBM Watson NLP Emotion Detection Model, click [here](https://www.ibm.com/docs/en/watson-libraries?topic=catalog-emotion).
