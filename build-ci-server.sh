#!/bin/bash
sudo apt-get update
sudo apt-get -y install git
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible
cd ~
git clone https://github.com/amittell/ansible-jenkins-build
export _JAVA_OPTIONS="-Djava.net.prefer.IPv4Stack=true"
/usr/bin/ansible-playbook configure-ci-server.yml --extra-vars "variable_host=localhost" -i "localhost," --connection=local
