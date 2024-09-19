#!/bin/bash

# Copy .env.example to .env
cp .env.example .env

# Clear the .env file to avoid appending to existing content
> .env

# Read each variable from .env.example and prompt for input
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ ! -z "$line" && ! "$line" =~ ^# ]]; then
        var_name=$(echo "$line" | cut -d '=' -f 1)
        read -p "Enter value for $var_name (default: ${line#*=}): " value
        # Use default value if no input is provided
        echo "$var_name=${value:-${line#*=}}" >> .env
    fi
done < .env.example

# Run docker-compose
docker compose up -d