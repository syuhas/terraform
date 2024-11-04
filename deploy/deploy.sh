#!/bin/bash

# Fetch instance IP from Jenkins environment variable
# INSTANCE_PUBLIC_IP="${INSTANCE_PUBLIC_DNS}"
REMOTE_USER="${USER}"

echo ${WORKSPACE}

# if [ -z "$INSTANCE_PUBLIC_DNS" || -z "$REMOTE_USER"]; then
#     echo "Could not find DNS or user for SSH connection"
#     exit 1
# fi

# echo "Remote user: {$REMOTE_USER}"
# echo "Instance DNS: {$INSTANCE_PUBLIC_DNS}"

# echo "Connecting to remote server via SSH..."

# # Copy the build artifact to the remote server
# ssh -o StrictHostKeyChecking=no "$REMOTE_USER@$INSTANCE_PUBLIC_DNS" << EOF
#     sudo dnf install httpd -y


