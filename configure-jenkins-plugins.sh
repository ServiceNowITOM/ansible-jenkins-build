#!/bin/bash
set -x
user='admin'
token=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
host='http://'$user':'$token'@localhost:8080'
url=/pluginManager/installNecessaryPlugins

curl -X POST -d '<jenkins><install plugin="git@current" /></jenkins>' --header 'Content-Type: text/xml' $host$url

curl -X POST -d '<jenkins><install plugin="github@current" /></jenkins>' --header 'Content-Type: text/xml' $host$url
curl -X POST -d '<jenkins><install plugin="github-api@current" /></jenkins>' --header 'Content-Type: text/xml' $host$url

curl -X POST -d '<jenkins><install plugin="notifcation@current" /></jenkins>' --header 'Content-Type: text/xml' $host$url

curl -X POST -d '<jenkins><install plugin="docker-build-step@current" /></jenkins>' --header 'Content-Type: text/xml' $host$url


# wait 20 sec
sleep 20

# jenkins safe restart
curl -X POST $host/safeRestart
