#!/usr/bin/bash
# shellcheck disable=SC1091

set -ouex pipefail

# Apply IP Forwarding before installing Docker to prevent messing with LXC networking
#sysctl -p

cp /ctx/packages.json /tmp/packages.json
rsync -rvK /ctx/system_files/dx/ /

# /ctx/build_files/packages-dx.sh
/ctx/build_files/copr-repos-dx.sh

rpm-ostree install incus
/ctx/build_files/fetch-install.sh
/ctx/build_files/workarounds.sh
/ctx/build_files/systemd-dx.sh
/ctx/build_files/cleanup.sh
/ctx/build_files/cleanup-dx.sh
