#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config/mise"

export PATH="$HOME/.local/bin${PATH:+:${PATH}}"

if ! command -v curl >/dev/null; then
    # macOS always has curl
    sudo apt-get install --yes --no-install-recommends curl
fi

if ! command -v chezmoi >/dev/null; then
    pushd ~/.local >/dev/null
    sh -c "$(curl -fsLS get.chezmoi.io)"
    popd
fi

if [ -d ~/.local/share/chezmoi ]; then
    chezmoi update --apply --keep-going --force
else
    chezmoi init --apply --force ericsuh/dotfiles2
fi

if ! command -v mise >/dev/null; then
    # Installs to ~/.local/bin by default
    curl -fsSL https://mise.run | sh
fi

if [ "${DOTNET:-}" != "" ]; then
    curl -fsSLO https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh
    sudo bash dotnet-install.sh --channel '8.0' --install-dir /usr/lib/dotnet
fi

mise install
