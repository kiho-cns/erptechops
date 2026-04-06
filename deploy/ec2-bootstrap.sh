#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root: sudo bash deploy/ec2-bootstrap.sh"
  exit 1
fi

apt-get update -y
apt-get install -y nginx

mkdir -p /var/www/erptechops
chown -R www-data:www-data /var/www/erptechops

cp -f deploy/nginx-erptechops.conf /etc/nginx/sites-available/erptechops
ln -sf /etc/nginx/sites-available/erptechops /etc/nginx/sites-enabled/erptechops

rm -f /etc/nginx/sites-enabled/default

nginx -t
systemctl enable nginx
systemctl restart nginx

echo "Nginx is configured. Deployments will publish to /var/www/erptechops."
