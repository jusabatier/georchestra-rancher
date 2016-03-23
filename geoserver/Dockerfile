FROM tomcat:8-jre8

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
