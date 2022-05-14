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


class InsertPet(FlaskForm):
    name = StringField(
        "Name",
        validators=[DataRequired()]
    )
    birthdate = DateField(
        "Birthdate",
        format='%Y-%m-%d',
        validators=[DataRequired()]
    )
    # species should maybe be a choicefield or a combo of user input and choice?
    species = StringField(
        "Species",
        validators=[DataRequired()]
    )
    sex = SelectField(
        "Sex",
        choices=['M', 'F'],
        validators=[DataRequired()]
    )
    breed = StringField(
        "Breed",
        validators=[DataRequired()]
    )
    color = StringField(
        "Color",
        validators=[DataRequired()]
    )
    submit = SubmitField("Save")
