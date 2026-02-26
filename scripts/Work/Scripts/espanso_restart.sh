#!/bin/bash

# Set environment variables
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus
export WAYLAND_DISPLAY=wayland-1

# Restart espanso
espanso restart >> /tmp/espanso_test.log 2>&1
