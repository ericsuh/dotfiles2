#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/mise"

export PATH="$HOME/.local/bin${PATH:+:${PATH}}"

if ! command -v curl >/dev/null; then
    sudo apt-get install --yes --no-install-recommends curl
fi

curl -fsSL -o "$HOME/.local/mise/config.toml" https://raw.githubusercontent.com/ericsuh/dotfiles2/refs/heads/main/dot_config/mise/config.toml

if ! command -v mise >/dev/null; then
    curl -fsSL https://mise.run | sh
fi
mise install

if ! command -v chezmoi >/dev/null; then
    pushd ~/.local >/dev/null
    sh -c "$(curl -fsLS get.chezmoi.io)"
    popd
fi

if [ -d ~/.local/share/chezmoi ]; then
    mise exec -- chezmoi update --apply --keep-going --force
else
    mise exec -- chezmoi init --apply --force ericsuh/dotfiles2
fi
