#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/mapfishapp.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/mapfishapp.war /usr/local/tomcat/webapps
  chmod a+r /usr/local/tomcat/webapps/*.war
  mkdir -p /usr/local/tomcat/webapps/mapfishapp
  unzip -e /usr/local/tomcat/webapps/mapfishapp.war -d /usr/local/tomcat/webapps/mapfishapp
  rm -rf /usr/local/tomcat/webapps/mapfishapp/WEB-INF/lib/imageio-ext-gdalframework-*.jar
  cp /usr/share/java/gdal.jar /usr/local/tomcat/webapps/mapfishapp/WEB-INF/lib/gdal.jar
fi

/usr/local/tomcat/bin/catalina.sh run
