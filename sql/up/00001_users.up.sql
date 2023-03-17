BEGIN;

CREATE TABLE users (
    id SERIAL,
    username VARCHAR(100),
    passHash VARCHAR(32),
    salt VARCHAR(128),

    PRIMARY KEY (id)
);

END;
