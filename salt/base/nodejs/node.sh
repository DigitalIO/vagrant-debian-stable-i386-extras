#!/bin/bash

#Move to tmp
cd /tmp

# Grab and run install script
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.3/install.sh | bash

# Update profile
source ~/.profile

# Use Node 0.11.x
nvm install 0.11

# Update npm
npm install -g npm

# Install pm2
npm install -g pm2 --unsafe-perm

# Make node avalible to all users
n=$(which node)
n=${n%/bin/node}
chmod -R 755 $n/bin/*
cp -r $n/{bin,lib,share} /usr/local

