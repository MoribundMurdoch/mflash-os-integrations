#!/usr/bin/env bash
set -euo pipefail

# Linux installer for mflash OS integrations.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MIME_SRC="$ROOT_DIR/linux/thumbnailer/mflash.xml"
THUMBNAILER_SRC="$ROOT_DIR/linux/thumbnailer/mflash.thumbnailer"
THUMBNAILER_BIN_SRC="$ROOT_DIR/linux/thumbnailer/mflash-thumbnailer"

MIME_DEST="/usr/share/mime/packages/mflash.xml"
THUMBNAILER_DEST="/usr/share/thumbnailers/mflash.thumbnailer"
THUMBNAILER_BIN_DEST="/usr/bin/mflash-thumbnailer"

if [[ ! -f "$MIME_SRC" ]]; then
  echo "Missing file: $MIME_SRC" >&2
  exit 1
fi

if [[ ! -f "$THUMBNAILER_SRC" ]]; then
  echo "Missing file: $THUMBNAILER_SRC" >&2
  exit 1
fi

if [[ ! -f "$THUMBNAILER_BIN_SRC" ]]; then
  echo "Missing file: $THUMBNAILER_BIN_SRC" >&2
  exit 1
fi

sudo install -Dm644 "$MIME_SRC" "$MIME_DEST"
sudo install -Dm644 "$THUMBNAILER_SRC" "$THUMBNAILER_DEST"
sudo install -Dm755 "$THUMBNAILER_BIN_SRC" "$THUMBNAILER_BIN_DEST"

sudo update-mime-database /usr/share/mime

# Optional: raise Nemo's thumbnail size limit if Nemo settings are available.
if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.nemo.preferences thumbnail-limit 104857600 2>/dev/null || true
fi

echo "mflash OS integrations installed."
echo "Restart your file manager to see updated MIME labels and thumbnails."
