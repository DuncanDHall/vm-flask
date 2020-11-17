FROM ubuntu:20.10

MAINTAINER Duncan Hall "duncan@archive.org"

ENV LANG "en_US.UTF-8"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip

COPY app.py app/

EXPOSE 5000

RUN pip install pipenv
COPY ./Pipfile /app/Pipfile

RUN pipenv install

WORKDIR app/
CMD ["python3", "app.py"]
