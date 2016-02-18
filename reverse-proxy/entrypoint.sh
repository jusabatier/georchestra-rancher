#!/bin/bash

set -e

if [ -e "/etc/georchestra/reverse-proxy/nginx.conf" ] ; then
  cp /etc/georchestra/reverse-proxy/nginx.conf /etc/nginx/conf.d/default.conf
  chmod a+r /etc/nginx/conf.d/default.conf
fi

if [ -d "/etc/georchestra/reverse-proxy/georchestra" ] ; then
  ln -s /etc/georchestra/reverse-proxy/georchestra /usr/share/nginx/georchestra
fi

exec "$@"
