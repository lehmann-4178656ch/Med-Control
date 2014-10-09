#!/bin/bash
sessionfile=`find "${HOME}/.dbus/session-bus/" -type f`
export `grep "DBUS_SESSION_BUS_ADDRESS" "${sessionfile}" | sed '/^#/d'`
gsettings set org.gnome.desktop.background primary-color "#$1"
