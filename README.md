![Serpentarius OS Logo](files/system/usr/share/pixmaps/serpentarius-launcher.svg) 

# Serpentarius: An Opinionated immutable distro for me, and maybe you. 

This distro is not battle tested yet.
I am gonna daily drive it and see what I learn.
Check back in 6 months ⏱️

[![Build Status](https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/actions/workflows/build.yml)
[![Platform Architecture](https://img.shields.io/badge/Architecture-Cloud--Native%20Desktop-blue)](https://blue-build.org/)
[![Base OS](https://img.shields.io/badge/Base-Fedora%20Silverblue%2044-red)](https://fedoraproject.org/atomic-desktops/silverblue/)

## 🦅 The Philosophy of the Secretary Bird (*Sagittarius serpentarius*)

This operating system is proudly named after *Sagittarius serpentarius*—the **Secretary Bird**. Indigenous to the African savannas, the secretary bird is renowned for its striking, elegant appearance paired with its highly lethal, precise hunting style. Unlike most birds of prey that attack from the air, it operates entirely on foot, stomping out threats (like venomous snakes) with absolute force and calculating speed.

**Serpentarius** mirrors this exact biological paradigm:
*   **Grounded Stability:** By utilizing an immutable core architecture, the OS maintains a rock-solid, grounded foundation that completely resists the system drift and environmental chaos of traditional mutable desktops.
*   **Precise Striking Force:** Heavy background daemons, telemetry, and unneeded corporate bloat are aggressively "stomped out" of the system layout layer, leaving a lean, hyper-focused engineering and gaming platform.



**Serpentarius** is an opinionated, production-grade, container-native Linux operating system built on the **Fedora Atomic (`bootc`)** ecosystem. This project implements the **Infrastructure as Code (IaC)** paradigm for local developer workstations—shifting system state, package layering, and hardware-specific configurations upstream into an automated CI/CD build pipeline.


---

# Choices: 

I chose Gnome for the desktop environment because I haven't used it in quite some time but I like the gnome app suite. I might change to something else but let's see how it goes.

I have been using cinamon for a while on my laptop and KDE on my desktop.

I want to see what I can do the tweek tools. Classic PC style bottom bar with an app menu is my favourite layout.

 - I have chosen the opensource codium editor instead of vscode. I don't think telemetry is worth it.
 - It ships with google chrome, maybe chromium would have been a better choice but let's see.
 - Homebrew is installed by default. I have been using homebrew on linux for a while and I really like it (even when not on immutable systems).
   - Good build recipes
   - No sudo needed
   - doesn't mess with system dependancie.
 - ZSH is the default shell with some nice to have extensions to make it feel familiar

---

## 🛠️ Key Architectural Highlights

*   **Infrastructure as Code (IaC):** The entire bare-metal operating system configuration is defined declaratively via `recipe.yml`. Local state drift is eliminated.
*   **GitOps-Driven CI/CD Pipeline:** Every push to the `main` branch triggers a GitHub Actions pipeline that cross-compiles system layers, injects secure repositories, and publishes a cryptographically signed OCI container image to the GitHub Container Registry (GHCR).
*   **Atomic Deployments via `bootc`:** System updates utilize image-swapping boot mechanisms with native `composefs` verification. If a deployment fails, the bootloader safely rolls back to the previous cryptographically signed image state.
*   **Zero-Overhead Local Development:** Decouples heavy system tools from a native Homebrew environment to protect system-sleep states, eliminate container latency, and preserve hardware-acceleration limits.

---

## 💻 Tech Stack & Features

*   **Core System Layer:** Built on Universal Blue’s `silverblue-main` base tracking upstream Fedora Silverblue 44.
*   **Hardware-Accelerated Multimedia:** Integrated non-free AMD VA-API hardware decoding layers via embedded RPM Fusion dependencies (`mesa-va-drivers-freeworld` and `libavcodec-freeworld`).
*   **Dual-Container Engine Virtualization:** Pre-configured parallel execution paths using `podman` for system-level task management/Distrobox isolation, and a native bare-metal `docker-ce` daemon for production microservice architectures.
*   **Sandboxed Evergreen Ecosystem:** User applications (`Google Chrome`, `VSCodium`, `Steam`) are completely containerized via the Flatpak runtime layer, configured with granular permission sliders via `Flatseal`.
*   **UX Personalization Layer:** Modified GNOME 44 shell leveraging host-layered `Dash to Panel` and `ArcMenu` extensions to deliver a deterministic Windows 7 / KDE Plasma ergonomic layout.
*   **Shell Environment:** Default system shell hardcoded to `Zsh`, prepared for native user-space performance plugins.
