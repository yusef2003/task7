create database database_task



CREATE TABLE actor (
    act_id INTEGER PRIMARY KEY,
    act_fname CHAR(20) NOT NULL,
    act_lname CHAR(20) NOT NULL,
    act_gender CHAR(1) NOT NULL
);

CREATE TABLE director (
    dir_id INTEGER PRIMARY KEY,
    dir_fname CHAR(20) NOT NULL,
    dir_lname CHAR(20) NOT NULL
);


CREATE TABLE movie (
    mov_id INTEGER PRIMARY KEY,
    mov_title CHAR(50) NOT NULL UNIQUE,
    mov_year INTEGER NOT NULL,
    mov_time INTEGER NOT NULL,
    mov_lang CHAR(50) NOT NULL,
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);


CREATE TABLE reviewer (
    rev_id INTEGER PRIMARY KEY,
    rev_name CHAR(30) NOT NULL UNIQUE
);


CREATE TABLE genres (
    gen_id INTEGER PRIMARY KEY,
    gen_title CHAR(20) NOT NULL UNIQUE
);


CREATE TABLE movie_cast (
    act_id INTEGER NOT NULL,
    mov_id INTEGER NOT NULL,
    role CHAR(30) NOT NULL,
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);


CREATE TABLE movie_direction (
    dir_id INTEGER NOT NULL,
    mov_id INTEGER NOT NULL,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);


CREATE TABLE movie_genres (
    mov_id INTEGER NOT NULL,
    gen_id INTEGER NOT NULL,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);


CREATE TABLE rating (
    mov_id INTEGER NOT NULL,
    rev_id INTEGER NOT NULL,
    rev_stars INTEGER NOT NULL,
    num_o_ratings INTEGER NOT NULL,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);
