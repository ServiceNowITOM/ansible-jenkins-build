# ansible-jenkins-build

Install Ansible then build and configure Jenkins with NginX reverse proxy for SSL access, then install Docker and Docker-Compose.

Requirements: Currently only tested with Ubunto 14.04LTS

Installation:  

SSH into your server and run the following command. 

wget https://raw.githubusercontent.com/ServiceNowITOM/ansible-jenkins-build/master/build-ci-server.sh; chmod u+x build-ci-server.sh; ./build-ci-server.sh
