#!/bin/bash

set -v

if [ -e "/var/lib/georchestra/cas.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/cas.war /usr/local/tomcat/webapps
  chmod a+r /usr/local/tomcat/webapps/*.war
fi

echo "$@"
exec "$@"
