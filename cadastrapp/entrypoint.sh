#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/cas.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/cas.war /usr/local/tomcat/webapps
  chmod a+r /usr/local/tomcat/webapps/*.war
fi

if [ -e "/var/lib/georchestra/tc-cadastrapp/context.xml" ] ; then
  cp /var/lib/georchestra/tc-cadastrapp/context.xml /usr/local/tomcat/conf/
  chmod a+r /usr/local/tomcat/conf/context.xml
fi

/usr/local/tomcat/bin/catalina.sh run
