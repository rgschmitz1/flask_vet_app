from flask import (
    Blueprint,
    redirect,
    render_template,
    request
)
#from forms import InsertAppointment

appointment = Blueprint('appointment', __name__)

@appointment.route('/appointment', methods=["GET", "POST"])
def appointment_info():
#    form = InsertAppointment()
    if request.method != "GET":
        if form.validate_on_submit():
            print('here', flush=True)
    return render_template(
        'appointment.html',
#        form=form
    )
