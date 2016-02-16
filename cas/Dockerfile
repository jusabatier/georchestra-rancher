FROM tomcat:8-jre8

ENV JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms512m -Xmx512m -Dgeorchestra.datadir=/imports/datadir"

EXPOSE 8080

VOLUME  ["/etc/georchestra","/usr/local/tomcat/webapps","/usr/local/tomcat/logs"]
