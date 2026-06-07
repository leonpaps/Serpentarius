#!/usr/bin/env bash
set -oue pipefail

# 1. Enforce Zsh as the default system-wide user shell layout
sed -i 's|SHELL=/bin/bash|SHELL=/bin/zsh|g' /etc/default/useradd

# 2. Automatically provision the system-wide Homebrew directory architecture
if [ ! -d "/home/linuxbrew/.linuxbrew" ]; then
    mkdir -p /home/linuxbrew/.linuxbrew
    curl -L https://github.com | tar xz --strip-components 1 -C /home/linuxbrew/.linuxbrew
fi

# 3. Temporarily initialize the environment to install magic-wormhole
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 4. Bake magic-wormhole directly into the image's user-space tools
brew install magic-wormhole

# 5. Fix permissions to ensure new user accounts can run the binaries cleanly
chown -R root:root /home/linuxbrew/.linuxbrew
chmod -R 755 /home/linuxbrew/.linuxbrew
