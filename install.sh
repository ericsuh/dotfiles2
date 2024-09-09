#!/usr/bin/env bash

set -euo pipefail

CURRENT_OS=$(uname)

if ! command -v chezmoi; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
fi


