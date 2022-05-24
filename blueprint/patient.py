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
    """ This function adds new patients along with displaying all patients records

    input id: optional numeric patient id to display detailed paitient records
    """
    form = InsertPatient()
    pg = postgres()
    # If a POST request is made and pet_id is None, then add a new paitient
    if request.method == "POST" and pet_id == None:
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
    # Detailed paitient records view
    if pet_id:
        animals = pg.execute_read_query(f"SELECT * FROM veterinarian_office.animal WHERE pet_id = '{pet_id}'")
        allergies = pg.execute_read_query(f"SELECT allergy FROM veterinarian_office.allergy WHERE pet_id = '{pet_id}'")
        conditions = pg.execute_read_query(f"SELECT medical_condition, is_active FROM veterinarian_office.condition WHERE pet_id = '{pet_id}'")
        prescriptions = pg.execute_read_query(f"""SELECT p.prescription AS prescription, p.appointment_date appointment_date, v.vet_name AS vet_name
            FROM veterinarian_office.prescription p, veterinarian_office.vet v, veterinarian_office.appointment a
            WHERE p.pet_id = '{pet_id}' AND p.appointment_date = a.appointment_date AND a.vet_id = v.vet_id""")
        appointments = pg.execute_read_query(f"""SELECT a.appointment_date AS appointment_date, v.vet_name AS vet_name, a.weight AS weight, a.notes AS notes
            FROM veterinarian_office.appointment a, veterinarian_office.vet v
            WHERE a.pet_id = '{pet_id}' AND a.vet_id = v.vet_id""")
        return render_template(
            'patient_id.html',
            animals=animals,
            allergies=allergies,
            appointments=appointments,
            conditions=conditions,
            prescriptions=prescriptions,
        )
    # All paitient records
    else:
        animals = pg.execute_read_query("SELECT * FROM veterinarian_office.animal ORDER BY pet_id")
        return render_template(
            'patient.html',
            form=form,
            animals=animals
        )
