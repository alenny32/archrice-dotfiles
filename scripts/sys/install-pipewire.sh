#!/bin/sh

# Script to switch from pulseaudio to pipewire.
# Run this script as root.

# Remove pulseaudio and all packages depends on it first, then
# install pipewire and all of uninstalled packages.

## Elevating privilege
# chusr="sudo"
# chusr="doas"

pacman -Rns \
    pulseaudio-alsa \
    pulseaudio-bluetooth \
    pulseaudio-jack \
    pulsemixer \
    pulseaudio-equalizer \
    pulseaudio-equalizer-ladspa \
    pulseaudio \
    gnome-bluetooth \
    blueberry \
    blueman \
    volumeicon \
    pavucontrol

pacman -S --needed \
    pipewire \
    pipewire-media-session \
    pipewire-alsa \
    pipewire-zeroconf \
    pipewire-pulse \
    blueman \
    volumeicon \
    pavucontrol

    # pipewire-jack \ # not needed if jack (jack2, jack2-dbus) is installed

echo "Reboot now"
