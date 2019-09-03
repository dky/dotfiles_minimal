if [[ $EUID -ne 0 ]]; then
	tail="$"
else
	tail="#"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		source "$HOME/.bashrc"
		source "$HOME/.custom_aliases"
		source "$HOME/.custom_functions"
	fi
	if [ -f "$HOME/.dot_private" ]; then
		source "$HOME/.dot_private"
	fi
	if [ -f "$HOME/bin/export" ]; then
		source $HOME/bin/export
	fi
fi
