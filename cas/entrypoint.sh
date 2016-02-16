#!/bin/bash

set -e

cp /imports/wars/cas.war /usr/local/tomcat/webapps/cas.war
chmod a+r /usr/local/tomcat/webapps/*.war
