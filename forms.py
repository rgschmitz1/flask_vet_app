"""
Populate applicaiton forms

@author: Bob Schmitz
"""

from datetime import date
from flask_wtf import FlaskForm
from wtforms import (
    DateField,
    IntegerField,
    StringField,
    SubmitField,
    ValidationError,
)
from wtforms.validators import (
    DataRequired,
    Length,
    Optional,
)

def date_in_future(form, field):
    if (field.data>date.today()):
        raise ValidationError('Date must not be in the future')


class InsertPatient(FlaskForm):
    """
    Form to insert a new patient into database
    """
    name = StringField(
        "Name",
        validators=[DataRequired(), Length(max=255)]
    )
    birthdate = DateField(
        "Birthdate",
        format='%Y-%m-%d',
        validators=[DataRequired(), date_in_future]
    )
    # species should maybe be a choicefield or a combo of user input and choice?
    species = StringField(
        "Species",
        validators=[DataRequired(), Length(max=255)]
    )
    sex = SelectField(
        "Sex",
        choices=['M', 'F'],
        validators=[DataRequired()]
    )
    breed = StringField(
        "Breed",
        validators=[DataRequired(), Length(max=255)]
    )
    color = StringField(
        "Color",
        validators=[DataRequired(), Length(max=255)]
    )
    submit = SubmitField("Save")
