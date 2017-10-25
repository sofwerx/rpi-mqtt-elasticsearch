#!/bin/bash -e
. .env
docker pull ${TRAVIS_REPO_SLUG}:latest || true
docker build -t \
  --cache-from ${TRAVIS_REPO_SLUG}:latest \
  ${TRAVIS_REPO_SLUG}:latest .
