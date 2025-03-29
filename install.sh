#!/bin/bash

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

# Add to PATH if missing
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  if ! grep -q "$BIN_DIR" "$HOME/.profile"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"
    echo "⚠️  Added $BIN_DIR to PATH in ~/.profile — restart your shell or run: source ~/.profile"
  fi
fi

# Ensure required packages are installed
REQUIRED_PKGS=(alacritty feh dmenu)
sudo pacman -Sy
sudo pacman -S --needed "${REQUIRED_PKGS[@]}"

# Create a simple .xinitrc if it doesn't exist
if [ ! -f "$XINITRC" ]; then
  cat > "$XINITRC" <<EOF
#!/bin/sh

# Set wallpaper (edit this path)
feh --bg-scale /path/to/your/wallpaper.jpg &

# Launch sowm
exec sowm
EOF
  chmod +x "$XINITRC"
fi

