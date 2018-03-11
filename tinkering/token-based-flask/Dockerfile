FROM ubuntu

RUN useradd me

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y  software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3


RUN apt-get install -y python-pip python-dev build-essential python-software-properties vim git-all
RUN pip install --upgrade pip 
RUN apt-get install --upgrade virtualenv -y
RUN echo "root:Docker!" | chpasswd

RUN pip install flask coverage flask-script flask_bcrypt flask-SQLAlchemy
RUN git clone https://github.com/realpython/flask-jwt-auth.git; cd flask-jwt-auth; git checkout tags/1.0.0 -b jwt-auth

WORKDIR flask-jwt-auth
RUN pwd 

RUN virtualenv token 
RUN /bin/bash -c "source token/bin/activate"
RUN ls
RUN pip install -r requirements.txt
RUN apt-get update

USER postgres
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker &&\
    createdb -O docker flask_jwt_auth &&\
    createdb -O docker flask_jwt_auth_test  

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
USER root
RUN sed -i -e 's/something/flask_jwt_auth/g' project/server/config.py
ENV APP_SETTINGS "project.server.config.DevelopmentConfig"

COPY test__config_01.py project/tests/test__config.py
RUN python manage.py test

COPY 

EXPOSE 4001 5432
ENV PORT 4001

#RUN service postgresql start
#USER me


