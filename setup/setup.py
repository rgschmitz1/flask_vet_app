# !usr/bin/python

from faker import Faker

# This script will generate a SQL file to set up tables for the
# Veterinarian database with sample data.

"""--------- Config/Settings ----------"""

# Set the number of records per table
# NOTE: for each vet, the script will generate two animals; for each
# animal script will generate two allergies, medical conditions and
# appointments; and for each appointment it will generate a prescription.
VET_COUNT = 10

# Create the Schema
SCHEMA = "CREATE SCHEMA veterinarian_office;\n\n"

# Define the animal/patient table

ANIMAL = (
    "CREATE TABLE veterinarian_office.animal(\n"
    "    pet_id SERIAL NOT NULL UNIQUE,\n"
    "    pet_name VARCHAR ( 255 ) NOT NULL,\n"
    "    pet_birthdate DATE NOT NULL,\n"
    "    pet_sex CHAR ( 1 ) NOT NULL,\n"
    "    species VARCHAR ( 255 ) NOT NULL,\n"
    "    breed VARCHAR ( 255 ) NOT NULL,\n"
    "    color VARCHAR ( 255 ) NOT NULL,\n"
    "    PRIMARY KEY ( pet_id )\n"
    ");\n\n"
)

# Define the veterinarian table

VET  = (
    "CREATE TABLE veterinarian_office.vet(\n"
    "    vet_id SERIAL NOT NULL UNIQUE,\n"
    "    vet_name VARCHAR ( 255 ) NOT NULL,\n"
    "    PRIMARY KEY ( vet_id )\n"
    ");\n\n"
)

# Define the appointment table

APPOINTMENT = (
    "CREATE TABLE veterinarian_office.appointment(\n"
    "    pet_id INT NOT NULL,\n"
    "    appointment_date DATE NOT NULL,\n"
    "    vet_id INT NOT NULL,\n"
    "    weight INT,\n"
    "    notes TEXT,\n"
    "    PRIMARY KEY ( pet_id, appointment_date ),\n"
    "    CONSTRAINT fk_pet_id_animal\n"
    "        FOREIGN KEY ( pet_id )\n"
    "            REFERENCES veterinarian_office.animal ( pet_id )\n"
    "            ON DELETE CASCADE,\n"
    "    CONSTRAINT fk_vet_id_vet\n"
    "        FOREIGN KEY ( vet_id )\n"
    "            REFERENCES veterinarian_office.vet ( vet_id )\n"
    ");\n\n"
)

# Define the allergy table

ALLERGY = (
    "CREATE TABLE veterinarian_office.allergy(\n"
    "    pet_id INT NOT NULL,\n"
    "    allergy VARCHAR ( 255 ) NOT NULL,\n"
    "    PRIMARY KEY ( pet_id, allergy ),\n"
    "    CONSTRAINT fk_pet_id_animal\n"
    "        FOREIGN KEY ( pet_id )\n"
    "            REFERENCES veterinarian_office.animal ( pet_id )\n"
    "            ON DELETE CASCADE\n"
    ");\n\n"
)

# Define the condition table

CONDITION = (
    "CREATE TABLE veterinarian_office.condition(\n"
    "    pet_id INT NOT NULL,\n"
    "    medical_condition VARCHAR ( 255 ) NOT NULL,\n"
    "    is_active BOOLEAN NOT NULL,\n"
    "    PRIMARY KEY ( pet_id, medical_condition ),\n"
    "    CONSTRAINT fk_pet_id_animal\n"
    "        FOREIGN KEY ( pet_id )\n"
    "            REFERENCES veterinarian_office.animal ( pet_id )\n"
    "            ON DELETE CASCADE\n"
    ");\n\n"
)

PRESCRIPTION = (
    "CREATE TABLE veterinarian_office.prescription(\n"
    "    pet_id INT NOT NULL,\n"
    "    appointment_date DATE NOT NULL,\n"
    "    prescription VARCHAR ( 255 ) NOT NULL,\n"
    "    PRIMARY KEY ( pet_id, appointment_date, prescription ),\n"
    "    CONSTRAINT fk_pet_id_animal_appointment_date\n"
    "        FOREIGN KEY ( pet_id, appointment_date )\n"
    "            REFERENCES veterinarian_office.appointment ( pet_id, appointment_date )\n"
    "            ON DELETE CASCADE\n"
    ");\n\n"
)

SETUP = (
        SCHEMA +
        ANIMAL +
        VET +
        APPOINTMENT +
        ALLERGY +
        CONDITION +
        PRESCRIPTION
)

"""--------- Helper Functions --------"""


