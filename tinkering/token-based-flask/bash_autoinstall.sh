#! /bin/bash

clear


echo "Script installing the Dockerfiles for an automatic setup of our Nakara system"

echo "Setting up parameters"
BASEDIR="$PWD"


echo "Creating all the folders"
#todo cd / && mkdir mydata && cd myata
# mkdir redis_data && mkdir postgres_data && mkdir nginx_data
#root@pophubserver:/mydata# mkdir log_mynodeapp && mkdir log_nginx

echo "Starting PostgreSQL Docker Session, create a user and password, naming it postgres, and mapping local drive /data/postgres_data"
docker run -d --name postgres -e POSTGRES_PASSWORD=postgres -v $BASEDIR/data/postgres_data:/var/lib/postgresql/data --restart=unless-stopped postgres

# docker exec -i -t postgres bash

docker exec -it postgres psql -U postgres -W postgres <<EOF
CREATE DATABASE flask_jwt_auth;
CREATE DATABASE flask_jwt_auth_test; 
EOF


#docker stop $(docker ps -a -q) && docker rm -f $(docker ps -a -q) && rm -rf /Users/jay/Code/Docker/Dockerfiles/tinkering/token-based-flask/data

