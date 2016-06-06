#!/bin/bash
export _JAVA_OPTIONS="-Djava.net.prefer.IPv4Stack=true"
/usr/bin/ansible-playbook configure-ci-server.yml --extra-vars "variable_host=localhost" -i "localhost," --connection=local
