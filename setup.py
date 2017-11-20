#!/usr/bin/env python

from setuptools import setup, find_packages
from pip.req import parse_requirements

# parse_requirements() returns generator of pip.req.InstallRequirement objects
install_reqs = parse_requirements("requirements.txt", session='hack')

# reqs is a list of requirement
# e.g. ['django==1.5.1', 'mezzanine==1.4.6']
reqs = [str(ir.req) for ir in install_reqs]

setup(name='Sas-FGA',
      version='1.0',
      description='Um app para gerenciamento de reserva de salas.',
      long_description='O projeto tem como finalidade desenvolver um software para o gerenciamento de espacos na universidade de Brasilia.',
      author='Equipe 2016.2-SAS_FGA',
      install_requires=reqs,
      license='MIT License',
      platforms='Web',
      author_email='email@email.com',
      url='https://sasfga.herokuapp.com/',
      packages=find_packages(),
      )