def get_dog_breed():
    """Returns a random dog breed."""
    breed = fake.random_choices(
        elements=(
            "Poodle",
            "Great Dane",
            "German Shepard",
            "Old English Sheepdog",
            "Pit Bull",
            "Boston Terrier",
            "Komondor",
            "Basset Hound",
            "Irish Setter",
            "Labrador Retriever",
            "Golden Retriever",
            "Boxer",
            "Cocker Spaniel",
            "Chow Chow",
            "Akita",
            "Siberian Husky",
            "Portuguese Water Dog",
            "Greyhound",
            "Irish Wolfhound"
        ),
        length=1,
    )[0]
    return breed


def get_dog_color():
    """Returns a random dog color."""
    color = fake.random_choices(
        elements=(
            "Black",
            "White",
            "Merle",
            "Brown",
            "Black & White",
        ),
        length=1
    )[0]
    return color


def get_cat_breed():
    """Returns a random cat breed."""
    breed = fake.random_choices(
        elements=(
            "Abyssinian",
            "Maine Coon",
            "American Bobtail",
            "Siamese",
            "Burmese",
            "Sphinx",
            "Manx",
            "British Longhair",
            "Persian",
            "Savannah",
            "American Shorthair",
            "California Spangled",
            "Arabian Mau"
        ),
        length=1,
    )[0]
    return breed


def get_cat_color():
    """Returns a random cat color."""
    color = fake.random_choices(
        elements=(
            "Black",
            "White",
            "Merle",
            "Brown",
            "Black & White",
            "Calico"
        ),
        length=1
    )[0]
    return color


def get_allergy(existing_allergy=None):
    """
    Returns a random allergy that is different from the existing_allergy
    parameter if it is provided.
    """
    allergy = fake.random_choices(
        elements=(
            "chicken egg",
            "sage",
            "hazelnut",
            "mold",
            "wheat",
            "dust mite",
            "wool",
            "pollen",
            "dandelion"
        ),
        length=1
    )[0]

    while allergy == existing_allergy:
        allergy = get_allergy(existing_allergy)

    return allergy


def get_condition(existing_condition=None):
    """
    Returns a random condition that is different from the existing_condition
    parameter if it is provided.
    """
    condition = fake.random_choices(
        elements=(
            "liver cancer",
            "bone cancer",
            "leukemia",
            "lymphoma",
            "injury",
            "arthritis",
            "diabetes",
            "epilepsy",
            "hyperthyroidism",
            "leptospirosis",
            "distemper",
            "worms",
            "salmonella",
            "eye infection",
            "ear infection"
        ),
        length=1
    )[0]

    while condition == existing_condition:
        condition = get_condition(existing_condition)

    return condition


def get_prescription(existing_prescription=None):
    """
    Returns a random prescription that is different from the
    existing_prescription parameter if it is provided.
    """
    prescription = fake.random_choices(
        elements=(
            "antibiotics",
            "anti-inflammatory",
            "pain reliever",
            "flea prevention",
            "dewormer",
            "steroids",
            "antifungal",
            "antihistamines",
        ),
        length=1
    )[0]

    while prescription == existing_prescription:
        prescription = get_prescription(existing_prescription)

    return prescription


def insert_animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
):
    """Generates raw SQL commands to insert an animal record."""
    insert_animal_sql = (
        "INSERT INTO veterinarian_office.animal(\n"
        "    pet_id,\n"
        "    pet_name,\n"
        "    pet_birthdate,\n"
        "    pet_sex,\n"
        "    species,\n"
        "    breed,\n"
        "    color\n"
        ")\n"
        "VALUES(\n"
        f"    {pet_id},\n"
        f"    '{pet_name}',\n"
        f"    '{pet_birthdate}',\n"
        f"    '{pet_sex}',\n"
        f"    '{species}',\n"
        f"    '{breed}',\n"
        f"    '{color}'\n"
        ");\n\n"
    )
    return insert_animal_sql


def insert_appointment(pet_id, appointment_date, vet_id, weight, notes):
    """Generates raw SQL commands to insert an appointment record."""
    insert_appointment_sql = (
        "INSERT INTO veterinarian_office.appointment(\n"
        "    pet_id,\n"
        "    appointment_date,\n"
        "    vet_id,\n"
        "    weight,\n"
        "    notes\n"
        ")\n"
        "VALUES(\n"
        f"    {pet_id},\n"
        f"    '{appointment_date}',\n"
        f"    {vet_id},\n"
        f"    {weight},\n"
        f"    '{notes}'\n"
        ");\n\n"
    )
    return insert_appointment_sql


