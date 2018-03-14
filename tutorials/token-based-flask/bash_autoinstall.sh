#! /bin/bash
clear
echo "Script installing the Dockerfiles for an automatic setup of our system
"

echo "Setting up parameters"
BASEDIR="$PWD"
POSTGRES_CONTAINER="docker run -d --name postgres postgres:9.6"


echo "Creating all the folders"
#todo cd / && mkdir mydata && cd myata
# mkdir redis_data && mkdir postgres_data && mkdir nginx_data
#root@pophubserver:/mydata# mkdir log_mynodeapp && mkdir log_nginx

echo "
.: FIRST STEP :.
> Running PostgreSQL container
> Naming it postgres_db
> mapping local drive /data/postgres_data
> Creating a user and password
> Official image: port 5432 exposed. Default postgres user and database are created in the entrypoint with initdb"
docker run  --name postgres_db -e POSTGRES_PASSWORD=postgres_pass -v $BASEDIR/data/postgres_data:/var/lib/postgresql/data --restart=unless-stopped -d postgres

IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' postgres_db)

# wait for the database to come up
until docker exec postgres_db psql -U postgres; do
    echo "Waiting for postgres container..."
    sleep 2
done

# create databases

docker exec postgres_db psql -U postgres -c "CREATE DATABASE flask_jwt_auth"
docker exec postgres_db psql -U postgres -c "CREATE DATABASE flask_jwt_auth_test"

