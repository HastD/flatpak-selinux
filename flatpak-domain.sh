#!/usr/bin/env bash

echo "Building and Loading Policy"

set -x

make -f /usr/share/selinux/devel/Makefile flatpak-domain.pp || exit
/usr/sbin/semodule -i flatpak-domain.pp

/sbin/restorecon -FRiv /usr/bin /usr/libexec /var/lib/flatpak
/sbin/restorecon -FRiv /home/*/.local/share/flatpak /home/*/.cache/flatpak /home/*/.var
/sbin/restorecon -FRiv /root/.local/share/flatpak /root/.cache/flatpak /root/.var
/sbin/restorecon -FRiv /run/user/*/{app,.flatpak,.flatpak-helper}
