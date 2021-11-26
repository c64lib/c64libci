FROM buildpack-deps:buster
RUN echo "deb http://ftp.debian.org/debian buster contrib" >> /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y vice=3.3.0.dfsg-2
RUN apt-get install -y libsdl2-2.0-0
RUN apt-get install -y libsdl2-dev
RUN sdl-config --cflags
RUN sdl-config --libs
# RUN apt source -y goattracker=2.74+dfsg1-1
WORKDIR /c64libci
COPY rom/C64/* /usr/lib/vice/C64/
COPY rom/DRIVES/* /usr/lib/vice/DRIVES/
# Exomizer
RUN git clone https://bitbucket.org/magli143/exomizer.git && cd exomizer && git checkout 3.1.1
RUN cd exomizer/src && make build
RUN cp exomizer/src/exomizer /usr/bin/
# GoatTracker
RUN wget https://sourceforge.net/projects/goattracker2/files/GoatTracker%202/2.74/GoatTracker_2.74.zip/download
RUN ls -al
RUN unzip download
RUN ls -al
RUN cd src/bme && make && ls -al
RUN cd src && make ../linux/gt2reloc
RUN cd linux && ls -al
