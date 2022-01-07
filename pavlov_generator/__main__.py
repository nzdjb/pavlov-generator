"""Generate pavlovian responses."""

import random
from flask import Flask

words = ['woof', 'bark', 'awoo', 'yip', '*drool*']

def create_app():
    """Setup the app"""
    app = Flask(__name__)

    @app.route('/')
    def generate():
        phrase = [words[random.randrange(len(words))] for _ in range(random.randrange(1, 10))]
        return f"{' '.join(phrase).capitalize()}."

    return app
