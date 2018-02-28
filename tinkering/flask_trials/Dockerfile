FROM ubuntu

RUN apt-get update
RUN apt-get install software-properties-common
RUN echo yes

RUN install python-pip python-dev build-essential
RUN install --upgrade pip
RUN install --upgrade virtualenv

RUN apt-get install vim

EXPOSE 80