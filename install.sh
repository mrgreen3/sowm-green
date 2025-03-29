#!/bin/bash
# SOWM-GREEN install script, modified by mrgreen 
#
# Version 0.1


set -e

PREFIX="$HOME/.local"
BIN_DIR="$PREFIX/bin"
XINITRC="$HOME/.xinitrc"

# Create bin directory if needed
mkdir -p "$BIN_DIR"

# Build and install sowm locally
make clean >/dev/null 2>&1
make PREFIX="$PREFIX" >/dev/null 2>&1
make PREFIX="$PREFIX" install >/dev/null 2>&1

# Add to PATH if missing to .profile
export PATH="$HOME/.local/bin:$PATH"

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
exec sowm
EOF

chmod +x "$XINITRC"

