-- Migration number: 0000 	 2023-09-29T13:37:28.486Z

CREATE TABLE player (
	id integer PRIMARY KEY AUTOINCREMENT,
	slack_id text NOT NULL
);

CREATE TABLE signup (
	player_id integer NOT NULL REFERENCES player(id),
	sheet_id integer NOT NULL REFERENCES signup_sheet(id),
	rank integer,

	UNIQUE(sheet_id, player_id),
	UNIQUE(sheet_id, rank)
);

CREATE TABLE signup_sheet (
	id integer PRIMARY KEY AUTOINCREMENT,
	event_datetime text NOT NULL,
	raffle_datetime text NOT NULL
);
