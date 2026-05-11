# mflash-os-integrations
### Making `.mflash` a First-Class Citizen on Linux

This repository provides the core system-level hooks to make the `.mflash` flashcard deck format behave like a native file type on Linux desktops. Instead of generic icons your OS will recognize, label, and preview your decks.

---

## ✨ Features

* **MIME Type Registration**: Formally registers `application/x-mflash` with the system database.
* **Cover Art Thumbnails**: Automatically extracts `cover.png` from `.mflash` archives to show previews in file managers like Nemo, Thunar, Nautilus, and Dolphin.
* **Universal Compatibility**: Support for Arch, Debian, Fedora, Nix, and generic Linux systems.

---

## 📥 Installation

Choose the package that matches your distribution from the [Releases](https://github.com/MoribundMurdoch/mflash-os-integrations/releases) page.

| Format | Distributions | Command |
| :--- | :--- | :--- |
| **Arch Linux** | Arch, Manjaro, SteamOS | `makepkg -si` |
| **Debian/Ubuntu** | Mint, Pop!_OS, Debian | `sudo apt install ./mflash-common_1.0.0_all.deb` |
| **Red Hat/Fedora** | Fedora, RHEL, OpenSUSE | `sudo dnf install ./mflash-common-1.0.0-1.noarch.rpm` |
| **Nix** | NixOS, Nix Users | `nix-env -f default.nix -i` |
| **Universal** | Any other Linux | `./setup.sh` |

> **Pro-Tip**: If thumbnails don't appear in Nemo or Thunar, check your file manager's **Preview Size Limit** in settings. Set it high enough to handle your deck file sizes.

---

## 🛠️ Developer Resources

If you are building tools for the Moribund Flash ecosystem, please refer to the following:

* **[SPEC.md](./SPEC.md)**: The technical standard for the `.mflash` container format.
* **[Moribund Flash App](https://github.com/MoribundMurdoch/moribund-flash)**: The main desktop application (Tauri + Rust).

---

## 📜 License
This project is licensed under the **Unlicense**—it is free and unencumbered software released into the public domain.
