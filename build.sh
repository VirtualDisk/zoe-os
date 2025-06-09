#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

update-ca-trust
restorecon -vFr /usr/local/share/fonts/meslo
fc-cache -v

# this installs a package from fedora repos
rpm-ostree install screen \
  podman-docker

rpm-ostree install \
  git \
  wget \
  jq \
  cabextract \
  freetype.i686 \
  freetype.x86_64 \
  libXcomposite.i686 \
  libXcomposite.x86_64 \
  libXcursor.i686 \
  libXcursor.x86_64 \
  libXfixes.i686 \
  libXfixes.x86_64 \
  libXi.i686 \
  libXi.x86_64 \
  libXrandr.i686 \
  libXrandr.x86_64 \
  pulseaudio-libs.i686 \
  pulseaudio-libs.x86_64 \
  vulkan-loader.i686 \
  vulkan-loader.x86_64
# this would install a package from rpmfusion
# rpm-ostree install vlc

git clone https://github.com/B00merang-Project/Windows-Vista.git /usr/theme/b00merang-vista

#### Example for enabling a System Unit File

mkdir -p /var/data/ollama
mkdir -p /var/data/localai
systemctl enable podman.socket
# systemctl enable prometheus-nvidia-exporter.service
systemctl enable prometheus-node-exporter.service
systemctl enable beszel.service
systemctl enable discord-boot-notifier.service
