#!/bin/bash

# Create secrets directory if it doesn't exist
mkdir -p ./srcs/secrets

# Function to generate a random 16-character password
generate_password() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1
}

# Generate and write random passwords to secret files
echo "$(generate_password)" > ./srcs/secrets/db_root_password
echo "$(generate_password)" > ./srcs/secrets/db_user_password
echo "$(generate_password)" > ./srcs/secrets/wp_admin_password
echo "$(generate_password)" > ./srcs/secrets/ftp_password

# Set appropriate permissions for secrets files
chmod 600 ./srcs/secrets/db_root_password
chmod 600 ./srcs/secrets/db_user_password
chmod 600 ./srcs/secrets/wp_admin_password
chmod 600 ./srcs/secrets/ftp_password

echo "Secrets generated successfully in ./srcs/secrets"