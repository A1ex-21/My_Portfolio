"""
This is the Flask Web App Server for Emotion Detection.

This web app uses the emotion detector function which is \
built from the IBM Watson NLP Emotion Predict function via \
a HTTP GET Request.

This is executed over the Flask channel and delpoyed on localhost \
at port 5000.
"""

from flask import Flask, render_template, request
from EmotionDetection.emotion_detection import emotion_detector

app = Flask("Emotion Detector")

@app.route('/')
def render_index_page():
    """
    This method is for rendering the main application page over the \
    Flask channel.
    """
    return render_template('index.html')

@app.route('/emotionDetector')
def emotion_detection():
    """
    This method recieves the input text from the HTML interface and \
    performs emotion detection on it via the emotion_detector function.

    Returns
    -------
    A formatted string with the emotions and their score as well as the \
    dominant emotion.

    If blank space is inputed, the method will return an error message \
    stating the invalidity of the input.
    """
    text_to_analyze = request.args.get("textToAnalyze")
    response = emotion_detector(text_to_analyze)
    if response['dominant_emotion'] is None:
        return "Invalid text! Please try again!"
    filtered_resp = {key: value for key, value in response.items() if key != "dominant_emotion"}
    text = ", ".join(f"'{key}': {value}" for key, value in filtered_resp.items())
    return f"For the given statement, the system respsone is {text}. \
    The dominant emotion is {response['dominant_emotion']}"

if __name__ == "__main__":
    app.run(port=5000)
