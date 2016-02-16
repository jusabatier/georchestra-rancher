#!/bin/bash

set -e

if [ -e "/var/lib/georchestra/cas.war" ] ; then
  rm -rf /usr/local/tomcat/webapps/*
  cp /var/lib/georchestra/cas.war /usr/local/tomcat/webapps
fi
