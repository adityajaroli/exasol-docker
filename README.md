# exasol-docker
OWNER: Aditya Jaroli

A single node Exasol db running in a docker container. This project is inspired from https://github.com/exasol/docker-db

This service is useful for learning Exasol, performing analytics on Exasol or Testing services dependent on Exasol.

**USE CASE 1:** Dependent Microservice
If there is a micro service which depends on an exasol db then to test the service (backend service and exasol db service) locally like it
happens in staging/prod, once can use this project and run it in the container.

**USE CASE 2:** BDDs/Tests running locally or in CI/CD pipeline
Very useful to write BDDs for the service which depends on the exasol. These can be run locally and CI/CD pipelines too.

**USE CASE 3:** Learning Exasol

**USE CASE 4:** Performing analytics locally using Exasol


**How it works?**
> The ```sh /usr/opt/EXASuite-7/EXAClusterOS-7.0.10/docker/entrypoint.sh init-sc &``` command starts the exasol db as single node cluster in the background (as a background process) and allocates the bare minimum hardware/memory to it. This DB is an temporary db i.e. once the container is killed, all the data in it is also gone. One can mount the DB data drive on the host to make it permanent. 

As part of docker image building, EXAPlus is downloaded and made it available to connect to the Exasol DB via command line. 

The below command is mentioned in the startup.sh file which connects to the db and run the sql script (exaplus.sql) to setup the database with preset data.

```./EXAplus-7.0.0/exaplus -c 127.0.0.1:8563 -u sys -p exasol -f exaplus.sql```

Here in the command "-f" is the important flag which takes a file with sql commands and executes them in the order they are mentioned in the file.
Also once all the commands in the given file are over, it automatically disconnects from the DB.

**How to run?**
1. Build the docker file
```Docker build -t exasol .```

2. Run the docker file with below command
```docker run -p 8563:8563 -d -t --privileged --stop-timeout 120 --name exasol-db exasol```