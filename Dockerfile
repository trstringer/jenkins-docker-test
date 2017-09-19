FROM python:alpine3.6

COPY . /usr/local/jenkins-docker-test
WORKDIR /usr/local/jenkins-docker-test

RUN pip install -r requirements.txt

EXPOSE 8000

CMD gunicorn -b 0.0.0.0:8000 app:app
