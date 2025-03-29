#!/bin/bash
# SOWM-GREEN install script, modified by mrgreen 
#
# Version 0.1


set -e

XINITRC="$HOME/.xinitrc"


# Build and install sowm locally
make clean >/dev/null 2>&1
make >/dev/null 2>&1


# Ensure required packages are installed
sudo pacman -Sy --needed alacritty dmenu feh

# Set wallpaper path based on repo location
WALLPAPER_PATH="$HOME/$(basename "$(pwd)")/wallpaper.jpg"
XINITRC="$HOME/.xinitrc"

# Backup existing .xinitrc and write a new one
if [ -f "$XINITRC" ]; then
  TIMESTAMP=$(date +%Y%m%d-%H%M%S)
  cp "$XINITRC" "$XINITRC.bak-$TIMESTAMP"
fi

cat > "$XINITRC" <<EOF
#!/bin/sh

# Set wallpaper
feh --bg-scale "$WALLPAPER_PATH" &

# Launch sowm
exec $HOME/sowm-green
EOF

chmod +x "$XINITRC"

