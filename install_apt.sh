#!/bin/bash
apt-get update
apt-get install -y python3-pip
# apt-get install -y vim
# apt-get install -y python-virtualenv
# apt-get install -y virtualenvwrapper
# apt-get install -y libssl-dev openssl
# wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
# tar -xvzf Python-3.5.2.tgz
# cd Python-3.5.2/
# ./configure --with-ensurepip=install
# make
# sudo make install

# wait for Postgres to start
postgres_ready(){
python << END
import sys
import psycopg2
try:
    conn = psycopg2.connect(dbname="postgres", user="postgres", password="", host="db")
except psycopg2.OperationalError:
    sys.exit(-1)
sys.exit(0)
END
}

until postgres_ready; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
#
# echo "Delete migrations"
# find . -path "*/migrations/*.pyc"  -delete
# find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
echo "Create makemigrations and migrate"
python3 sas/manage.py makemigrations
python3 sas/manage.py migrate
echo "Run server"
python3 sas/manage.py runserver 0.0.0.0:8000
