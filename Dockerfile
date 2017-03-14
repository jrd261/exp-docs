FROM nginx:1.11.10

COPY nginx.conf /etc/nginx/nginx.conf
COPY _site/ /usr/share/nginx/html

EXPOSE 8001
