#!/usr/bin/env bash
docker build -t liquibase_poc .
docker run -it liquibase_poc /bin/bash
