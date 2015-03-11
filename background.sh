#!/bin/bash
sessionfile=`find "${HOME}/.dbus/session-bus/" -type f`
export `grep "DBUS_SESSION_BUS_ADDRESS" "${sessionfile}" | sed '/^#/d'`

if [ "$#" -ne 1 ]; then
    gsettings get org.gnome.desktop.background primary-color
else
    gsettings set org.gnome.desktop.background primary-color "#$1"
fi
