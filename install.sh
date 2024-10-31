#!/usr/bin/env bash

set -euo pipefail

if ! command -v chezmoi; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
fi

if [ -d ~/.local/share/chezmoi ]; then
    chezmoi update --apply --keep-going --force
else
    chezmoi init --apply --force ericsuh/dotfiles2
fi
