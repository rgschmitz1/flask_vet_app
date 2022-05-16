from flask import (
    Blueprint,
    redirect,
    render_template,
    request
)
from forms import InsertPatient

patient = Blueprint('patient', __name__)

@patient.route('/patient', methods=["GET", "POST"])
def patient_info():
    form = InsertPatient()
    if request.method != "GET":
        if form.validate_on_submit():
            print('here', flush=True)
    return render_template(
        'patient.html',
        form=form
    )
