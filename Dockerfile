FROM buildpack-deps:buster
RUN echo "deb http://ftp.debian.org/debian buster contrib" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y vice=3.3
COPY rom/C64/* /usr/lib/vice/C64/
COPY rom/DRIVES/* /usr/lib/vice/DRIVES/
