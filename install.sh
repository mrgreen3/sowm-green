#!/bin/bash
# SOWM-GREEN install script, modified by mrgreen 
#
# Version 0.2


set -e

XINITRC="$HOME/.xinitrc"

# Ensure required packages are installed
sudo pacman -Sy --needed alacritty dmenu feh scrot vim sxhkd dunst base-devel git

# Build and install sowm locally
make clean >/dev/null 2>&1
make >/dev/null 2>&1

# Ensure required directories exist
mkdir -p "$HOME/Pictures"

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

# Start a terminal
alacritty &

# sxhkd
sxhkd -c "$HOME/sowm-green/configs/sxhkdrc" &

# dunst
dunst &

# Launch sowm
exec "$HOME/sowm-green/sowm"
EOF

chmod +x "$XINITRC"

