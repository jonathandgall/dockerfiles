#! /bin/bash

clear


echo "Script installing the Dockerfiles for an automatic setup of our Nakara system"

echo "Setting up parameters"
BASEDIR="$PWD"


echo "Creating all the folders"
#todo cd / && mkdir mydata && cd myata
# mkdir redis_data && mkdir postgres_data && mkdir nginx_data
#root@pophubserver:/mydata# mkdir log_mynodeapp && mkdir log_nginx

echo "Running PostgreSQL, creating a user and password, naming it postgres, and mapping local drive /data/postgres_data. We call the official image which has by default the port 5432 exposed. The default postgres user and database are created in the entrypoint with initdb"
#docker run  --name postgres -e POSTGRES_PASSWORD=postgres -v $BASEDIR/data/postgres_data:/var/lib/postgresql/data --restart=unless-stopped -d postgres

sudo docker run -d --name postgres_db postgres:9.6

# to simply execute bash
# sudo docker exec -it postgres_db /bin/bash 
sleep 10  # Waits 5 seconds
# to simply execute bash
sudo docker exec -it postgres_db psql -U postgres 


# docker exec -it postgres su postgres psql

# docker exec -tiu postgres postgres psql

# docker exec -tiu postgres psql -U postgres


# docker exec -it postgres psql -U postgres -W postgres postgres

# docker exec postgres psql -U postgres <<EOSQL
# CREATE DATABASE flask_jwt_auth;
# CREATE DATABASE flask_jwt_auth_test; 
# EOSQL


#docker stop $(docker ps -a -q) && docker rm -f $(docker ps -a -q) && rm -rf /Users/jay/Code/Docker/Dockerfiles/tinkering/token-based-flask/data

