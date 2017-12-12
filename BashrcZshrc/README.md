
- .zshrc
```bash
~export ZSH=/home/dav/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# §**
# 


## Function Meh to light msikeyboard with color as parameter and highest intensity
msi() 
{
msikeyboard -c $1 -i high
}

## insert sudo before a command 
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo


## cd .. * param ( default 1 )
up() {
    if [[ "$#" < 1 ]] ; then
        cd ..
    else
        CDSTR=""
        for i in {1..$1} ; do
            CDSTR="../$CDSTR"
        done
        cd $CDSTR
    fi
}

``` 
- .bashrc
```bash
if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

#source aliases
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# PATH
PATH=$PATH:/sbin:/usr/sbin
PATH=$PATH:$HOME/.local/bin

xhost +local:root > /dev/null 2>&1

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

export EDITOR=vim

#===============================#
#	Functions		            #
#===============================#

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Coloured man pages
# https://wiki.archlinux.org/index.php/Man_page
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

#===============================#
#    Prompt            			#
#===============================#

# Colour defs
NC='\[\033[m\]'
RED='\[\033[1;31m\]'
BLUE='\[\033[1;34m\]'
CYAN='\[\033[0;36m\]'


fancy_prompt()
{
    if [[ $? == 0 ]]; then
        PROMPT_END="$NC>"
    else
        PROMPT_END="$RED>$NC"
    fi

    if [[ $(id -u) -eq 0 ]]; then
        PROMPT_USER="$RED\u$NC"
    else
        PROMPT_USER="$CYAN\u$NC"
    fi

    if [[ -z $SSH_CLIENT ]]; then
        PS1="$PROMPT_USER $BLUE\w$NC $PROMPT_END "
    else
        PS1="$PROMPT_USER@$RED\h $BLUE\w$NC $PROMPT_END "
    fi
}

# Colour with return code color.
PROMPT_COMMAND="fancy_prompt"

```
