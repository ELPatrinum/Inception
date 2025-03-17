#!/bin/sh

# Ensure environment variables are set
if [ -z "$ftp_user" ] || [ -z "$ftp_pwd" ]; then
    echo "Error: ftp_user and ftp_pwd environment variables must be set."
    exit 1
fi

# Add the FTP user
adduser --gecos "" --disabled-password "$ftp_user" || exit 1
echo "$ftp_user:$ftp_pwd" | chpasswd || exit 1

# Create the FTP directory and set permissions
mkdir -p /home/"$ftp_user"/ftp || exit 1
chown -R "$ftp_user:$ftp_user" /home/"$ftp_user"/ftp || exit 1

# Configure vsftpd for the user
echo "user_sub_token=$ftp_user" >> /etc/vsftpd.conf || exit 1
echo "local_root=/home/$ftp_user/ftp" >> /etc/vsftpd.conf || exit 1
echo "$ftp_user" | tee -a /etc/vsftpd.userlist || exit 1

# Start vsftpd
exec "$@"
