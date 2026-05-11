#!/bin/bash
# A simple "One-Click" Linux Integrator
sudo cp linux/thumbnailer/mflash.xml /usr/share/mime/packages/
sudo cp linux/thumbnailer/mflash-thumbnailer /usr/bin/
sudo cp linux/thumbnailer/mflash.thumbnailer /usr/share/thumbnailers/
sudo chmod +x /usr/bin/mflash-thumbnailer
sudo update-mime-database /usr/share/mime
# Optional: Fix Nemo's size limit
gsettings set org.nemo.preferences thumbnail-limit 104857600 2>/dev/null
echo "Integrations installed! Restart your file manager to see thumbnails."