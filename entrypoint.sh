#!/bin/bash

RSA_DIR="${HOME}/.ssh/id_rsa"
#INPUT_KEY

echo "🔑 Добавляю SSH ключ..."
touch RSA_DIR
echo -e "${INPUT_KEY}" >> RSA_DIR
echo "🔐 Ключ добавлен"

ssh ${INPUT_USER}@${INPUT_HOST} "bash ${INPUT_DIR}bin/user.sh"