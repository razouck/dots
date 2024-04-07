#
#
#
#                                        .o88o.  o8o  oooo
#                                        888 `"  `"'  `888
#         oo.ooooo.  oooo d8b  .ooooo.  o888oo  oooo   888   .ooooo.
#          888' `88b `888""8P d88' `88b  888    `888   888  d88' `88b
#          888   888  888     888   888  888     888   888  888ooo888
#          888   888  888     888   888  888     888   888  888    .o
#          888bod8P' d888b    `Y8bod8P' o888o   o888o o888o `Y8bod8P'
#          888
#---------o888o------------------------------------------------------------------
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export PAGER=less
export XDG_CONFIG_HOME="$HOME/.config"

# Autostart X at login
if [ -z "${DISPLAY}" ] && [  "${XDG_VTNR}" -eq 1  ]
then
	exec startx
fi

