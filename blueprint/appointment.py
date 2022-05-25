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
    appointments = pg.execute_read_query("SELECT * FROM veterinarian_office.appointment "+
                                         "INNER JOIN veterinarian_office.animal "+
                                         "ON veterinarian_office.appointment.pet_id = veterinarian_office.animal.pet_id "+
                                         "WHERE vet_id="+curr_vet+" ORDER BY pet_name, appointment_date DESC")
    vet_name = pg.execute_read_query("SELECT vet_name FROM veterinarian_office.vet "+
                                     "WHERE vet_id='"+curr_vet+"'")
    return render_template('appointment.html', vets=vets, appointments=appointments,
                           curr_vet=vet_name[0][0])
