CREATE SCHEMA veterinarian_office;

CREATE TABLE veterinarian_office.animal(
    pet_id SERIAL NOT NULL UNIQUE,
    pet_name VARCHAR ( 255 ) NOT NULL,
    pet_birthdate DATE NOT NULL,
    pet_sex CHAR ( 1 ) NOT NULL,
    species VARCHAR ( 255 ) NOT NULL,
    breed VARCHAR ( 255 ) NOT NULL,
    color VARCHAR ( 255 ) NOT NULL,
    PRIMARY KEY ( pet_id )
);

CREATE TABLE veterinarian_office.vet(
    vet_id SERIAL NOT NULL UNIQUE,
    vet_name VARCHAR ( 255 ) NOT NULL,
    PRIMARY KEY ( vet_id )
);

CREATE TABLE veterinarian_office.appointment(
    pet_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    vet_id INT NOT NULL,
    weight INT,
    notes TEXT,
    PRIMARY KEY ( pet_id, appointment_date ),
    CONSTRAINT fk_pet_id_animal
        FOREIGN KEY ( pet_id )
            REFERENCES veterinarian_office.animal ( pet_id )
            ON DELETE CASCADE,
    CONSTRAINT fk_vet_id_vet
        FOREIGN KEY ( vet_id )
            REFERENCES veterinarian_office.vet ( vet_id )
);

CREATE TABLE veterinarian_office.allergy(
    pet_id INT NOT NULL,
    allergy VARCHAR ( 255 ) NOT NULL,
    PRIMARY KEY ( pet_id, allergy ),
    CONSTRAINT fk_pet_id_animal
        FOREIGN KEY ( pet_id )
            REFERENCES veterinarian_office.animal ( pet_id )
            ON DELETE CASCADE
);

CREATE TABLE veterinarian_office.condition(
    pet_id INT NOT NULL,
    medical_condition VARCHAR ( 255 ) NOT NULL,
    is_active BOOLEAN NOT NULL,
    PRIMARY KEY ( pet_id, medical_condition ),
    CONSTRAINT fk_pet_id_animal
        FOREIGN KEY ( pet_id )
            REFERENCES veterinarian_office.animal ( pet_id )
            ON DELETE CASCADE
);

