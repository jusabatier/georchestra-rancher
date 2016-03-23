FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes oracle-java8-installer
RUN DEBIAN_FRONTEND=noninteractive apt-get install oracle-java8-set-default
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
  05AB33110949707C93A279E3D3EFE6B686867BA6 \
  07E48665A34DCAFAE522E5E6266191C37C037D42 \
  47309207D818FFD8DCD3F83F1931D684307A10A5 \
  541FBE7D8F78B25E055DDEE13C370389288584E7 \
  61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
  713DA88BE50911535FE716F5208B0AB1D63011C7 \
  79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
  9BA44C2621385CB966EBA586F72C284D731FABEE \
  A27677289986DB50844682F8ACB77FC2E86E29AC \
  A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
  DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
  F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
  F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.30
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN set -x \
  && wget "$TOMCAT_TGZ_URL" -O tomcat.tar.gz \
  && wget "$TOMCAT_TGZ_URL.asc" -O tomcat.tar.gz.asc \
  && gpg --verify tomcat.tar.gz.asc \
  && tar -xvf tomcat.tar.gz --strip-components=1 \
  && rm bin/*.bat \
  && rm tomcat.tar.gz*

RUN echo "deb http://ftp.fr.debian.org/debian jessie contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ jessie/updates contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y unzip libjai-core-java libjai-imageio-core-java ttf-mscorefonts-installer libgdal1h libgdal-java gdal-bin

ADD http://downloads.sourceforge.net/project/libjpeg-turbo/1.4.0/libjpeg-turbo-official_1.4.0_amd64.deb?use_mirror=tenet /tmp/libjpeg-turbo-official_1.4.0_amd64.deb
RUN dpkg -i /tmp/libjpeg-turbo-official_1.4.0_amd64.deb

ADD https://github.com/bourgesl/marlin-renderer/releases/download/v0.7.3.2_2/marlin-0.7.3.2-Unsafe.jar /usr/share/java/marlin.jar

RUN ln -s /usr/share/java/jai_core.jar /usr/local/tomcat/lib/jai_core.jar
RUN ln -s /usr/share/java/jai_codec.jar /usr/local/tomcat/lib/jai_codec.jar
RUN ln -s /usr/share/java/mlibwrapper_jai.jar /usr/local/tomcat/lib/mlibwrapper_jai.jar
RUN ln -s /usr/share/java/jai_imageio.jar /usr/local/tomcat/lib/jai_imageio.jar
RUN ln -s /usr/share/java/clibwrapper_jiio.jar /usr/local/tomcat/lib/clibwrapper_jiio.jar

ADD https://jdbc.postgresql.org/download/postgresql-9.4.1207.jar /usr/local/tomcat/lib/postgresql-9.4.1207.jar

EXPOSE 8080

VOLUME  ["/etc/georchestra","/var/lib/georchestra","/opt/geoserver_datadir"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh