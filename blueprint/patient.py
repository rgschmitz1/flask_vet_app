from flask import (
    Blueprint,
    flash,
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
    if request.method != "GET":
        if form.validate_on_submit():
            query = f"""INSERT INTO veterinarian_office.animal(
                    pet_name, pet_birthdate, pet_sex, species, breed, color
                )VALUES(
                    '{form.name.data}', '{form.birthdate.data}', '{form.sex.data}',
                    '{form.species.data}', '{form.breed.data}', '{form.color.data}'
                )"""
            if pg.execute_query(query):
                flash('Successfully added patient to database.')
            else:
                flash('ERROR: Failed to add patient to database.')
        else:
            flash('ERROR: Issue in patient info, please check inputs')
    animals = pg.execute_read_query("SELECT * FROM veterinarian_office.animal ORDER BY pet_id")
    return render_template(
        'patient.html',
        form=form,
        animals=animals
    )
