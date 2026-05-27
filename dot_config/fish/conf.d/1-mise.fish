if command -v mise >/dev/null
    mise activate fish | source
else if test -x $HOME/.local/bin/mise
    $HOME/.local/bin/mise activate fish | source
else if test -x /usr/local/bin/mise
    $HOME/.local/bin/mise activate fish | source
end
