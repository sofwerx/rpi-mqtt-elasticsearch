FROM multiarch/debian-debootstrap:armhf-jessie

RUN apt-get update && apt-get install -y wget curl

RUN apt-get install -y python-pip
RUN pip install paho-mqtt elasticsearch

ADD mqtt-es.py .

CMD python mqtt-es.py
