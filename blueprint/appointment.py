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
    if curr_vet is None or curr_vet == '0':
        appointments = pg.execute_read_query(f"""SELECT * FROM veterinarian_office.appointment
                                             NATURAL JOIN veterinarian_office.animal
                                             ORDER BY pet_name, appointment_date DESC""")
        curr_vet=0
        vet_name = 'All'
    else:
        appointments = pg.execute_read_query(f"""SELECT * FROM veterinarian_office.appointment
                                             NATURAL JOIN veterinarian_office.animal
                                             WHERE vet_id={curr_vet}
                                             ORDER BY pet_name, appointment_date DESC""")
        vet_name = pg.execute_read_query(f"""SELECT vet_name
                                             FROM veterinarian_office.vet
                                             WHERE vet_id='{curr_vet}'""")[0][0]
    return render_template('appointment.html', vets=vets, appointments=appointments,
                           curr_vet=vet_name)
