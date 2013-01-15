# path

export PATH=~/bin:${PATH}

# test if shell interactive

if [[ $- != *i* ]] ; then
	return
fi

# shell optional behavior

shopt -s histappend

# environment vars

export LC_ALL="en_US.UTF-8"

# general

export EDITOR=vim

# ccache

export PATH=~/bin/ccache:${PATH}

export CCACHE_DIR="/var/tmp/ccache/${USER}"
export CCACHE_SIZE="8G"
export CCACHE_COMPRESS="1"

# aliases
alias ls="ls -hF --color=tty"
alias la="ls -A"
alias ll="ls -l"

