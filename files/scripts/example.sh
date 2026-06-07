#!/usr/bin/env bash
set -oue pipefail

# 1. Enforce Zsh as the default system-wide user shell layout
sed -i 's|SHELL=/bin/bash|SHELL=/bin/zsh|g' /etc/default/useradd
