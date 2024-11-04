#!/bin/bash

# Fetch instance IP from Jenkins environment variable

REMOTE_USER="${REMOTE_USER}"

if ["$REMOTE_USER"]; then
    echo "Could not find DNS or user for SSH connection"
    exit 1
fi

echo $REMOTE_USER


