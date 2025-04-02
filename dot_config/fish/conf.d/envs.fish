set --export --global SHELL (command --search fish)

if status --is-interactive
    if command --search nvim >/dev/null
        set --export --global EDITOR (command --search nvim)
    else if command --search vim >/dev/null
        set --export --global EDITOR (command --search vim)
    end
end
