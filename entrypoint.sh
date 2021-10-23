#!/bin/bash

#INPUT_KEY=$(cat /test.key)
#INPUT_USER="pavel"
#INPUT_HOST="pavel.one"
#INPUT_DIR="~/www/Quiz/"

mkdir -p ~/.ssh/
touch ~/.ssh/config

echo -e "Host *\n\tStrictHostKeyChecking no" >> ~/.ssh/config

echo "${INPUT_KEY}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

ssh ${INPUT_USER}@${INPUT_HOST} "cd ${INPUT_DIR} && bash bin/user.sh"