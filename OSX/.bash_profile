export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

MAGENTA="\[$(tput setaf 5)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[$(tput setaf 6)\]"
GREEN="\[$(tput setaf 2)\]"
#RED="\[\033[01;31m\]"
RED="\[$(tput setaf 1)\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
#export CLICOLOR='Yes'
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$LIGHT_GRAY"\u@\h:"$GREEN"\w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")

    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$CYAN'"$(__git_ps1 " (%s)")

    # the state is clean, changes are commited
    else echo "'$GREEN'"$(__git_ps1 " (%s)")
    fi)'"\[$(tput sgr0)\] \\$ "

# Based on https://github.com/emilis/emilis-config/blob/master/.bash_ps1
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="--- "

reset_style="\[$(tput sgr0)\]"
if [ -z "$VIM" ]; then
    status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
    else status_style=$reset_style'\[\033[0;90;107m\]'
fi

prompt_style=$reset_style
command_style=$reset_style #'\[\033[1;29m\]' # bold black

# Prompt variable:
OLD_PS1="$PS1"

PS1="$status_style"'$fill \t\n'"$prompt_style$OLD_PS1$command_style"

# Reset color for command output
# (this one is invoked every time before a command is executed):
#trap 'echo -ne "\e[0m"' DEBUG

function prompt_command {
    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
}

PROMPT_COMMAND=prompt_command


# -------------------------------------------------------------

# Aliases
source ~/.aliases

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export SSH_ASKPASS=/usr/libexec/ssh-askpass
export PATH=/usr/local/sbin:$PATH

# GIT
source ~/.git-completion.bash
source ~/.git-prompt.sh