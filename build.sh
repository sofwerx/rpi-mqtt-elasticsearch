#!/bin/bash -e
. .env
docker build -t ${REPO}:latest .
