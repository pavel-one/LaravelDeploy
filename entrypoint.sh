#!/bin/bash

#INPUT_KEY=$(cat /test.key)
#INPUT_USER="pavel"
#INPUT_HOST="pavel.one"
#INPUT_DIR="~/www/Quiz/"

echo "Конфигурирую SSH"

mkdir -p ~/.ssh/
touch ~/.ssh/config

echo -e "Host *\n\tStrictHostKeyChecking no" >> ~/.ssh/config

echo "${INPUT_KEY}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo "Произвожу деплой"

ssh -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -o LogLevel=quiet \
    -i ~/.ssh/id_rsa \
    ${INPUT_USER}@${INPUT_HOST} "cd ${INPUT_DIR} && bash bin/user.sh"