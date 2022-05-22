#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May 17 20:02:19 2022

@author: Danielle Lambion

Back-end functionality and queries for aggregate species information
"""
from flask import (
    Blueprint,
    redirect,
    render_template,
    request
)
#from forms import InsertAppointment
from postgres import postgres

aggregate = Blueprint('aggregate', __name__)

@aggregate.route('/aggregate', methods=["GET", "POST"])
def aggregate_info():
    pg = postgres()
    species = pg.execute_read_query("SELECT DISTINCT species FROM veterinarian_office.animal")
    species = [str(s).replace("['", "").replace("']", "") for s in species]
    curr_species = request.form.get('species')
    if curr_species is None:
        curr_species = str(species[0])

    # medical_conditions = pg.execute_read_query("SELECT DISTINCT medical_condition, 'Medical Condition' as type, COUNT (medical_condition) FROM veterinarian_office.condition "+
    #                                      "INNER JOIN veterinarian_office.animal "+
    #                                      "ON veterinarian_office.condition.pet_id = veterinarian_office.animal.pet_id "+
    #                                      "WHERE species='"+curr_species+"'" +
    #                                      "GROUP BY medical_condition " +
    #                                      "ORDER BY COUNT DESC")
    #
    # allergies = pg.execute_read_query("SELECT DISTINCT allergy, count (allergy) FROM veterinarian_office.allergy "+
    #                                      "INNER JOIN veterinarian_office.animal "+
    #                                      "ON veterinarian_office.allergy.pet_id = veterinarian_office.animal.pet_id "+
    #                                      "WHERE species='"+curr_species+"'"
    #                                      "GROUP BY allergy " +
    #                                      "ORDER BY COUNT DESC")

    conditions = pg.execute_read_query("SELECT DISTINCT medical_condition, 'medical' as type, COUNT (medical_condition) FROM veterinarian_office.condition "+
                                         "INNER JOIN veterinarian_office.animal "+
                                         "ON veterinarian_office.condition.pet_id = veterinarian_office.animal.pet_id "+
                                         "WHERE species='"+curr_species+"'" +
                                         "GROUP BY medical_condition "  # +
                                         # "ORDER BY COUNT DESC " +
                                         "UNION " +
                                         "SELECT DISTINCT allergy, 'allergy' as type, count(allergy) FROM veterinarian_office.allergy "+
                                            "INNER JOIN veterinarian_office.animal " +
                                            "ON veterinarian_office.allergy.pet_id = veterinarian_office.animal.pet_id " +
                                            "WHERE species='" + curr_species + "'"
                                            "GROUP BY allergy " +
                                            "ORDER BY COUNT DESC")
    print("CONDITIONS", conditions)
    # print("ALLERGIES", allergies)

    # medical_info = pg.execute_read_query("WITH PetAllergies AS("+
    #                                "SELECT allergy, A.pet_id FROM
    #                                veterinarian_office.allergy,
    #                                veterinarian_office.animal A "+
    #                                "WHERE A.pet_id =
    #                                veterinarian_office.allergy.pet_id "+
    #                                "AND A.species='"+curr_species+"') "+
    #                                "SELECT DISTINCT * FROM PetAllergies "+
    #                                "INNER JOIN veterinarian_office.condition C "+
    #                                "ON C.pet_id = PetAllergies.pet_id ")



    # allergies = [str(s).replace("['", "").replace("']", "") for s in allergies]
    # conditions = [str(s).replace("['", "").replace("']", "") for s in conditions]


    return render_template('aggregate.html', species=species,
                           curr_species=curr_species, conditions=conditions)
