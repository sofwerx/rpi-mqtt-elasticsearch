#!/bin/bash -e
. .env
docker pull ${TRAVIS_REPO_SLUG}:latest || true
docker build \
  --cache-from ${TRAVIS_REPO_SLUG}:latest \
  -t ${TRAVIS_REPO_SLUG}:latest .
