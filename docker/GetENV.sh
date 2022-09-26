#!/bin/bash

apt update
apt-get install -y \
build-essential \
curl \
unzip \
git 

#installing aws-cli 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
aws --version   

# Install SSM addon 
