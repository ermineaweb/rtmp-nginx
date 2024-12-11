FROM tiangolo/nginx-rtmp

COPY server/nginx/nginx.conf /etc/nginx/nginx.conf
COPY server/nginx/index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]