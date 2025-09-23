#!/usr/bin/env bash

set -euo pipefail

CMD=chezmoi
if ! command -v chezmoi >/dev/null; then
    pushd ~/.local >/dev/null
    sh -c "$(curl -fsLS get.chezmoi.io)"
    CMD=~/.local/bin/chezmoi
    popd
fi

if [ -d ~/.local/share/chezmoi ]; then
    "$CMD" update --apply --keep-going --force
else
    "$CMD" init --apply --force ericsuh/dotfiles2
fi
