#!/usr/bin/env python
from flask import (
    Flask,
    abort,
    flash,
    redirect,
    render_template,
    request,
    session,
)

app = Flask(__name__)
app.config.from_object('config.Config')

@app.route("/")
def home():
    return "Hello World!"

@app.route("/pet")
def pet(name):
    return render_template(
        'pet.html'
    )

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
