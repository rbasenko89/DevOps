before starting docker containers run script vault.sh in current folder
after everything is done run:
 docker-compose build 
 docker-compose up
# Node app will start on localhost:3001 and show query result from Postgres DB
## Posgtres DB is empty, so you can add test table and test row using following queries :

CREATE TABLE links (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
        last_update DATE
);


INSERT INTO links (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');


After it is done, Node server will show id value on it's page

Open in browser: 
localhost:3001

Simple output should be 
{id:1}

