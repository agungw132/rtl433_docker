# Tap Weather Station's Outdoor Data using RTL_433 and stream data to MQTT broker

## Attach the RTL-SDR dongle 
First, find the RTL-SDR dongle usb bus address using lsusb,
```
Bus 002 Device 003: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838 DVB-T
```

## How to use it
```
docker run -d --name rtl433 --device /dev/bus/usb/002/003 -e MQTT_HOST=<host_ip_address> -e MQTT_PORT=<port> -e MQTT_USER=<username> -e MQTT_PASSWORD=<password> -e MQTT_TOPIC=<topic> -e FREQUENCY=<frequency> -e DEVICE=<device_number> agungw132/rtl433_docker
```
