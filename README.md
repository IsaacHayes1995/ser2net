# ser2net
Provides docker images isaachayes1995/ser2net for use as DSRM to tcp adapter.

The docker images are based on debian buster and are generated for all platforms at Dockerhub isaachayes1995/ser2net

The image has a default configuration file included that exposes tcp port `3333` and binds `/dev/tty/USB0` with baudrate of `115200`, `1` stopbit no parity and `8` data bits.

This version of ser2net allows multiple simultaneous tcp connections (3 max).

To override the config file bind it to `/etc/ser2net.yaml`. A `docker-compose.yml` is included to help starting up the container.
If you want to use docker run you could start a container using:
`docker run -it -d -p 3333:3333 --device /dev/ttyUSB0:/dev/ttyUSB0 --name ser2net --restart always jbouwh/ser2net:latest`

This repository does not maintain the ser2net sourcecode. The sourcecode can be found here: https://sourceforge.net/projects/ser2net/
