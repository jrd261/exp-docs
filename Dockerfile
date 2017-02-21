FROM nginx:1.11.10

EXPOSE 80

COPY _site/ /usr/share/nginx/html