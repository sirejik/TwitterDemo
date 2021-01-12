# twitter-demo
This application is a simple version of a social network like Twitter. This application provides the following
functionality:
- Login form with the possibility to create a new user.
- Review and add new posts.
- Like and unlike posts.
- Subscribe to users.

# Technology stack
- Spring Boot
- Hibernate
- Freemarker
- PostgreSQL
- Docker

# How to run the application
There are two ways to run an application:
- Completely in Docker. In this case, two containers must be running: with the application and with the database.
- Locally for developers. In this case, two containers must be running: one with a database for the application and one
with a database for unit tests.

## Build application
To build containers with the application and Postgres database need to execute the following command:
```
docker-compose build
```

## Run application in docker
To run the application need to execute the following command:
```
docker-compose up -d
```

## Run only postgres databases
To run only postgres databases need to execute the following command:
```
docker-compose -f docker-compose-dev.yml up -d
```

## How to execute the SQL query manually.
1. Get container ID: 
```
docker ps
```
2. Get POSTGRES_USER from docker-compose.yml.
3. Execute the following command:
```
docker exec -it <CONTAINER_ID> psql -U <POSTGRES_USER> <DATABASE_NAME>
```

## How to down docker containers.
To stops containers need to execute the following command:
```
docker-compose stop
```
If need to stop and remove containers, need to run the following command:
```
docker-compose down -v
```
