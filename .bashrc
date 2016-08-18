# {{{ alias
alias ed='ed -p:'
# }}}
# {{{ start tmux 
if [[ ! $TERM =~ screen ]]; then
	exec tmux new -s pinkpony
fi
# }}}
