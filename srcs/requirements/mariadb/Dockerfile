FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/init.sql /docker-entrypoint-initdb.d/init.sql

RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]