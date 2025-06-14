# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Kitty - fix SSH
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

PS1='[\t \[\e[01;36m\]\u\[\e[0m\]@\[\e[01;36m\]\h\[\e[0m\] \W]\\$ '

# Set tmux auto attach
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
 tmux attach-session -t XMR || tmux new-session -s XMR
fi

# Fastfetch
fastfetch
