FROM tomcat:8-jre8

ENV JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms512m -Xmx512m -Dgeorchestra.datadir=/imports/datadir"

EXPOSE 8080

VOLUME  ["/etc/georchestra","/var/lib/georchestra"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
