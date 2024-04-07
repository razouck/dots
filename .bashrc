#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\W $ '

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

bind '"\C-f":"search_fzf\C-m"'

eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"
