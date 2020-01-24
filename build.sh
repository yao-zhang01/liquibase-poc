#!/usr/bin/env bash
# used to build and run container independently from mysql server
docker build -t liquibase_poc .
docker run -it liquibase_poc /bin/bash
