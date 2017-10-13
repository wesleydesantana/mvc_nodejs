CREATE TABLE CHALLENGES(
    id_challenge int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
)

CREATE TABLE USERS(
    id_user int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    password varchar(50) NOT NULL,
    avatar varchar(255) NOT NULL,
    permission varchar(20) NOT NULL
)

CREATE TABLE CHALLENGES_USERS(
    id int NOT NULL AUTO_INCREMENT,
    id_user int NOT NULL,
    id_challenge int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES USERS(id_user),
    FOREIGN KEY (id_challenge) REFERENCES CHALLENGES(id_challenge)
)

CREATE TABLE PARTICIPANTS(
    id_participant int NOT NULL AUTO_INCREMENT,
    id_user int NOT NULL,
    type_account int NOT NULL,
    PRIMARY KEY (id_participant),
    FOREIGN KEY (id_user) REFERENCES USERS(id_user)
)

CREATE TABLE SIGNATURE(
    id_signatiure int NOT NULL AUTO_INCREMENT,
    id_participant int NOT NULL,
    start_date date,
    end_date date,
    PRIMARY KEY (id_signatiure),
    FOREIGN KEY (id_participant) REFERENCES PARTICIPANTS(id_participant)
)

CREATE TABLE CERTIFICATE(
    id_certificate int NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    id_user int NOT NULL,
    id_challenge int NOT NULL,
    img varchar(255) NOT NULL,
    price decimal(10,2),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_challenge) REFERENCES challenges(id_challenge)
)

CREATE TABLE CERTIFICATE_BUY(
    id int NOT NULL AUTO_INCREMENT,
    id_participant int NOT NULL,
    id_challenge int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_participant) REFERENCES PARTICIPANTS(id_participant),
    FOREIGN KEY (id_challenge) REFERENCES CHALLENGES(id_challenge)
)

CREATE TABLE PROJETS(
     id_project int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description text NOT NULL
)


CREATE TABLE LABS(
     id_lab int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description text NOT NULL
)

CREATE TABLE COURSES(
     id_courses int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description text NOT NULL
)