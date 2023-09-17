#!/bin/bash

# Prevent constantly getting passphrase prompts for your key
eval "$(ssh-agent -s)"
eval "$(ssh-add ~/.ssh/id_rsa)"

docker-machine create --driver amazonec2 \
--amazonec2-region sa-east-1 \
--engine-label "My machine" \
--amazonec2-instance-type "t2.nano" \
--amazonec2-ssh-keypath ~/.ssh/id_rsa \
my-machine
