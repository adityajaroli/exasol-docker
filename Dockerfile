FROM exasol/docker-db:latest

WORKDIR /exa
COPY . .

RUN yum install -y curl
# Installing exaplus cli inside the container so that required sql scripts can be run when the db is getting up
RUN curl https://www.exasol.com/support/secure/attachment/111497/EXAplus-7.0.0.tar.gz --output exaplus.tar.gz
RUN tar -xzf exaplus.tar.gz
RUN rm exaplus.tar.gz

EXPOSE 8563

RUN chmod 777 startup.sh

ENTRYPOINT ["/exa/startup.sh"]