camper: /project$ psql --username=freecodecamp --dbname=postgres;
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE worldcup;
CREATE DATABASE
postgres=> \c worldcup
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "worldcup" as user "freecodecamp".
worldcup=> CREATE TABLE teams (
worldcup(>     team_id SERIAL NOT NULL,
worldcup(>     name VARCHAR(20) UNIQUE NOT NULL
worldcup(> );
CREATE TABLE
worldcup=> CREATE TABLE games (
worldcup(>     game_id SERIAL NOT NULL,
worldcup(>     year INTEGER NOT NULL,
worldcup(>     round VARCHAR(20) NOT NULL,
worldcup(>     winner_id      INTEGER NOT NULL,
worldcup(>     opponent_id    INTEGER NOT NULL,
worldcup(>     winner_goals   INTEGER NOT NULL,
worldcup(>     opponent_goals INTEGER NOT NULL
worldcup(> );
CREATE TABLE
worldcup=> ALTER TABLE teams ADD PRIMARY KEY (team_id);
ALTER TABLE
worldcup=> ALTER TABLE games ADD PRIMARY KEY (game_id);
ALTER TABLE
worldcup=> ALTER TABLE games ADD FOREIGN KEY (winner_id)   REFERENCES teams (team_id);
ALTER TABLE
worldcup=> ALTER TABLE games ADD FOREIGN KEY (opponent_id) REFERENCES teams (team_id);
ALTER TABLE
worldcup=> pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
worldcup->
