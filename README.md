# rpi-mqtt-elasticsearch

[![Build Status](https://travis-ci.org/sofwerx/rpi-mqtt-elasticsearch.svg)](https://travis-ci.org/sofwerx/rpi-mqtt-elasticsearch)

This is the Dockerfile behind `sofwerx/rpi-mqtt-elasticsearch` on Docker Hub, setup to autobuild through travis.

Note: the base image of the Dockerfile is `FROM multiarch/debian-debootstrap:armhf-jessie`, which is to allow the x86_64 travis-ci servers to run qemu when building the ARM contents of this resultant image.

This runs an MQTT to Elasticsearch push service.

The parent project to this is [sofwerx/rpi-tpms](https://github.com/sofwerx/rpi-tpms). There you will find the docker-compose that uses this container.

Here is the docker-compose snippet of this container image in use:

  mqtt-elasticsearch:
    image: sofwerx/rpi-mqtt-elasticsearch:latest
    container_name: mqtt_elasticsearch
    hostname: mqtt-elasticsearch
    restart: always
    links:
      - mqtt
      - elasticsearch
    depends_on:
      - multiarch
      - mqtt
      - elasticsearch
    logging:
      driver: json-file
      options:
        max-size: "20k"

