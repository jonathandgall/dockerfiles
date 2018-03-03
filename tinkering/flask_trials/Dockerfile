FROM ubuntu

RUN apt-get update
RUN apt-get install software-properties-common -y

RUN apt-get install python-pip python-dev build-essential -y
RUN pip install --upgrade pip
RUN pip install Flask-SqlAlchemy
RUN apt-get install --upgrade virtualenv -y

RUN apt-get install vim -y
RUN pip install Flask
RUN mkdir templates/ static/

ADD hello.py hello.py
ADD app.py app.py
ADD login.html templates/login.html
ADD style.css static/style.css
ADD tabledef.py tabledef.py
ADD dummy.py dummy.py

RUN python tabledef.py && python dummy.py

EXPOSE 4000
ENV PORT 4000