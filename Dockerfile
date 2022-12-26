FROM buildpack-deps:bullseye
RUN echo "deb http://ftp.debian.org/debian bullseye contrib" >> /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y zip
RUN apt-get install -y flex byacc dos2unix xa65 libsdl-image1.2-dev
WORKDIR /c64libci
# Vice
RUN mkdir vice && wget --quiet -P vice https://sourceforge.net/projects/vice-emu/files/releases/vice-3.7.1.tar.gz/download && mv vice/download vice/vice-3.7.1.tar.gz
RUN cd vice && tar xzf vice-3.7.1.tar.gz
RUN cd vice/vice-3.7.1 && ./configure --disable-pdf-docs
RUN cd vice/vice-3.7.1 && make
RUN cd vice/vice-3.7.1 && make install
# Exomizer
RUN git clone https://bitbucket.org/magli143/exomizer.git && cd exomizer && git checkout 3.1.1
RUN cd exomizer/src && make build
RUN cp exomizer/src/exomizer /usr/bin/
# GoatTracker
RUN mkdir goattracker && wget --quiet -P goattracker https://sourceforge.net/projects/goattracker2/files/GoatTracker%202/2.74/GoatTracker_2.74.zip/download
RUN cd goattracker && unzip download
RUN cd goattracker/src && make ../linux/gt2reloc
RUN cd goattracker/linux && ls -al && cp gt2reloc /usr/bin
