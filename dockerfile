FROM ubuntu
USER root

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# install git iproute2
RUN apt-get update && apt-get -y install git iproute2 nano

# https support
RUN apt-get install apt-transport-https

# get gcc
RUN apt-get update &&apt-get install build-essential -y

#curl,wget  install
RUN apt-get -y install curl
RUN apt-get -y install wget

#Python Install
RUN apt-get -y install python3
RUN apt-get -y install python3-pip 

# Install DBT tool. Its from PyPi repo
#RUN pip3 install dbt

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
	
# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
USER root
