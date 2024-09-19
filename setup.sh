#!/bin/bash

# Clear the .env file to avoid appending to existing content
> .env

# Prompt for all required environment variables and save them to .env file
read -p "Enter value for POSTGRES_PASSWORD: " POSTGRES_PASSWORD
echo "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" >> .env

read -p "Enter value for POSTGRES_DB (default: nextcloud): " POSTGRES_DB
POSTGRES_DB=${POSTGRES_DB:-nextcloud}
echo "POSTGRES_DB=${POSTGRES_DB}" >> .env

read -p "Enter value for POSTGRES_USER (default: nextcloud): " POSTGRES_USER
POSTGRES_USER=${POSTGRES_USER:-nextcloud}
echo "POSTGRES_USER=${POSTGRES_USER}" >> .env

read -p "Enter value for NEXTCLOUD_PORT (default: 80): " NEXTCLOUD_PORT
NEXTCLOUD_PORT=${NEXTCLOUD_PORT:-80}
echo "NEXTCLOUD_PORT=${NEXTCLOUD_PORT}" >> .env

read -p "Enter value for NEXTCLOUD_DATA_DIR (default: /path/to/nextcloud/data): " NEXTCLOUD_DATA_DIR
NEXTCLOUD_DATA_DIR=${NEXTCLOUD_DATA_DIR:-/path/to/nextcloud/data}
echo "NEXTCLOUD_DATA_DIR=${NEXTCLOUD_DATA_DIR}" >> .env

read -p "Enter value for NEXTCLOUD_EXTERNAL_DIR (default: /path/to/external/drive): " NEXTCLOUD_EXTERNAL_DIR
NEXTCLOUD_EXTERNAL_DIR=${NEXTCLOUD_EXTERNAL_DIR:-/path/to/external/drive}
echo "NEXTCLOUD_EXTERNAL_DIR=${NEXTCLOUD_EXTERNAL_DIR}" >> .env

read -p "Enter value for POSTGRES_PORT (default: 5432): " POSTGRES_PORT
POSTGRES_PORT=${POSTGRES_PORT:-5432}
echo "POSTGRES_PORT=${POSTGRES_PORT}" >> .env

read -p "Enter value for POSTGRES_DATA_DIR (default: /path/to/postgres/data): " POSTGRES_DATA_DIR
POSTGRES_DATA_DIR=${POSTGRES_DATA_DIR:-/path/to/postgres/data}
echo "POSTGRES_DATA_DIR=${POSTGRES_DATA_DIR}" >> .env

# Run docker-compose
docker compose up -d