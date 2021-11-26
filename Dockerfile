FROM buildpack-deps:buster
RUN echo "deb http://ftp.debian.org/debian buster contrib" >> /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y vice=3.3.0.dfsg-2
RUN apt source -y goattracker=2.74+dfsg1-1
WORKDIR /c64libci
COPY rom/C64/* /usr/lib/vice/C64/
COPY rom/DRIVES/* /usr/lib/vice/DRIVES/
RUN git clone https://bitbucket.org/magli143/exomizer.git && cd exomizer && git checkout 3.1.1
RUN cd exomizer/src && make build
RUN cp exomizer/src/exomizer /usr/bin/
