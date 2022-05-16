from flask import (
    Blueprint,
    redirect,
    render_template,
    request
)

home = Blueprint('home', __name__)

@home.route('/', methods=["GET", "POST"])
def home_page():
    return render_template('home.html')
