# The Default config for ser2net is included in the image
# It connects to serial device /dev/ttyUSB0 and is optimised for a DSMR 4 or 5 compliant Slimme Meter

FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ser2net=4.3.11-1 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -r -M -d /usr/share/ser2net -G dialout ser2net

COPY ser2net.yaml /etc/ser2net/ser2net.yaml

USER ser2net

CMD echo -n "Starting " && ser2net -v && ser2net -d 
