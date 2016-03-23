FROM tomcat:8-jre8

ADD https://jdbc.postgresql.org/download/postgresql-9.4.1207.jar /usr/local/tomcat/lib/postgresql-9.4.1207.jar

EXPOSE 8080

VOLUME  ["/etc/georchestra","/var/lib/georchestra","/opt/geowebcache_datadir"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
