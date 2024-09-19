# Nextcloud with PostgreSQL Docker Setup on Raspberry Pi

This repository provides a comprehensive Docker setup for deploying Nextcloud alongside a PostgreSQL database on a Raspberry Pi. It also includes configurations for utilizing an external drive for efficient data storage.

## Prerequisites

- A Raspberry Pi running Raspberry Pi OS
- Docker installed
- Docker Compose installed

## Getting Started

0. First, ensure that Docker and Docker Compose are installed on your Raspberry Pi.
   For installation instructions, refer to the official guide: ![Installation steps for Raspberry Pi](https://docs.docker.com/engine/install/raspberry-pi-os/)

1. Clone this repository to your Raspberry Pi using the following command:

   # Start Generation Here

   ```bash
   git clone https://github.com/enkhbold470/nextcloud_rpi.git
   cd nextcloud_rpi
   ```

2. In the cloned directory, create a `.env` file to securely store sensitive information. You can use the following template as a starting point:

   ```
   POSTGRES_PASSWORD=your_password
   POSTGRES_DB=nextcloud
   POSTGRES_USER=nextcloud
   NEXTCLOUD_PORT=80
   NEXTCLOUD_DATA_DIR=/path/to/nextcloud/data
   NEXTCLOUD_EXTERNAL_DIR=/path/to/external/drive
   POSTGRES_PORT=5432
   POSTGRES_DATA_DIR=/path/to/postgres/data
   ```

3. Modify the volume paths in the `docker-compose.yaml` file to reflect the location of your desired external drive. Ensure that the external drive is properly mounted on your Raspberry Pi.

```bash
docker exec -u 33 -it nextcloud php occ config:system:set trusted_domains 1 --value=<local_ip_address>
```

## Running the Application

To launch the application, execute the following command in the root directory of the project:

```bash
docker-compose up -d
```
