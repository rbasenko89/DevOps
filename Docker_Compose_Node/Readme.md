## to start two containers (Postgres DB and node.app) talking to each other run following command in folder where Docker-compose file is located
docker-compose build
docker-compose up 

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

SELECT id, url, "name", description, last_update FROM public.links;

After it is done, Node server will show id value on it's page

Open in browser: 
localhost:3001