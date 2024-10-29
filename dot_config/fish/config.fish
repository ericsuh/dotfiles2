set fish_greeting
if status is-interactive
    if test $TERM_PROGRAM = "vscode"
	    set -xg EDITOR code
	else
	    set -xg EDITOR nvim
	end
end
