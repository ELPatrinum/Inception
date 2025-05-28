FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

COPY ./site /var/www/static

RUN chown -R www-data:www-data /var/www/static

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]