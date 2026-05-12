# mflash-os-integrations

### Making `.mflash` a First-Class Citizen on Linux

This repository provides Linux desktop integration files for the `.mflash` flashcard deck package format.

It handles system-level behavior such as:

- MIME type registration
- file manager labels
- thumbnailer registration
- cover image thumbnail extraction
- Linux packaging/install helpers

The canonical deck schema and file-format specification live in:

**https://github.com/MoribundMurdoch/mflash-spec**

This repo should be treated as the OS integration layer, not the source of truth for the deck schema.

---

## What This Provides

### MIME Type Registration

Registers `.mflash` files as:

```text
application/x-mflash

The MIME definition keeps .mflash associated with ZIP-style package behavior while giving it its own flashcard-specific type.

Thumbnail Support

The thumbnailer is intended to preview packaged .mflash decks in Linux file managers such as:

Nemo
Nautilus
Thunar
Dolphin

Current thumbnail behavior:

Try to extract a root-level cover.png.
Try to extract a root-level cover.jpg.
Fall back to a generic .mflash icon.

Future thumbnail behavior should also inspect deck.json and use the deck's cover_media field when it points to a safe packaged image path.

Packaged .mflash Assumption

A packaged .mflash file is a ZIP-style archive that should contain:

deck.json

The deck.json file should conform to the current schema defined by mflash-spec.

For mflash v2, deck.json is expected to include stable deck and card IDs.

Installation
Universal install
./setup.sh

This installs:

MIME package definition
thumbnailer executable
thumbnailer desktop integration file

You may need to restart your file manager after installation.

Uninstall
./uninstall.sh
Testing

After installation, refresh the MIME database:

sudo update-mime-database /usr/share/mime

Check the detected MIME type:

xdg-mime query filetype path/to/example.mflash

Expected result:

application/x-mflash

Check that the MIME database knows about the type:

grep -R "application/x-mflash" /usr/share/mime/packages /usr/share/mime 2>/dev/null

Restart your file manager:

nemo -q 2>/dev/null || true
nautilus -q 2>/dev/null || true
thunar -q 2>/dev/null || true

Then reopen the folder containing your .mflash files.

Troubleshooting
Thumbnails do not appear

Try clearing your thumbnail cache:

rm -rf ~/.cache/thumbnails/*

Then restart your file manager.

Nemo thumbnails are missing for larger decks

Nemo may refuse to thumbnail files above its preview size limit.

You can raise the limit with:

gsettings set org.nemo.preferences thumbnail-limit 104857600
MIME type is not recognized

Run:

sudo update-mime-database /usr/share/mime
xdg-mime query filetype path/to/example.mflash

If it still does not work, confirm the MIME XML was installed to:

/usr/share/mime/packages/mflash.xml
Thumbnailer is not running

Confirm the thumbnailer files exist:

ls /usr/share/thumbnailers/mflash.thumbnailer
ls /usr/bin/mflash-thumbnailer

Confirm the executable bit:

ls -l /usr/bin/mflash-thumbnailer
Developer Resources
Canonical mflash spec: https://github.com/MoribundMurdoch/mflash-spec
Local OS integration notes: SPEC.md
Moribund Flash app: https://github.com/MoribundMurdoch/moribund-flash
License

This project is licensed under the Unlicense—it is free and unencumbered software released into the public domain.
