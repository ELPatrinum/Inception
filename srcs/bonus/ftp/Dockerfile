FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /home/${FTP_USER}/html && \
    chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}

EXPOSE 21

CMD echo "${FTP_USER}:$(cat /run/secrets/ftp_password)" | chpasswd && vsftpd /etc/vsftpd.conf