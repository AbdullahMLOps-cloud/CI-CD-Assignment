
#!/bin/bash

# Stop if any command fails
set -e

echo "Installing Nginx..."
sudo apt update
sudo apt install nginx -y

echo "Configuring Nginx..."
sudo tee /etc/nginx/sites-available/hostinfo > /dev/null <<'EOF'
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
EOF

echo "Enabling Nginx configuration..."
sudo ln -sfn /etc/nginx/sites-available/hostinfo /etc/nginx/sites-enabled/hostinfo
sudo rm -f /etc/nginx/sites-enabled/default

echo "Testing Nginx configuration..."
sudo nginx -t

echo "Starting Nginx..."
sudo systemctl enable --now nginx
sudo systemctl reload nginx

echo "Nginx setup completed successfully!"
