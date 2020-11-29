# twitter-demo
TODO: add text

## How to up a docker container with Postgres.
To build and start a container with Postgres need to execute the following command:
```
docker-compose up -d
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
