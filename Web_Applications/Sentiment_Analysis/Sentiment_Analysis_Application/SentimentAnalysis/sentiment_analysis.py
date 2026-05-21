"""
This module contained the function sentiment_analyzer that is used for sentiment analysis.

This is done with the IBM Watson NLP BERT Sentiment Analysis Function
"""
import json
import requests
def sentiment_analyzer(text_to_analyse):
    """
    Sentiment Analysis Application

    Parameters
    ----------
    text_to_analyse: str
        Takes in the text to be analysed by the sentiment analyser
    Returns
    -------
    Analysed text by sentiment analyser

    Notes
    -----
    Uses IBM Watson BERT Based Sentiment Analysis
    """
    # URL of the sentiment Analysis service
    url = 'https://sn-watson-sentiment-bert.labs.skills.network/v1/watson.runtime.nlp.v1/NlpService/SentimentPredict'
    # Dictionary of the text to be analysed
    myobj = {"raw_document": {"text": text_to_analyse}}
    # Headers required for the API request
    header = {"grpc-metadata-mm-model-id":"sentiment_aggregated-bert-workflow_lang_multi_stock"}
    # POST Request to the API with the text and headers
    response = requests.post(url, json=myobj, headers=header)
    # For status code 200 extract the label and score from the response
    if response.status_code == 200:
        formatted_response = json.loads(response.text)
        dict = formatted_response['documentSentiment']
        label = dict['label']
        score = dict['score']
    # For status code 500 set the label and score to None
    elif response.status_code == 500:
        label = None
        score = None
    # For any other unexpected errors
    else:
        label = None
        score = None
    return {'label': label,
            'score': score}
