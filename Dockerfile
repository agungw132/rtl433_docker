FROM debian:latest
MAINTAINER Agung Wahyudi <agung.wahyudi@gmail.com>

RUN apt-get update
RUN apt-get install -yq git libtool libusb-1.0.0-dev librtlsdr-dev rtl-sdr cmake automake mosquitto-clients
RUN git clone https://github.com/merbanan/rtl_433.git

COPY build.sh .

# Build rtl_433
RUN ./build.sh

ARG MQTT_HOST
ARG MQTT_USER
ARG MQTT_PASSWORD
ARG MQTT_PORT
ARG MQTT_TOPIC
ARG FREQUENCY
ARG DEVICE

ENTRYPOINT rtl_433 -f $FREQUENCY -R $DEVICE -F json | mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PASSWORD -t $MQTT_TOPIC -l

