[[ $- != *i* ]] && return

stty ixany
stty ixoff -ixon

if [ "$TERM" = "xterm" -a "$COLORTERM" = "gnome-terminal" ]; then
    TERM=xterm-256color
fi


HISTCONTROL=ignoredups:ignorespace
HISTIGNORE='cd:ls:ll:bg:fg:vim:gulp:tmux:history:g'
HISTSIZE=2000
HISTFILESIZE=4000

shopt -s histappend
shopt -s checkwinsize


force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

__bashrc_git_prompt() {
    local gitdir=$(git rev-parse --git-dir 2> /dev/null)

    if [ -n "$gitdir" ]; then
        local head="" head_before="‹" head_after="›"
        local mode="" sign="±"

        if [ -d "$gitdir/rebase-merge" ]; then
            if [ -f "$gitdir/rebase-merge/interactive" ]; then
                mode="rebase-i"
            else
                mode="rebase-m"
            fi
            head="$(cat "$gitdir/rebase-merge/head-name")"
        else
            if [ -d "$gitdir/rebase-apply" ]; then
                if [ -f "$gitdir/rebase-apply/rebasing" ]; then
                    mode="rebase"
                elif [ -f "$gitdir/rebase-apply/applying" ]; then
                    mode="am"
                else
                    mode="am-rebase"
                fi
            elif [ -f "$gitdir/MERGE_HEAD" ]; then
                mode="merge"
            elif [ -f "$gitdir/CHERRY_PICK_HEAD" ]; then
                mode="cherry-pick"
            elif [ -f "$gitdir/BISECT_LOG" ]; then
                mode="bisect"
            fi
            head="$(git symbolic-ref HEAD 2> /dev/null)"
            if [ -z "$head" ]; then
                head=$(git describe --tags --exact-match HEAD 2> /dev/null)
                if [ -z "$head" ]; then
                    head="$(cut -c1-7 "$gitdir/HEAD")‥"
                fi
            fi
        fi
        head="${head##refs/heads/}"
        if [ "$(git config --bool bash.showupstream)" != "false" ]; then
            local count="$(git rev-list --count --left-right @{upstream}...HEAD 2> /dev/null)"
            case "$count" in
                "0	0") ;;
                "0	"*) head_before="«" ;;
                *"	0") head_after="»" ;;
            esac
        fi
        echo -ne "\[\e[0;02m\]$head_before\[\e[0m\]$head\[\e[0;02m\]$head_after "

        if [ -n "$mode" ]; then
            echo -ne "\[\e[0;33m\]$mode "
        fi

        if [ "$(git config --bool bash.showdirtystate)" != "false" ]; then
            if git diff --no-ext-diff --quiet HEAD 2> /dev/null; then
                echo -ne "\[\e[0;32m\]"
            else
                echo -ne "\[\e[0;31m\]"
            fi
        fi
        echo -ne "$sign"
    else
        if [ $EUID = 0 ]; then
            echo -ne '#'
        else
            echo -ne '$'
        fi
    fi
}

__bashrc_shlvl() {
    if [ "$SHLVL" -gt 1 ]; then
        echo -n "\[\e[0m\][$SHLVL] "
    fi
}

__bashrc_set_ps1() {
    PS1="$(__bashrc_shlvl)\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\] $(__bashrc_git_prompt) \[\e[1;37m\]"
    case "$TERM" in xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
    esac
}

if [ "$color_prompt" = yes ]; then
    PROMPT_COMMAND='__bashrc_set_ps1'
    trap "echo -ne '\e[0m'" DEBUG
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi


alias mysql='mysql --default-character-set=utf8'
alias tree='tree --dirsfirst -I node_modules'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lA'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status --short
    fi
}


if [[ -z $BASH_COMPLETION_COMPAT_DIR && -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi
