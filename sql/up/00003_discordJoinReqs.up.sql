BEGIN;

INSERT INTO discord_bot_cmds(id, name, description) VALUES (DEFAULT, 'join', 'Ask to join a private streaming voice channel');

CREATE TABLE guild_stream_rooms (
    id serial,
    guild_id int NOT NULL,
    owner_id int NOT NULL,
    staff_role_id int,
    subs_role_id int,
    followers_role_id int,
    accept_policy int,
    join_policy int,

    PRIMARY KEY (id),
    FOREIGN KEY (guild_id) REFERENCES discord_guilds (id),
    FOREIGN KEY (owner_id) REFERENCES guild_members (id),
    FOREIGN KEY (staff_role_id) REFERENCES discord_guild_roles (id),
    FOREIGN KEY (subs_role_id) REFERENCES discord_guild_roles (id),
    FOREIGN KEY (followers_role_id) REFERENCES discord_guild_roles (id)
);

CREATE TABLE join_req_spool (
    id serial,
    room_id int NOT NULL,
    member_id int NOT NULL,
    is_accepted boolean NOT NULL,
    notification_msg varchar(18) NOT NULL,
    status_msg_id varchar(18) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (room_id) REFERENCES guild_stream_rooms (id),
    FOREIGN KEY (member_id) REFERENCES guild_members (id)
);

END;
