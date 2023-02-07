ARG CODE_VERSION=20.04

FROM ubuntu:${CODE_VERSION}

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa -y

RUN apt-get install python3-pip -y

RUN apt-get update && apt-get install python3.8 -y

RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y



WORKDIR /app
COPY mysite/requirements.txt mysite/requirements.txt
RUN pip install -r mysite/requirements.txt
COPY . .

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
