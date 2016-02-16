#!/bin/bash

set -e

rm -rf /usr/local/tomcat/logs
ln -s /imports/logs/cas /usr/local/tomcat/logs
cp /imports/wars/cas.war /usr/local/tomcat/webapps/cas.war
chmod a+r /usr/local/tomcat/webapps/*.war
