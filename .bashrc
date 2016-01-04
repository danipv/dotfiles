# .bashrc file
#
# Concepts:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#
#    2) .bash_profile is the *login* config for bash, launched upon first
#        connection (in Ubuntu)
#
#    3) .bash_profile imports .bashrc in our script, but not vice versa.
#
# Do 'man bashrc' for the long version or see here:
# http://en.wikipedia.org/wiki/Bash#Startup_scripts
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

## -----------------------
## --   Set up aliases  --
## -----------------------

# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll="ls -alrtF --color"
alias la="ls -A"
alias ..='cd ..'
alias ...='cd ..;cd ..'

# 2.4) grep options
alias rgrep='rgrep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

# 2.5) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX

# 2.6) Git & Mercurial
alias gg='git status -s'
alias hh='hg status'

# 2.7) Python shortcuts
alias ss='python -m SimpleHTTPServer'

## -----------------------
## --   Set up python   --
## -----------------------

# Config for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

## -----------------------
## --    Set up env     --
## -----------------------

# Bash completion
# require: apt-get install bash-completion
# Use bash-completion, if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export TERM=xterm-256color
# LS Config
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
# Locale es_ES
export LC_ALL=es_ES.UTF-8
export LC_TYPE=es_ES.UTF-8

## ------------------------------------------
## --  Set up bash prompt                  --
## ------------------------------------------

# Colors
# http://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
COLOR_OFF="\[\033[0m\]"       # Text Reset
MAGENTA="\[\033[0;35m\]"
BLUE="\[\033[34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RED="\[\033[38;5;196m\]"
ORANGE="\[\033[38;5;214m\]"
YELLOW="\[\033[38;5;220m\]"

# Make prompt informative
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
#PS1=$RED"\u"$COLOR_OFF" at "$ORANGE"\h"$COLOR_OFF" in "$YELLOW"\w"$COLOR_OFF"\n$ "

## ------------------------------------------
## --  Set up Git prompt & autocompletion  --
## ------------------------------------------

source ~/dotfiles/.git-completion.bash
source ~/dotfiles/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

# Prompt with Git branch and status colored
export PS1=$RED"\u"$COLOR_OFF" at "$ORANGE"\h"$COLOR_OFF" in "$YELLOW"\w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$BLUE'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$COLOR_OFF"\n$ "
