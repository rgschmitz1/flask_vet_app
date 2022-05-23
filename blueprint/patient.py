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
@patient.route('/patient/<pet_id>', methods=["GET", "POST"])
def patient_info(pet_id=None):
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
    if pet_id:
        allergies = pg.execute_read_query(f"SELECT allergy FROM veterinarian_office.allergy WHERE pet_id = '{pet_id}'")
        conditions = pg.execute_read_query(f"SELECT medical_condition, is_active FROM veterinarian_office.condition WHERE pet_id = '{pet_id}'")
        prescriptions = pg.execute_read_query(f"SELECT prescription, appointment_date FROM veterinarian_office.prescription WHERE pet_id = '{pet_id}'")
        appointments = pg.execute_read_query(f"SELECT appointment_date, vet_id, weight, notes FROM veterinarian_office.appointment WHERE pet_id = '{pet_id}'")
        return render_template(
            'patient_id.html',
            allergies=allergies,
            appointments=appointments,
            conditions=conditions,
            prescriptions=prescriptions,
        )
    else:
        animals = pg.execute_read_query("SELECT * FROM veterinarian_office.animal ORDER BY pet_id")
        return render_template(
            'patient.html',
            form=form,
            animals=animals
        )
