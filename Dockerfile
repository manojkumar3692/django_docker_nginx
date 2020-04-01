FROM python:3.7
# FROM ubuntu:16.04
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install virtualenv
RUN virtualenv -p python3.7 venv
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN apt install unzip
RUN wget https://s3.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/aws-xray-daemon-linux-3.x.zip
RUN unzip -q aws-xray-daemon-linux-3.x.zip 
# RUN apt-get update && \
#     apt-get install build-essential \
#                     python3 \
#                     python3-dev \
#                     python3-pip && \
#     pip3 install --upgrade pip && \
#     pip3 install uwsgi
COPY requirements.txt /code/
RUN mkdir /.aws
COPY ./config/credentials /.aws/
RUN  sh -c "pip install -r requirements.txt"
COPY . /code/
# CMD ["uwsgi", "--ini", "./config/uwsgi.ini"]
# CMD ["python", "manage.py", "runserver"]
# RUN  sh -c "./xray -n us-east-2"
# CMD ["./xray","-n","us-east-2"]