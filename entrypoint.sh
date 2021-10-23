#!/bin/bash

mkdir -p ~/.ssh/
echo "$INPUT_KEY" > ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/private.key

ssh -o "StrictHostKeyChecking=no" ${INPUT_USER}@${INPUT_HOST} "bash ${INPUT_DIR}bin/user.sh"