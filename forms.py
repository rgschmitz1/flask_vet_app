from flask_wtf import FlaskForm
from wtforms import (
    BooleanField,
    FileField,
    FieldList,
    IntegerField,
    PasswordField,
    SelectField,
    StringField,
    SubmitField,
    ValidationError,
)
from wtforms.validators import (
    DataRequired,
    EqualTo,
    Length,
    Optional,
)


class LaunchInstanceForm(FlaskForm):
    """Instance launcher form."""
    instances = FieldList(
        SelectField(validators=[Optional()]),
        min_entries=len(CHOICES["WORKFLOW"]),
        max_entries=len(CHOICES["WORKFLOW"])
    )
    myinstance = StringField(
        "Instance Type",
        validators=[DataRequired()]
    )
    custom_instance = StringField(
        "Custom Instance",
        validators=[Optional()]
    )
    timeout = IntegerField(
        "Timeout",
        default="1",
        validators=[DataRequired(message="Please enter an integer")]
    )
    units = SelectField(
        "Units",
        choices=CHOICES["UNITS"],
        default="hours",
        validators=[DataRequired()]
    )
    workflow = SelectField(
        "Workflow",
        choices=CHOICES["WORKFLOW"],
        validators=[DataRequired()]
    )
    submit = SubmitField("Launch Instance")