def insert_allergy(pet_id, allergy):
    """Generates raw SQL commands to insert an allergy record."""
    insert_allergy_sql = (
        "INSERT INTO veterinarian_office.allergy(\n"
        "    pet_id,\n"
        "    allergy\n"
        ")\n"
        "VALUES(\n"
        f"    {pet_id},\n"
        f"    '{allergy}'\n"
        ");\n\n"
    )
    return insert_allergy_sql


def insert_condition(pet_id, condition):
    """Generates raw SQL commands to insert a condition record."""
    insert_condition_sql = (
        "INSERT INTO veterinarian_office.condition(\n"
        "    pet_id,\n"
        "    medical_condition,\n"
        "    is_active\n"
        ")\n"
        "VALUES(\n"
        f"    {pet_id},\n"
        f"    '{condition}',\n"
        "    'y'\n"
        ");\n\n"
    )
    return insert_condition_sql


def insert_prescription(pet_id, appointment_date, prescription):
    """Generates raw SQL commands to insert a prescription record."""
    insert_prescription_sql = (
        "INSERT INTO veterinarian_office.prescription(\n"
        "    pet_id,\n"
        "    appointment_date,\n"
        "    prescription\n"
        ")\n"
        "VALUES(\n"
        f"    {pet_id},\n"
        f"    '{appointment_date}',\n"
        f"    '{prescription}'\n"
        ");\n\n"
    )
    return insert_prescription_sql


def generate_appointment(pet_id, vet_id, pet_birthdate, prev_weight=None):
    """
    Generates an appointment with random data and returns SQL and the
    weight for the appointment.
    """
    appointment_date = fake.date_between_dates(
        date_start=pet_birthdate
    )
    if prev_weight:
        weight = fake.random_int(min=prev_weight - 5, max=prev_weight + 5)
    else:
        weight = fake.random_int(min=5, max=120)
    notes = fake.paragraph(nb_sentences=10)
    appointment_sql = insert_appointment(
        pet_id,
        appointment_date,
        vet_id,
        weight,
        notes
    )
    return appointment_sql, weight, appointment_date


def generate_pet(vet_id, species, max_age):
    """
    Creates a pet with random data and returns a chunk of SQL commands
    that add the pet and associated records to the database.
    """

    # Generate a pet
    pet_id = fake.random_number(digits=5)
    pet_name = fake.first_name()
    pet_birthdate = fake.date_of_birth(maximum_age=max_age)
    pet_sex = fake.random_choices(elements=("F", "M"), length=1)[0]
    pet_species = species
    if species == "Dog":
        pet_breed = get_dog_breed()
        pet_color = get_dog_color()
    elif species == "Cat":
        pet_breed = get_cat_breed()
        pet_color = get_cat_color()
    pet_record = insert_animal(
        pet_id,
        pet_name,
        pet_birthdate,
        pet_sex,
        pet_species,
        pet_breed,
        pet_color
    )
    pet_data_sql = pet_record

    # Generate appointment data
    first_appointment, weight, first_appointment_date = generate_appointment(
        pet_id,
        vet_id,
        pet_birthdate
    )
    pet_data_sql += first_appointment


    second_appointment, _, second_appointment_date= generate_appointment(
        pet_id,
        vet_id,
        pet_birthdate,
        weight
    )
    pet_data_sql += second_appointment

    # Generate allergy data
    first_allergy = get_allergy()
    pet_data_sql += insert_allergy(pet_id, first_allergy)

    second_allergy = get_allergy(first_allergy)
    pet_data_sql += insert_allergy(pet_id, second_allergy)

    # Generate condition data
    first_condition = get_condition()
    pet_data_sql += insert_condition(pet_id, first_condition)

    second_condition = get_condition(first_condition)
    pet_data_sql += insert_condition(pet_id, second_condition)

    # Generate prescription data
    first_prescription = get_prescription()
    pet_data_sql += insert_prescription(
        pet_id,
        first_appointment_date,
        first_prescription
    )

    second_prescription = get_prescription(first_prescription)
    pet_data_sql += insert_prescription(
        pet_id,
        second_appointment_date,
        second_prescription
    )

    return pet_data_sql


"""--------- Create Records ----------"""

fake = Faker()
sql_code = SETUP

# Create the data
for index in range(1, VET_COUNT + 1):
    # Add Vet
    vet_id = fake.random_number(digits=5)
    vet_name = fake.name()
    vet_record = (
        "INSERT INTO veterinarian_office.vet( vet_id, vet_name )\n"
        f"VALUES( {vet_id}, '{vet_name}' );\n\n"
    )
    sql_code += vet_record
    # Add data for first pet
    sql_code += generate_pet(vet_id, "Dog", 15)
    # Add data for second pet
    sql_code += generate_pet(vet_id, "Cat", 22)


with open("setup.sql", "w") as file:
    file.write(sql_code)
