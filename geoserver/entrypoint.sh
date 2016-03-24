#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/geoserver.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/geoserver.war /usr/local/tomcat/webapps
  chmod a+r /usr/local/tomcat/webapps/*.war
  mkdir -p /usr/local/tomcat/webapps/geoserver
  unzip -e /usr/local/tomcat/webapps/geoserver.war -d /usr/local/tomcat/webapps/geoserver
  rm -rf /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/imageio-ext-gdal-bindings-*.jar
  cp /usr/share/java/gdal.jar /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/gdal.jar
fi

if [ -e "/etc/georchestra/geoserver/context.xml" ] ; then
  cp /etc/georchestra/geoserver/context.xml /usr/local/tomcat/conf/context.xml
fi

if [ -e "/etc/georchestra/geoserver/server.xml" ] ; then
  cp /etc/georchestra/geoserver/server.xml /usr/local/tomcat/conf/server.xml
fi

/usr/local/tomcat/bin/catalina.sh run
