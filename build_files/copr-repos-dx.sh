#!/usr/bin/bash

set -ouex pipefail

#incus, lxc, lxd
curl -Lo /etc/yum.repos.d/ganto-lxc4-fedora-"${FEDORA_MAJOR_VERSION}".repo https://copr.fedorainfracloud.org/coprs/ganto/lxc4/repo/fedora-"${FEDORA_MAJOR_VERSION}"/ganto-lxc4-fedora-"${FEDORA_MAJOR_VERSION}".repo

#umoci
curl -Lo /etc/yum.repos.d/ganto-umoci-fedora-"${FEDORA_MAJOR_VERSION}".repo https://copr.fedorainfracloud.org/coprs/ganto/umoci/repo/fedora-"${FEDORA_MAJOR_VERSION}"/ganto-umoci-fedora-"${FEDORA_MAJOR_VERSION}".repo


# Renenable RPMFusion
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free.repo
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free-updates.repo
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free-updates-testing.repo
