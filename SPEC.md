# mflash OS Integration Notes

**Status:** Draft  
**Scope:** Linux OS integration for packaged `.mflash` files  
**Canonical deck spec:** https://github.com/MoribundMurdoch/mflash-spec

---

## 1. Overview

This document describes how Linux desktop integrations should recognize, label, and preview packaged `.mflash` files.

It is not the canonical mflash deck schema.

The canonical mflash deck format, including mflash v1, mflash v2, progress files, schemas, migration behavior, and validation rules, is maintained in:

```text
https://github.com/MoribundMurdoch/mflash-spec
2. MIME Type

The official Linux MIME type for packaged .mflash files is:

application/x-mflash

The file glob pattern is:

*.mflash

Packaged .mflash files are ZIP-style archives, so the MIME type should subclass:

application/zip
3. Packaged .mflash Assumption

A packaged .mflash file is a ZIP-style archive.

It should contain a root-level:

deck.json

The deck.json file should conform to the current mflash schema defined by mflash-spec.

For mflash v2, deck.json is expected to include:

{
  "format": "mflash",
  "version": 2,
  "id": "deck_example",
  "title": "Example Deck",
  "cards": [
    {
      "id": "card_001",
      "term": "bonjour",
      "definition": "hello"
    }
  ]
}

Deck schema validation belongs to mflash-spec and application-level tooling, not the OS thumbnail integration layer.

4. Thumbnail Protocol

A thumbnailer should try to produce a preview image for packaged .mflash files.

Recommended future behavior:

Open the .mflash archive safely.
Read root-level deck.json.
If deck.json contains cover_media, resolve it as a safe relative package path.
If that file exists and is a supported image, use it as the thumbnail.
Fall back to root-level cover.png.
Fall back to root-level cover.jpg.
Fall back to a generic .mflash icon.

Current simple behavior may only implement:

Try root-level cover.png.
Try root-level cover.jpg.
Fall back to a generic icon.
5. Path Safety

Thumbnailers and file managers must treat .mflash packages as untrusted input.

Integrations must avoid:

archive path traversal
unsafe absolute paths
extracting files outside a temporary/safe thumbnail directory
executing any content inside the package

Unsafe paths include:

../outside-file
../../secret
/home/user/file.png
C:\Users\Name\file.png

The thumbnailer should only read safe relative paths inside the archive.

6. What This Repo Owns

This repo owns:

MIME registration
Linux thumbnailer files
install/uninstall helpers
packaging metadata for OS integration
file-manager preview behavior

This repo does not own:

the canonical mflash deck schema
migration rules between mflash versions
progress file schema
app-level validation behavior
study scheduling behavior

Those belong in mflash-spec and app repositories.

7. Compatibility

OS integration should remain stable even as the deck schema evolves.

A .mflash package should continue to be recognized as application/x-mflash as long as it uses the .mflash extension and ZIP-style package structure.

Thumbnailers should be tolerant. If a deck cannot be parsed, or if cover media cannot be found, the integration should fall back to a generic icon rather than breaking file browsing.
