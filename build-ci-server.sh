#!/bin/bash
grep `hostname` /etc/hosts || sed -i "/^127.*/ s/$/ `hostname`/" /etc/hosts
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
[ -d /etc/nginx ] || sudo mkdir /etc/nginx
[ -e /etc/nginx/cert.crt ] || sudo openssl req \
    -new \
    -newkey rsa:4096 \
    -days 3650 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=ci-demo.servicenow.com" \
    -keyout /etc/nginx/cert.key \
    -out /etc/nginx/cert.crt
/usr/bin/ansible-playbook configure-ci-server.yml --extra-vars "variable_host=localhost" -i "localhost," --connection=local
JKEY=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
echo Please browse to https://YOUR_INSTANCE_IP/ and enter the initial admin password below.
echo ======================================================================================
echo INITIAL ADMIN PASSWORD = $JKEY
echo ======================================================================================

#sudo mkdir /usr/local/share/ca-certificates/docker-dev-cert
#sudo cp /etc/nginx/ci-demo.crt /usr/local/share/ca-certificates/docker-dev-cert
#sudo update-ca-certificates
# configure-jenkins.sh
