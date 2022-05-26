#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May 17 20:02:19 2022

@author: Danielle Lambion, Rick Morrow

Back-end functionality and queries for aggregate species information
"""

from flask import (
    Blueprint,
    render_template,
    request
)
#from forms import InsertAppointment
from postgres import postgres

aggregate = Blueprint('aggregate', __name__)

@aggregate.route('/aggregate', methods=["GET", "POST"])
def aggregate_info():
    """
        This route queries the database for aggregate data on patient
        medical conditions and allergies for a specific species of patient.
        It returns data with the column headings 'condition', 'type' and
        'case_count'. Condition is an allergy or medical condition, type
        specifies whether it is a medical condition or an allergy and
        case_count is the total number of patients for a species affected
        by that condition.

        The endpoint uses the POST method to retrieve form data for the
        species selected by the user and the GET method to return queried
        data.
    """
    pg = postgres()
    species = pg.execute_read_query("SELECT DISTINCT species FROM veterinarian_office.animal")
    species = [str(s[0]) for s in species]
    curr_species = request.form.get('species')
    if curr_species is None:
        curr_species = str(species[0])

    # The conditions variable contains the results of a union of two queries.
    # Each query returns the name and count of unique allergies and
    # medical conditions affecting a species. It renames the allery and
    # medical condition headers to be 'condition' and adds a new column
    # 'type' that indicates whether the condition is medical or an allergy.
    conditions = pg.execute_read_query(f"""SELECT DISTINCT medical_condition AS condition, 'medical' AS type, COUNT(medical_condition) AS case_count
                                           FROM veterinarian_office.condition
                                           NATURAL JOIN veterinarian_office.animal
                                           WHERE species='{curr_species}'
                                           GROUP BY medical_condition
                                           UNION
                                           SELECT DISTINCT allergy AS condition, 'allergy' AS type, COUNT(allergy) AS case_count
                                           FROM veterinarian_office.allergy
                                           NATURAL JOIN veterinarian_office.animal
                                           WHERE species='{curr_species}'
                                           GROUP BY allergy
                                           ORDER BY case_count DESC""")

    # Returns data to the template. It stores a default species, a
    # selected species (curr_species) used in the queries and the conditions
    # table that is returned to the view.
    return render_template('aggregate.html', species=species,
                           curr_species=curr_species, conditions=conditions)
