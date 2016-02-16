FROM tomcat:8-jre8

ENV JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms512m -Xmx512m -Dgeorchestra.datadir=/imports/georchestra_datadir"

RUN rm -rf /usr/local/tomcat/webapps/*

EXPOSE 8080

VOLUME  ["/imports"]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