CREATE TABLE veterinarian_office.prescription(
    pet_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    prescription VARCHAR ( 255 ) NOT NULL,
    PRIMARY KEY ( pet_id, appointment_date, prescription ),
    CONSTRAINT fk_pet_id_animal_appointment_date
        FOREIGN KEY ( pet_id, appointment_date )
            REFERENCES veterinarian_office.appointment ( pet_id, appointment_date )
            ON DELETE CASCADE
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 34020, 'Kim Kim' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    26064,
    'Veronica',
    '2019-09-06',
    'M',
    'Dog',
    'Golden Retriever',
    'White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    26064,
    '2020-12-27',
    34020,
    22,
    'Song without yet. Character discuss world ask movie maintain responsibility. System program raise could structure say. Join memory long war. Another above personal despite worker meeting. Son cultural leave condition seek tax only. Power indeed receive expert throughout study where. Health all table. Thought sea fund card resource challenge same. Science pressure pretty minute democratic draw realize participant. Light always arm quite. Its media true sign five food challenge. Fight out stand class prove. We give spring size science off think.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    26064,
    '2020-08-06',
    34020,
    22,
    'At north weight able want ability. Thousand rule create large art. Only anything difference especially special respond maybe house. Admit effect miss character instead. Strong eye born tell ten pick. Figure arm practice TV sound green. Daughter finally mention. Oil foot theory also accept politics.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    26064,
    'pollen'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    26064,
    'wheat'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    26064,
    'ear infection',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    26064,
    'diabetes',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    26064,
    '2020-12-27',
    'steroids'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    26064,
    '2020-08-06',
    'antibiotics'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    35659,
    'Stephanie',
    '2000-01-25',
    'F',
    'Cat',
    'British Longhair',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    35659,
    '2005-11-07',
    34020,
    104,
    'Allow boy yet fire character yeah future company. Report kitchen lawyer reflect ten suffer. Event stuff sort protect rest her well message. Four power find ten blue far. Perhaps computer so entire wall tonight. Land then different. Total lawyer return send evidence edge. Stock political collection statement what likely old. South question serious college yourself letter time. Charge clearly party capital technology reason. Laugh property throughout tonight else. Discover beyond computer star news. Over simple edge together baby wonder.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    35659,
    '2021-12-25',
    34020,
    100,
    'Quickly fire stand product sing star. Or leader use season option do guess business. Into agreement rock lot truth break. Budget glass hand music difference impact. Participant heart court today build different job. Rather she produce.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    35659,
    'chicken egg'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    35659,
    'dust mite'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    35659,
    'distemper',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    35659,
    'salmonella',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    35659,
    '2005-11-07',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    35659,
    '2021-12-25',
    'antibiotics'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 60823, 'Robert Mendoza' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    23626,
    'Jacqueline',
    '2015-08-07',
    'F',
    'Dog',
    'Boxer',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    23626,
    '2018-03-01',
    60823,
    61,
    'The agent special. Bar win attention argue good wide. This I hope clear a even student. Summer official many prepare room too chance. Mother yard over size. Bag hundred nothing behind. Military research adult example personal miss open. Public similar type. Evening continue character large again join even check.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    23626,
    '2017-10-02',
    60823,
    57,
    'Smile with put back war speak war likely. Describe institution weight civil cup military entire. Board road population. Question arm rock turn positive. Face bed remember whatever consumer term. Single Republican surface we drop own. Why laugh also risk.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    23626,
    'pollen'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    23626,
    'mold'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    23626,
    'leukemia',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    23626,
    'distemper',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    23626,
    '2018-03-01',
    'antibiotics'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    23626,
    '2017-10-02',
    'flea prevention'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    4297,
    'Randall',
    '2020-12-13',
    'F',
    'Cat',
    'Persian',
    'White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    4297,
    '2022-01-23',
    60823,
    112,
    'Key cover beautiful often make bit lawyer high. Himself include near develop seven experience dinner best. Man safe act night authority call time. Door similar notice miss national another. Specific court enter rule safe our. Take likely can present. Nice trip memory tell the. Home parent person others. Spend behind wind year yes learn air week.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    4297,
    '2021-12-27',
    60823,
    107,
    'Push stuff just. Hold area particularly oil security good. Red car worry. Else a guy down raise phone represent former. Beat statement public suddenly. Image government contain current cause son.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    4297,
    'pollen'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    4297,
    'chicken egg'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    4297,
    'epilepsy',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    4297,
    'bone cancer',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    4297,
    '2022-01-23',
    'flea prevention'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    4297,
    '2021-12-27',
    'antihistamines'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 50402, 'Amanda Whitaker' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    48282,
    'Katie',
    '2022-04-26',
    'F',
    'Dog',
    'Komondor',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    48282,
    '2022-04-27',
    50402,
    59,
    'Dog standard concern girl artist away. Your phone protect member fill near still. Security respond himself blue. Brother about analysis science break section decision. Rise perhaps possible article teacher nice than large. Experience hope card. Tonight five now everyone. True region father out second. Price performance attorney truth central start eat remain. Oil yet reveal know skin skin.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    48282,
    '2022-04-30',
    50402,
    58,
    'Movie sell provide big act attorney. Cost never wrong later against age stuff. Charge cup loss. But Mrs sport food yourself often loss. Behind we work. One get model could hope these. Direction like check. Image certain truth. Toward improve tonight field just doctor. Seven hour respond capital produce behavior. Cultural generation commercial deal require. How American center sister.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    48282,
    'chicken egg'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    48282,
    'wheat'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    48282,
    'ear infection',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    48282,
    'worms',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    48282,
    '2022-04-27',
    'antibiotics'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    48282,
    '2022-04-30',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    48061,
    'Tammy',
    '2010-10-13',
    'M',
    'Cat',
    'Maine Coon',
    'Black'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    48061,
    '2015-10-01',
    50402,
    21,
    'Activity truth truth during rise evidence out. Raise assume seat already party. Expect movement word including player beyond. There thing parent on safe art career fine. Ever it possible seven clearly method. Social focus peace check discuss indeed discover. Apply environmental may. Born probably Democrat table exist apply. Bar wall foreign. Amount garden design. Pay room through somebody lay test. Every here miss head spend his. Address challenge difficult.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    48061,
    '2022-05-11',
    50402,
    24,
    'Firm herself sure tell lay stuff. Significant friend hotel. So those parent really how top cut. Manage find the skill population. Yes thought choose day. Stand remain nor discuss Mr into. Democratic professor magazine through ahead sea. Store remember budget court. Poor so short fine man reduce.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    48061,
    'wool'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    48061,
    'chicken egg'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    48061,
    'leukemia',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    48061,
    'bone cancer',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    48061,
    '2015-10-01',
    'antifungal'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    48061,
    '2022-05-11',
    'dewormer'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 98841, 'Debra Frey' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    86474,
    'Melissa',
    '2019-10-11',
    'F',
    'Dog',
    'Cocker Spaniel',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    86474,
    '2021-02-08',
    98841,
    37,
    'Yes hotel computer return range country. Poor say require. Yet analysis walk charge by institution business. Central hit heavy analysis charge floor. Nor kid him deep newspaper. Piece its could individual generation under. Heart office up material especially thing president. Difference law material particularly prove role analysis. Baby wrong hot approach wear health. Smile certainly yourself maintain though range.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    86474,
    '2020-04-21',
    98841,
    41,
    'Off on right trip agree politics. Team travel clear candidate. Here kid exist once instead. Medical worker rule open. Analysis long story. Race night less cost. Act make deal bed. Since table go state. Can follow policy entire.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    86474,
    'wheat'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    86474,
    'dust mite'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    86474,
    'hyperthyroidism',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    86474,
    'ear infection',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    86474,
    '2021-02-08',
    'antifungal'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    86474,
    '2020-04-21',
    'antihistamines'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    66342,
    'Derrick',
    '2013-02-16',
    'M',
    'Cat',
    'Abyssinian',
    'Brown'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    66342,
    '2017-01-07',
    98841,
    101,
    'Budget support authority day about. Add worker nearly include. Light rock third team right cell wish. Talk ready view. Turn big apply market pattern of. Present unit consider ok. Such should particularly special data. House visit carry. Seven although represent current few. Happy kitchen sound push.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    66342,
    '2018-08-29',
    98841,
    96,
    'Both house end. Hope wall usually song change. Bag ok people prevent generation. Story including society stand. Course matter you painting avoid building day direction. Social require attention easy main. Than employee shoulder level top daughter why. Great include group feel ground myself way. West what will behind process. Admit development stand fill human.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    66342,
    'sage'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    66342,
    'dandelion'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    66342,
    'arthritis',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    66342,
    'leukemia',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    66342,
    '2017-01-07',
    'antibiotics'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    66342,
    '2018-08-29',
    'antihistamines'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 68279, 'David Davis MD' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    89168,
    'Chelsea',
    '2008-03-07',
    'F',
    'Dog',
    'Old English Sheepdog',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    89168,
    '2013-10-08',
    68279,
    48,
    'Wind research piece read history. A range future buy institution. Treat guy mind performance. A point suddenly specific beautiful though. Point difficult base nation hear adult. Candidate door couple join success. Lay green car purpose score and voice. Work win institution ready remain member employee statement. Our knowledge up citizen.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    89168,
    '2013-11-11',
    68279,
    52,
    'Many heavy prevent she. Mouth total left how cut. Little position money past point case. Face involve case employee single leave property old. Then top compare strategy career medical. Happen medical prevent reduce child daughter far. Black body stop us. Most name price. Possible style stuff on couple lot. Explain hot quite several. Type than thus evidence second market large door.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    89168,
    'dust mite'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    89168,
    'dandelion'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    89168,
    'leukemia',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    89168,
    'eye infection',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    89168,
    '2013-10-08',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    89168,
    '2013-11-11',
    'pain reliever'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    11301,
    'Richard',
    '2014-08-01',
    'F',
    'Cat',
    'Savannah',
    'White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    11301,
    '2017-11-22',
    68279,
    116,
    'New stay us car add pull particular region. Race baby shoulder play leg. Face ability sport feeling. Environment talk happen life mission capital other. Put audience offer design. Her stand million quality. Single letter control let window direction. Person side check teach true. Try example scientist wife police. Should mean authority protect election ask may talk. Small structure off consumer put agency relationship either. Simply approach place mother. Situation knowledge five star.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    11301,
    '2016-01-18',
    68279,
    111,
    'Last sense form unit enjoy. You or off accept future. Score alone out history a raise how detail. Individual center century close company. Single economy likely product name here. Friend professional last explain industry. Upon here television lose son. Allow head around. Expect detail use he coach skill she. Affect fall continue six road anyone. Husband leave recently song few position anything. Better adult network firm the bring also no. Foot business red.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    11301,
    'sage'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    11301,
    'wool'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    11301,
    'epilepsy',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    11301,
    'arthritis',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    11301,
    '2017-11-22',
    'antibiotics'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    11301,
    '2016-01-18',
    'antifungal'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 19236, 'Virginia Hansen' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    89181,
    'Anna',
    '2010-07-27',
    'F',
    'Dog',
    'Basset Hound',
    'Black'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    89181,
    '2020-11-27',
    19236,
    79,
    'Inside white available guess. Similar sure man heavy white. Beautiful site loss exist sure compare. Game approach program probably partner owner whether particular. Wonder billion nice. Product their thousand road. Physical pick new blue present seem blood. Woman get sea card and responsibility. Section good mission. Where author police product marriage rich raise. Specific against loss.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    89181,
    '2016-12-24',
    19236,
    75,
    'Sound everything full later dog claim. Them interesting talk Republican. International product space there yes simply heavy. Mother animal help important business. Third individual class example dog there. Mind avoid season exactly career. Country assume detail lawyer sign officer writer. Senior parent state various poor particularly.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    89181,
    'wool'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    89181,
    'pollen'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    89181,
    'ear infection',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    89181,
    'hyperthyroidism',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    89181,
    '2020-11-27',
    'pain reliever'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    89181,
    '2016-12-24',
    'dewormer'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    4864,
    'Kimberly',
    '2011-12-13',
    'F',
    'Cat',
    'American Bobtail',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    4864,
    '2018-04-08',
    19236,
    92,
    'Hair community individual fire which. Throw step machine Republican of help watch. Far head spring he. Factor air other. Wall particular man simple deep media. These program control treatment.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    4864,
    '2016-03-04',
    19236,
    89,
    'Always wait address measure appear picture different. Final show bar hit fish become movie. Art son itself in man tonight. Age pick fire positive our environment. Southern free oil size hour my apply firm. Stay field use. Would president back able difference detail. Vote official ever seek. Arm everything number speak stuff person staff.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    4864,
    'chicken egg'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    4864,
    'sage'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    4864,
    'arthritis',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    4864,
    'epilepsy',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    4864,
    '2018-04-08',
    'antibiotics'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    4864,
    '2016-03-04',
    'antifungal'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 40716, 'Melinda Williams' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    16808,
    'Mary',
    '2015-03-15',
    'M',
    'Dog',
    'Boxer',
    'Merle'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    16808,
    '2017-12-13',
    40716,
    100,
    'Like stage against suggest. Business worry six attention. Fight huge resource. Prevent less a always candidate world. Recognize hour food gun. None community list card. Policy take some better worry thus. Trouble movement yourself federal north miss. So able condition author research fund consumer. Great on development character.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    16808,
    '2019-10-29',
    40716,
    96,
    'Trouble three public once young attorney. Affect throw personal treatment. South north color house. Enjoy support because travel election. Clear according economic authority least option. Mind few can. Analysis cup major. Peace chance determine reality better water leave. Consumer century believe science face really. Kid network man across what him. Customer interest discover fear lot feel your green. Despite available at address laugh discussion scene. Create camera add thus.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    16808,
    'mold'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    16808,
    'wool'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    16808,
    'eye infection',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    16808,
    'arthritis',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    16808,
    '2017-12-13',
    'dewormer'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    16808,
    '2019-10-29',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    64013,
    'Kelly',
    '2004-04-09',
    'F',
    'Cat',
    'Maine Coon',
    'Merle'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    64013,
    '2007-01-31',
    40716,
    98,
    'Bill important catch buy century. Truth get section color grow. Consumer pass nor job. Determine finish actually crime audience house. Prevent early west assume visit discover great. Interesting represent again when. Carry work son specific enough pull. Vote between human writer role lawyer necessary. Forget window participant. Win tax kind stage service check ten here. Also bar off network history onto. Poor blood poor protect help available try.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    64013,
    '2017-12-07',
    40716,
    98,
    'Together support pretty. This able five hard yourself. Dark above table lay arm notice relate. Term which seven challenge official indicate. Media quite expert move still rate late. Better lead simply interview social example hit.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    64013,
    'wheat'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    64013,
    'dust mite'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    64013,
    'leptospirosis',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    64013,
    'diabetes',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    64013,
    '2007-01-31',
    'steroids'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    64013,
    '2017-12-07',
    'flea prevention'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 87836, 'Michael Butler DVM' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    67684,
    'Jessica',
    '2018-12-04',
    'F',
    'Dog',
    'Basset Hound',
    'Brown'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    67684,
    '2019-06-13',
    87836,
    52,
    'Painting fall professional. Include just scene yet better production. Paper factor past century service important. Course seek draw great half direction value. Sport run north knowledge hold action either. Hour run body. Describe standard sign tough whether learn enjoy. Exactly tree deep member present couple across.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    67684,
    '2020-02-03',
    87836,
    52,
    'Step yet field nothing bad worry. Government number network teach whom Democrat coach some. Body should fire from. Court daughter left risk house. Drop picture since learn best. Us never entire final material. Student main cell money yet cultural. Tax fact particular sing. Production hand rock whom talk. Open nearly thus find east.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    67684,
    'wheat'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    67684,
    'chicken egg'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    67684,
    'salmonella',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    67684,
    'hyperthyroidism',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    67684,
    '2019-06-13',
    'dewormer'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    67684,
    '2020-02-03',
    'antifungal'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    95417,
    'Kenneth',
    '2020-02-08',
    'F',
    'Cat',
    'California Spangled',
    'Black & White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    95417,
    '2021-04-05',
    87836,
    54,
    'Sit policy car national ball its. Continue town election four thus charge. Across including without let return source work. List follow himself or pick bag letter. At spring move couple issue. Happy us their exist guy.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    95417,
    '2022-02-12',
    87836,
    52,
    'Police blood line possible energy tend government. Five go center gun cost show kind. Her thus view contain ten. Everyone free financial someone. Rise possible in chair. While his offer it administration. Fine it single business people. Them quickly arrive central light where. Half size leader increase put turn. When dinner painting. Knowledge energy structure street operation.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    95417,
    'pollen'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    95417,
    'chicken egg'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    95417,
    'lymphoma',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    95417,
    'ear infection',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    95417,
    '2021-04-05',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    95417,
    '2022-02-12',
    'steroids'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 3488, 'Megan Brown' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    99593,
    'Whitney',
    '2014-03-22',
    'F',
    'Dog',
    'Irish Wolfhound',
    'White'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    99593,
    '2020-06-27',
    3488,
    51,
    'Only reality keep task whole heart machine international. Doctor before often practice. Name couple her force no. Class home skin organization benefit standard. Trip certainly view commercial control quickly dream. Black pretty instead really effort. Reveal design necessary worry. Skill different check argue. Technology learn air man.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    99593,
    '2017-10-04',
    3488,
    49,
    'Fine bed reason year without. Method arrive action institution relate let. Sister order want. East year response year himself. Several fear door popular likely. Both develop budget. Bag notice since. Hand whether world recent spend put nation.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    99593,
    'chicken egg'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    99593,
    'pollen'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    99593,
    'bone cancer',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    99593,
    'leptospirosis',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    99593,
    '2020-06-27',
    'antifungal'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    99593,
    '2017-10-04',
    'flea prevention'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    11500,
    'Wendy',
    '2014-01-31',
    'F',
    'Cat',
    'California Spangled',
    'Black'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    11500,
    '2019-06-28',
    3488,
    51,
    'Exactly fire soon treat with power town almost. Kind total traditional street. Box blood Mr artist parent. Government miss only ask thousand your article. Discussion true feeling change end court himself agree. Necessary call gun really development role election. Against drop war center from believe gas. Quality bed machine by return image. Mean culture office tree. Hard article her cell explain similar successful.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    11500,
    '2019-04-29',
    3488,
    52,
    'Protect purpose chance. Drive attorney concern performance right role partner yeah. Dog check someone blue leader candidate. Let finish family situation large. Affect material doctor beautiful. Live goal fund language court teacher seat.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    11500,
    'dust mite'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    11500,
    'hazelnut'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    11500,
    'epilepsy',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    11500,
    'salmonella',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    11500,
    '2019-06-28',
    'anti-inflammatory'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    11500,
    '2019-04-29',
    'dewormer'
);

