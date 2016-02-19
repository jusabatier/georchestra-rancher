FROM tomcat:8-jre8

RUN apt-get update && apt-get install -y unzip libgdal1h libgdal-java

EXPOSE 8080

VOLUME  ["/etc/georchestra","/var/lib/georchestra"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
