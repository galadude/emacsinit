# {{{ alias

# }}}
# {{{ start tmux 
if [[ ! $TERM =~ screen ]]; then
	exec tmux new -s pinkpony
fi
# }}}
