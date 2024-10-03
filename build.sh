#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

# cockpit extensions
rpm-ostree install cockpit-files

# get incus copr
curl -Lo /etc/yum.repos.d/ganto-lxc4-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/ganto/lxc4/repo/fedora-"${RELEASE}"/ganto-lxc4-fedora-"${RELEASE}".repo

# umoci copr
curl -Lo /etc/yum.repos.d/ganto-umoci-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/ganto/umoci/repo/fedora-"${RELEASE}"/ganto-umoci-fedora-"${RELEASE}".repo

#### Example for enabling a System Unit File

systemctl disable podman.socket
systemctl enable docker.socket
systemctl enable docker.service
