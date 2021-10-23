#!/bin/bash

echo "🔑 Добавляю SSH ключ..." &&
eval $(ssh-agent -s) &&
ssh-add <(echo "${INPUT_KEY}") &&
echo "🔐 Ключ добавлен";

ssh ${INPUT_USER}@${INPUT_HOST} "bash ${INPUT_DIR}bin/user.sh"