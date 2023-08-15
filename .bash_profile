#
# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export PAGER=less

# Autostart X at login
if [ -z "${DISPLAY}" ] && [  "${XDG_VTNR}" -eq 1  ]
then
	exec startx
fi
