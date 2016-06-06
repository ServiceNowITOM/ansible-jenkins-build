#!/bin/bash
sudo apt-get update
[ -e /usr/bin/git ] || sudo apt-get -y install git
[ -e /usr/bin/git ] || exit 1
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
[ -e /usr/bin/ansible ] || sudo apt-get -y install ansible
cd ~
git clone --recursive https://github.com/amittell/ansible-jenkins-build
cd ansible-jenkins-build
export _JAVA_OPTIONS="-Djava.net.prefer.IPv4Stack=true"
/usr/bin/ansible-playbook configure-ci-server.yml --extra-vars "variable_host=localhost" -i "localhost," --connection=local
# configure-jenkins.sh
