FROM postgres


RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && aws --version

COPY GetENV.sh .
ENTRYPOINT [ "./GetENV.sh" ]

CMD [ "postgres" ]