function fish_prompt --description 'Two-line prompt: user@host cwd [branch] / exit_code >'
    set -l last_status $status

    set -l user (whoami)
    set -l host (string sub --length 20 -- (prompt_hostname))
    set -l cwd (prompt_pwd)

    set -l git_str ''
    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null; or command git rev-parse --short HEAD 2>/dev/null)
    if test -n "$branch"
        set git_str ' ['$branch']'
    end

    set_color green
    echo -n $user@$host
    set_color normal
    echo -n ' '
    set_color blue
    echo -n $cwd
    set_color yellow
    echo $git_str
    set_color normal

    if test $last_status -ne 0
        set_color red
        echo -n $last_status
        set_color normal
        echo -n ' '
    end
    echo -n '> '
end
