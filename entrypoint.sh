#!/bin/bash

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
    ${INPUT_USER}@${INPUT_HOST} "cd ${INPUT_DIR}; \
    bash bin/user.sh; \
    git pull; \
    make down; \
    make up; \
    docker-compose exec -T app composer install; \
    docker-compose exec -T app php artisan key:generate;
    docker-compose exec -T app php artisan migrate --force;"