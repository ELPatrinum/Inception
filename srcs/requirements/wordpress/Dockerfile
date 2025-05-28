FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-redis \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create the /var/www/html directory
RUN mkdir -p /var/www/html

# Download and extract WordPress directly to /var/www/html, then set ownership
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN mkdir -p /run/php && chown www-data:www-data /run/php

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]