#!/usr/bin/env python3
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
from blueprint.home import home
from blueprint.patient import patient
from blueprint.appointment import appointment
from blueprint.aggregate import aggregate

app = Flask(__name__)
app.config.from_object('config.Config')
# Blueprints
app.register_blueprint(home)
app.register_blueprint(patient)
app.register_blueprint(appointment)
app.register_blueprint(aggregate)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
