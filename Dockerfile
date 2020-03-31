FROM python:3.7
# FROM ubuntu:16.04
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install virtualenv
RUN virtualenv -p python3.7 venv
# RUN apt-get update && \
#     apt-get install build-essential \
#                     python3 \
#                     python3-dev \
#                     python3-pip && \
#     pip3 install --upgrade pip && \
#     pip3 install uwsgi
COPY requirements.txt /code/
RUN  sh -c "pip install -r requirements.txt"
COPY . /code/
RUN ls
# CMD ["uwsgi", "--ini", "./config/uwsgi.ini"]