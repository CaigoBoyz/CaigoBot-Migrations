BEGIN;

CREATE TABLE discord_users (
    id serial,
    user_id int NOT NULL,
    discord_id varchar(18) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE discord_guilds (
    id serial,
    owner_id int NOT NULL,
    discord_id varchar(18) NOT NULL,
    command_ch varchar(18),

    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES discord_users (id)
);

CREATE TABLE guild_members (
    id serial,
    guild_id int NOT NULL,
    user_id int NOT NULL,
    is_admin boolean NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (guild_id) REFERENCES discord_guilds (id),
    FOREIGN KEY (user_id) REFERENCES discord_users (id)
);

CREATE TABLE discord_guild_roles (
    id serial,
    guild_id int NOT NULL,
    role_id varchar(18) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (guild_id) REFERENCES discord_guilds (id)
);

CREATE TABLE member_roles (
    id serial,
    role_id int NOT NULL,
    member_id int NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES discord_guild_roles (id),
    FOREIGN KEY (member_id) REFERENCES guild_members (id)
);

CREATE TABLE discord_bot_cmds (
    id serial,
    name text NOT NULL,
    description text NOT NULL,

    PRIMARY KEY (id)
);

INSERT INTO discord_bot_cmds(id, name, description) VALUES (DEFAULT, 'help', 'Lista dei comandi disponibili');

CREATE TABLE guild_cmds (
    id serial,
    guild_id int NOT NULL,
    cmd_id int NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (cmd_id) REFERENCES discord_bot_cmds (id)
);

END;
