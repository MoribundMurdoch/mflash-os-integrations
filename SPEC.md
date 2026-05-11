.mflash File Format Specification (v1.0.0)
1. Overview
The .mflash format is a platform-independent, compressed archive used for storing flashcard decks. It prioritizes portability and native OS integration.

2. Container Structure
The file MUST be a standard ZIP archive.

2.1 File Layout
/deck.json (Required): The primary metadata and card data.

/cover.png or /cover.jpg (Optional): A dedicated image file used by OS file managers for thumbnails.

/media/ (Recommended): A subdirectory containing all assets referenced in the deck.

3. MIME Type
The official MIME type for this format is application/x-mflash.

4. Thumbnail Protocol
For native OS integration, an integrator SHOULD extract /cover.png or /cover.jpg from the root of the archive to generate a preview icon. If neither exists, the integrator SHOULD fallback to a generic application icon.
