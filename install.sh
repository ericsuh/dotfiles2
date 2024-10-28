#!/usr/bin/env bash

set -euo pipefail

if ! command -v chezmoi; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
fi

chezmoi apply
