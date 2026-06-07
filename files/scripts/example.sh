#!/usr/bin/env bash
set -oue pipefail

# 1. Enforce Zsh as the default system-wide user shell layout
sed -i 's|SHELL=/bin/bash|SHELL=/bin/zsh|g' /etc/default/useradd

# 2. Provision Homebrew directly into the real absolute ostree writable partition path
if [ ! -d "/var/home/linuxbrew/.linuxbrew" ]; then
    mkdir -p /var/home/linuxbrew/.linuxbrew
    curl -L https://github.com | tar xz --strip-components 1 -C /var/home/linuxbrew/.linuxbrew
fi

# 3. Create a temporary build symlink so the brew shellenv evaluation works inside the container sandbox
ln -s /var/home /home-compile-symlink || true
export HOMEBREW_PREFIX="/var/home/linuxbrew/.linuxbrew"

# 4. Initialize the environment pathway dynamically
eval "$(/var/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 5. Bake magic-wormhole directly into the image's user-space tools
brew install magic-wormhole

# 6. Lock down permissions securely to root:root to protect tools from tampering
chown -R root:root /var/home/linuxbrew/.linuxbrew
chmod -R 755 /var/home/linuxbrew/.linuxbrew
