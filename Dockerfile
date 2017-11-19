FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt && apt-get update -y
RUN pip install ansible
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils
ADD . /code/