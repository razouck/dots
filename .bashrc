#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\W $ '

# User specific aliases and functions
if [ -d ~/.bashrc.d ]
then
	for rc in ~/.bashrc.d/*
	do
		if [ -f "$rc" ]
		then
			. "$rc"
		fi
	done
fi

unset rc


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jaboi/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jaboi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jaboi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jaboi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

