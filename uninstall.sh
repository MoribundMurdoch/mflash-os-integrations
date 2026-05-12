#!/usr/bin/env bash
set -euo pipefail

MIME_DEST="/usr/share/mime/packages/mflash.xml"
THUMBNAILER_DEST="/usr/share/thumbnailers/mflash.thumbnailer"
THUMBNAILER_BIN_DEST="/usr/bin/mflash-thumbnailer"

sudo rm -f "$MIME_DEST"
sudo rm -f "$THUMBNAILER_DEST"
sudo rm -f "$THUMBNAILER_BIN_DEST"

sudo update-mime-database /usr/share/mime

echo "mflash OS integrations uninstalled."
echo "You may need to restart your file manager."
