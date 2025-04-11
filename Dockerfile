FROM jenkins/jenkins:lts

USER root

# Instalar Python 3, pip y venv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

USER jenkins
