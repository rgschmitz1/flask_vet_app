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
import forms

app = Flask(__name__)
app.config.from_object('config.Config')

@app.route("/")
def home():
    return render_template('home.html')

@app.route("/pet", methods=["GET", "POST"])
def pet():
    form = forms.InsertPet()
    if request.method != "GET":
        if form.validate_on_submit():
            print('here', flush=True)
    return render_template(
        'pet.html',
        form=form
    )

@app.route("/appointment")
def appointment():
    return render_template('appointment.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