INSERT INTO veterinarian_office.vet( vet_id, vet_name )
VALUES( 95381, 'Margaret Johnson' );

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    66830,
    'Brandon',
    '2015-01-01',
    'M',
    'Dog',
    'Cocker Spaniel',
    'Merle'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    66830,
    '2018-06-03',
    95381,
    8,
    'Tonight institution white international possible. Major fact own ahead loss continue. Quickly kitchen on project heavy suggest food. Simple agree owner medical present energy movement fear. Evening middle full sense seat network design. Safe debate despite address bar. Point tree old man president soldier wide. Walk so suggest south huge probably.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    66830,
    '2017-04-29',
    95381,
    13,
    'Should magazine employee force start often particularly. Area face article. Them model however impact common. Firm end last myself. Develop time page high through happen check. Traditional tonight enough help after easy. Bad about stock old none own. Life but her movement star week claim. According bag reach ago skill. Mrs each purpose of image. Artist gun land despite development might population.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    66830,
    'wheat'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    66830,
    'sage'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    66830,
    'worms',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    66830,
    'bone cancer',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    66830,
    '2018-06-03',
    'flea prevention'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    66830,
    '2017-04-29',
    'pain reliever'
);

INSERT INTO veterinarian_office.animal(
    pet_id,
    pet_name,
    pet_birthdate,
    pet_sex,
    species,
    breed,
    color
)
VALUES(
    15755,
    'Cynthia',
    '2015-06-09',
    'F',
    'Cat',
    'SphinxManx',
    'Calico'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    15755,
    '2019-02-02',
    95381,
    14,
    'Special five strong general morning. Including boy rate really system. Hot government sing decade allow agency. Specific though small about. Claim none painting various perform. Without create finally pull we across man. Even themselves that feeling away material smile.'
);

INSERT INTO veterinarian_office.appointment(
    pet_id,
    appointment_date,
    vet_id,
    weight,
    notes
)
VALUES(
    15755,
    '2021-05-12',
    95381,
    13,
    'Me time item approach reality short. Film bag material girl family. Bag quality country month several. People suffer teacher because issue. Dinner view me although give economic. Direction standard figure right. House test simply assume. Effect remember finish candidate model. Close season remain even read. Friend activity laugh whom item past. Structure strategy sister husband activity event past. Certainly animal range gas black health hair.'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    15755,
    'chicken egg'
);

INSERT INTO veterinarian_office.allergy(
    pet_id,
    allergy
)
VALUES(
    15755,
    'wool'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    15755,
    'lymphoma',
    'y'
);

INSERT INTO veterinarian_office.condition(
    pet_id,
    medical_condition,
    is_active
)
VALUES(
    15755,
    'eye infection',
    'y'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    15755,
    '2019-02-02',
    'dewormer'
);

INSERT INTO veterinarian_office.prescription(
    pet_id,
    appointment_date,
    prescription
)
VALUES(
    15755,
    '2021-05-12',
    'steroids'
);

