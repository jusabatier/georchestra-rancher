#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/ROOT.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/ROOT.war /usr/local/tomcat/webapps/ROOT.war
  chmod a+r /usr/local/tomcat/webapps/*.war
fi

/usr/local/tomcat/bin/catalina.sh run
