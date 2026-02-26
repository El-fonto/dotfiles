#!/bin/bash
CHROMIUM_THEME=~/.config/omarchy/current/theme/chromium.theme

# Run only if at least one supported browser exists
if omarchy-cmd-present chromium || omarchy-cmd-present helium-browser || omarchy-cmd-present brave; then
  # Resolve theme color (RGB + HEX) from Omarchy theme file, or fall back to neutral gray
  if [[ -f $CHROMIUM_THEME ]]; then
    THEME_RGB_COLOR=$(<"$CHROMIUM_THEME")
    THEME_HEX_COLOR=$(printf '#%02x%02x%02x' ${THEME_RGB_COLOR//,/ })
  else
    THEME_RGB_COLOR="28,32,39"
    THEME_HEX_COLOR="#1c2027"
  fi

  # Light/dark detection used for Chromium & Helium
  if [[ -f ~/.config/omarchy/current/theme/light.mode ]]; then
    COLOR_SCHEME="light"
  else
    COLOR_SCHEME="dark"
  fi

  # Chromium (system chromium, using CLI flags)
  if omarchy-cmd-present chromium; then
    rm -f /etc/chromium/policies/managed/color.json

    chromium --no-startup-window --set-theme-color="$THEME_RGB_COLOR" >/dev/null
    chromium --no-startup-window --set-color-scheme="$COLOR_SCHEME" >/dev/null
  fi

  # Helium (Chromium-based, launched via wrapper "helium-browser")
  # Executable path is /opt/helium-browser-bin/chrome with its own profile at
  # ~/.config/net.imput.helium, but you control it through the helium-browser wrapper. [web:39][web:40]
  if omarchy-cmd-present helium-browser; then
    helium-browser --no-startup-window --set-theme-color="$THEME_RGB_COLOR" >/dev/null
    helium-browser --no-startup-window --set-color-scheme="$COLOR_SCHEME" >/dev/null
  fi

  # Brave (uses enterprise policy file for theme color)
  if omarchy-cmd-present brave; then
    echo "{\"BrowserThemeColor\": \"$THEME_HEX_COLOR\"}" \
      | tee "/etc/brave/policies/managed/color.json" >/dev/null
    brave --refresh-platform-policy --no-startup-window >/dev/null
  fi
fi
