#!/usr/bin/env bash
#
#
#
#                    .o8                          oooo
#                   "888                          `888
#                    888oooo.   .oooo.    .oooo.o  888 .oo.
#                    d88' `88b `P  )88b  d88(  "8  888P"Y88b
#                    888   888  .oP"888  `"Y88b.   888   888
#                    888   888 d8(  888  o.  )88b  888   888
#                    `Y8bod8P' `Y888""8o 8""888P' o888o o888o
#
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\W $ '

# Load files in the `.bashrc.d` directory
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"

# bind '"\C-f":"search_fzf\C-m"'
# TODO: ^ Change this line to call the search the text files function.
