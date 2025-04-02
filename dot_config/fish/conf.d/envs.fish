set --export --global SHELL (command --search fish)

if status --is-interactive
    if command --search nvim
        set --export --global EDITOR (command --search nvim)
    else if command --search vim
        set --export --global EDITOR (command --search vim)
    end
end
