#!/bin/bash

# Fetch instance IP from Jenkins environment variable
# INSTANCE_PUBLIC_IP="${INSTANCE_PUBLIC_DNS}"
REMOTE_USER="${USER}"

# if [ -z "$INSTANCE_PUBLIC_DNS" || -z "$REMOTE_USER"]; then
#     echo "Could not find DNS or user for SSH connection"
#     exit 1
# fi

if [ -z "$REMOTE_USER"]; then
    echo "Could not find DNS or user for SSH connection"
    exit 1
fi

echo $REMOTE_USER

# echo $INSTANCE_PUBLIC_DNS

