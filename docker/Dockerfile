FROM ubuntu:latest

RUN apt update
RUN apt-get install -y \
    build-essential \
    curl \
    unzip \
    git 

# this image is being made with the assumption that the end user has access to come shared credentials such as paramstore

#installing aws-cli 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN aws --version   

COPY ./GetENV.sh .
ENTRYPOINT [ "./GetENV.sh" ]

