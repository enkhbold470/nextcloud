#!/bin/bash

# Copy .env.example to .env
cp .env.example .env

# Read each variable from .env.example and prompt for input
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ ! -z "$line" && ! "$line" =~ ^# ]]; then
        var_name=$(echo "$line" | cut -d '=' -f 1)
        read -p "Enter value for $var_name: " value
        # Save the variable to .env
        echo "$var_name=$value" >> .env
    fi
done < .env.example

# Run docker-compose
docker-compose up -d
