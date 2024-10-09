#!/usr/bin/bash

set -ouex pipefail

# Starship Shell Prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
# shellcheck disable=SC2016
echo 'eval "$(starship init bash)"' >> /etc/bashrc

# cockpit extensions
rpm-ostree install cockpit-files
git clone https://github.com/45drives/cockpit-zfs-manager.git
cp -r cockpit-zfs-manager/zfs /usr/share/cockpit
rm -rf cockpit-zfs-manager