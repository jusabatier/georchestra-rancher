FROM tomcat:8-jre8

EXPOSE 8080

VOLUME  ["/etc/georchestra","/var/lib/georchestra"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
