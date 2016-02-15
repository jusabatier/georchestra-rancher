FROM tomcat:8-jre8

ENV JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms512m -Xmx512m -Dgeorchestra.datadir=/imports/georchestra_datadir"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY /imports/wars/ROOT.war /usr/local/tomcat/webapps/ROOT.war
RUN chmod a+r /usr/local/tomcat/webapps/*.war

EXPOSE 8080

VOLUME  ["/imports"]
