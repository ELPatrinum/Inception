FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz && \
    tar -xzf prometheus-2.37.0.linux-amd64.tar.gz -C /usr/local/bin --strip-components=1 && \
    rm prometheus-2.37.0.linux-amd64.tar.gz

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

RUN mkdir -p /prometheus && chown -R nobody:nogroup /prometheus

EXPOSE 9090

USER nobody

CMD ["/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus"]