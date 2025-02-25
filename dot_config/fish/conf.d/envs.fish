set --export --global SHELL (command --search fish)

if status --is-interactive
    if [ $TERM_PROGRAM = "vscode" ]
        set --export --global EDITOR (command --search code)
    else
        set --export --global EDITOR (command --search vim)
    end
    set --export --global VISUAL $EDITOR
end
