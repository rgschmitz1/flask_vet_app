"""
Created on Tue May 17 20:02:19 2022

@author: Danielle Lambion, Rick Morrow

Back-end functionality and queries for appointment information
"""

from flask import (
    Blueprint,
    render_template,
    request
)
#from forms import InsertAppointment
from postgres import postgres

appointment = Blueprint('appointment', __name__)

@appointment.route('/appointment', methods=["GET", "POST"])
def appointment_info():
    pg = postgres()
    vets = pg.execute_read_query("SELECT * FROM veterinarian_office.vet")
    curr_vet = request.form.get('vet')
    if curr_vet is None:
        curr_vet = str(vets[0][0])
    appointments = pg.execute_read_query(f"""SELECT * FROM veterinarian_office.appointment
                                         NATURAL JOIN veterinarian_office.animal
                                         WHERE vet_id={curr_vet} ORDER BY pet_name, appointment_date DESC""")

    # Check for current vet name in vets
    for vet in vets:
        if (str(vet['vet_id']) == str(curr_vet)):
            curr_vet = vet['vet_name']
            break

    return render_template('appointment.html', vets=vets, appointments=appointments,
                           curr_vet=curr_vet)
