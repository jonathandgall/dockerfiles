FROM ubuntu

RUN apt-get update
RUN apt-get install software-properties-common -y

RUN apt-get install python-pip python-dev build-essential -y
RUN pip install --upgrade pip
RUN apt-get install --upgrade virtualenv -y

RUN apt-get install vim -y
RUN pip install Flask
# RUN mkdir app/
RUN mkdir templates/ static/
COPY hello.py hello.py
COPY app.py app.py
COPY login.html templates/login.html
COPY styles.css static/styles.css
# RUN python hello.py

EXPOSE 4000
ENV PORT 4000