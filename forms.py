from datetime import date
from flask_wtf import FlaskForm
from wtforms import (
    BooleanField,
    DateField,
    FieldList,
    IntegerField,
    SelectField,
    StringField,
    SubmitField,
    ValidationError,
)
#from wtforms.fields.html5 import DateField
from wtforms.validators import (
    DataRequired,
    EqualTo,
    Length,
    Optional,
)

def date_in_future(form, field):
    if (field.data>date.today()):
        raise ValidationError('Date must not be in the future')

class InsertPatient(FlaskForm):
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
    
