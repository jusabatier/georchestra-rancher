#!/bin/bash

set -e

cp /imports/wars/ROOT.war /usr/local/tomcat/webapps/ROOT.war
chmod a+r /usr/local/tomcat/webapps/*.war
