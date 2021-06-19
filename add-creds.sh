#!/bin/bash

USERNAME=solao
PASSWD=solao
JENKINS_HOST=localhost
PORT=8080

export JENKINS_CRUMB=$(curl -s 'http://solao:solao@localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo ${JENKINS_CRUMB}


curl -s -XPOST -H ${JENKINS_CRUMB} http://solao:solao@localhost:8080/credentials/store/system/domain/_/createCredentials \
--data-urlencode 'json={
  "": "0",
  "credentials": {
    "scope": "GLOBAL",
    "id": "injected",
    "username": "solao",
    "password": "solao",
    "description": "My new credentials",
    "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
  }
}'


