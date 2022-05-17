from flask import (
    Blueprint,
    redirect,
    render_template,
    request
)
from forms import InsertPatient
from postgres import postgres

patient = Blueprint('patient', __name__)

@patient.route('/patient', methods=["GET", "POST"])
def patient_info():
    form = InsertPatient()
    pg = postgres()
    animals = pg.execute_read_query("SELECT * FROM veterinarian_office.animal")
    if request.method != "GET":
        if form.validate_on_submit():
            print('here', flush=True)
    return render_template(
        'patient.html',
        form=form,
        animals=animals
    )
