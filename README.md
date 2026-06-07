# Serpentarius: An Opinionated Immutable Linux Distro

A clean, production-grade, container-native Linux operating system built on **Fedora Atomic (Kinoite)** and the **Universal Blue** project. Serpentarius offers a minimalist, high-performance environment optimized for development and power users, removing bloat and focusing on a pure KDE Plasma experience.

---

## 🦅 The Philosophy
Named after the Secretary Bird, this OS is designed to "stomp out" system environmental chaos.
* **Immutable Stability:** No local state drift.
* **Minimalist Approach:** Only essential tools are baked into the image; no pre-installed user-space flatpaks to keep the image slim.
* **Pure KDE Native:** Custom configuration, not third-party extensions.

---

## 🛠 Strategic Architecture Choices

* **Clean KDE Plasma:** Focuses on native KWin configurations for a frosted glass theme.
* **No App Bloat:** Apps like Steam or VSCodium are excluded from the base image.
* **Baked-In Core Tools:** Includes `google-chrome-stable`, `zsh`, `virt-manager`, `podman`, and `docker-ce`.
* **Ergonomics:** Pre-configured with Mint-like `Super+Up` window snapping behavior.

---

## 💻 Technical Stack & Features

* **Base:** Universal Blue `kinoite-main`.
* **Multimedia:** Unrestricted FFmpeg/GStreamer and AMD/Intel drivers.
* **Containers & VM:** Native `podman`, `docker-ce`/`compose`, `virt-manager`, and `libvirt-daemon-kvm`.
* **Development:** Pre-configured for user-space Homebrew.
* **Shell:** Zsh with Fastfetch.

---

## 📂 Repository File Blueprint

```text
Serpentarius/
├── .github/workflows/    # CI/CD pipelines
├── files/
│   └── etc/
│       └── skel/
│           └── .config/
│               ├── kdeglobals         # Dark Mode & Mint Green theme
│               ├── kwinrc             # Translucency & blur settings
│               └── kglobalshortcutsrc # Window management shortcuts
├── recipes/
│   └── recipe.yml        # Package definitions
└── README.md
```

---

## 🚀 Installation

Not so standard, but not hard

If you are already running a fedora atomic or universal blue distro, just rebase your current Atomic system to the new Serpentarius image:
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/leonpaps/serpentarius:latest
```

If you don't have a current image, that's fine. Download the kinonite fedora atomic image and do the rebase after installation.
I think custom installation media is coming soon (people smarter than me are working on it)

## 🛠️ Post-Installation Activation (Off for now by default but installed)

To keep the system boot lifecycle lightweight and minimal, background service daemons are disabled by default. If you plan to use container virtualization or VMs, run the following commands once to enable them permanently across all further boots:

Remember we have podman and docker so do what you will.

### Enable Docker Engine
```bash
sudo systemctl enable --now docker.socket
```

### Enable Virtualization (Virt-Manager)
```bash
sudo systemctl enable --now libvirtd.service
```