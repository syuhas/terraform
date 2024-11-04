#!/bin/bash



INSTANCE_PUBLIC_IP="${PUBLIC_DNS}"
REMOTE_USER="${USER}"

if [ -z "$INSTANCE_PUBLIC_DNS" || -z "$REMOTE_USER"]; then
    echo "Could not find DNS or user for SSH connection"
    exit 1
fi

echo "Remote user: {$REMOTE_USER}"
echo "Instance DNS: {$INSTANCE_PUBLIC_DNS}"

echo "Copying project files to remote server..."
scp -o StrictHostKeyChecking=no -r ./src "$REMOTE_USER@$INSTANCE_PUBLIC_DNS:/tmp"

echo "Connecting to remote server via SSH..."

# Copy the build artifact to the remote server
ssh -o StrictHostKeyChecking=no "$REMOTE_USER@$INSTANCE_PUBLIC_DNS" << EOF
    sudo dnf install httpd -y
    sudo cp -r /tmp/src /var/www/html
    sudo systemctl start httpd
    sudo systemctl enable httpd
EOF

echo "Deployment complete!"
    

