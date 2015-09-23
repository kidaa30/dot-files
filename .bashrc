# path

declare -A PHASH

PRE="${IFS}"; IFS=$\:; DS=( ${PATH} ); IFS="${PRE}";

for d in ${DS[@]}; do
    PHASH[$d]=1
done

if [[ -z ${PHASH[~/bin]} ]]; then
    PATH=~/bin:${PATH}
fi

for f in ~/bin/*; do

    # add any sub-dirs

    if [[ -z ${PHASH[$f]} && -d $f ]]; then

        PHASH[$f]=1
        PATH=$f:${PATH}

    fi

done

PATH=${PATH}:/opt/eclipse
MANPATH=${MANPATH}:~/share/man

export PATH
export MANPATH

# test if shell interactive

if [[ $- != *i* ]] ; then
	return
fi

# shell optional behavior

shopt -s histappend

# environment vars

export LC_ALL="en_US.UTF-8"

# general

export EDITOR=nvim

# gnupg

export GPG_TTY=$(/usr/bin/tty)

# compiler

export CC="clang"
export CXX="clang++"

# ccache

if [[ -d /dev/hdd ]]; then

    export CCACHE_DIR="/var/ccache/${USER}"
    export CCACHE_SIZE="4G"
    export CCACHE_CPP2="1"
    export CCACHE_COMPRESS="1"

fi

# git

export GIT=~/development/git

# rtorrent

/bin/stty start undef
/bin/stty stop undef

# aliases

alias diff="colordiff"

alias ls="ls -hF --color=tty"
alias la="ls -A"
alias ll="ls -l"

alias kk="knock"
alias rd="rdesktop"
alias nb="newsbeuter"
alias wb="w3m -B"

alias pm="pm -f"
alias cpm="cpm -f"
alias upm="upm -f"
