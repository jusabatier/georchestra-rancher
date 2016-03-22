#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/analytics.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/analytics.war /usr/local/tomcat/webapps
  chmod a+r /usr/local/tomcat/webapps/*.war
fi

/usr/local/tomcat/bin/catalina.sh run
