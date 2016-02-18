FROM nginx:latest

RUN sed -i -e "s/worker_processes 4;/worker_processes $(nproc);/g" /etc/nginx/nginx.conf
RUN sed -i -e "s/worker_connections 768;/worker_connections $(ulimit -n);/g" /etc/nginx/nginx.conf

EXPOSE 80 443

VOLUME ["/etc/georchestra"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
