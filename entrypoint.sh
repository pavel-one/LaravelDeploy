#!/bin/bash

mkdir /root/.ssh
RSA_DIR="/root/.ssh/id_rsa"

echo "🔑 Добавляю SSH ключ..."
touch $RSA_DIR
echo -e "${INPUT_KEY}" >> $RSA_DIR
chmod 600 $RSA_DIR
echo "🔐 Ключ добавлен"

ssh ${INPUT_USER}@${INPUT_HOST} "bash ${INPUT_DIR}bin/user.sh"