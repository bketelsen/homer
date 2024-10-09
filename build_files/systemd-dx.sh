#!/usr/bin/bash

set -ouex pipefail
systemctl enable tailscaled.service
systemctl --global enable podman-auto-update.timer
systemctl enable docker.socket
systemctl enable podman.socket
systemctl enable swtpm-workaround.service
systemctl enable libvirt-workaround.service
systemctl enable homer-groups.service

