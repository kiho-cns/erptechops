# ERP TECHOPS TEAM Navigation

Single-page navigation for the ERP TECHOPS team.

## Deploy (EC2 + GitHub Actions)

This repo can be deployed to a Linux EC2 instance via GitHub Actions.

### GitHub Secrets (required)

- `EC2_HOST` - public IP or DNS of the EC2 instance
- `EC2_USER` - SSH user (example: `ubuntu`)
- `EC2_SSH_KEY` - private key with access to the EC2 instance
- `EC2_SSH_PORT` - optional, default is `22`

### One-time EC2 setup

Run the bootstrap script on the EC2 instance:

```bash
sudo bash deploy/ec2-bootstrap.sh
```

This installs Nginx, creates `/var/www/erptechops`, and enables the Nginx site.

### Deploy

Push to `main` and the workflow will upload `index.html` to `/var/www/erptechops`
and reload Nginx.

## Files

- `index.html`: main navigation page
- `.github/workflows/deploy-ec2.yml`: CI/CD workflow to EC2
- `deploy/nginx-erptechops.conf`: Nginx site config
- `deploy/ec2-bootstrap.sh`: EC2 setup script
