set -euo pipefail
echo "🔐 Hardening ..."

# SSH
sudo sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# UFW firewall
sudo ufw allow OpenSSH
sudo ufw allow 30000:32767/tcp
sudo ufw --force enable

# Docker socket
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

echo "✅ Harden done."
