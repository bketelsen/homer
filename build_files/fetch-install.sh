#!/usr/bin/bash

set -ouex pipefail

# Starship Shell Prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
# shellcheck disable=SC2016
echo 'eval "$(starship init bash)"' >> /etc/bashrc

# cockpit extensions
rpm-ostree install cockpit-files cockpit-machines cockpit-networkmanager cockpit-ostree cockpit-pcp cockpit-podman cockpit-selinux cockpit-storaged cockpit-system
git clone https://github.com/45drives/cockpit-zfs-manager.git
cp -r cockpit-zfs-manager/zfs /usr/share/cockpit
rm -rf cockpit-zfs-manager

mkdir -p /usr/share/cockpit/base1/fonts/
wget -O /usr/share/cockpit/base1/fonts/fontawesome.woff https://github.com/h5p/font-awesome/raw/master/fontawesome-webfont.woff 
wget -O /usr/share/cockpit/base1/fonts/glyphicons.woff https://github.com/twbs/bootstrap-sass/raw/master/assets/fonts/bootstrap/glyphicons-halflings-regular.woff 
wget -O /usr/share/cockpit/base1/fonts/patternfly.woff https://github.com/patternfly/patternfly-sass/raw/master/assets/fonts/patternfly/PatternFlyIcons-webfont.woff
wget -P /usr/share/cockpit/static/fonts https://github.com/braintree/braintree_slim_example/raw/main/static/fonts/open-sans/OpenSans-Semibold-webfont.woff
mkdir -p /usr/share/cockpit/zfs/assets/fonts/RedHatDisplay/
cp -v /usr/share/cockpit/static/fonts/*Display*.woff2 /usr/share/cockpit/zfs/assets/fonts/RedHatDisplay/
for f in /usr/share/cockpit/zfs/assets/fonts/RedHatDisplay/*; do mv -v -- "$f" "${f%.woff2}.woff"; done
mkdir -p /usr/share/cockpit/zfs/assets/fonts/RedHatText/
cp -v /usr/share/cockpit/static/fonts/*Text*.woff2 /usr/share/cockpit/zfs/assets/fonts/RedHatText/
for f in /usr/share/cockpit/zfs/assets/fonts/RedHatText/*; do mv -v -- "$f" "${f%.woff2}.woff"; done