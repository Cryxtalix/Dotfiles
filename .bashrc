# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

# Personal
export HISTFILESIZE=1000
export HISTSIZE=500
export VISUAL=nvim
export EDITOR="$VISUAL" 
export PS1='\[\e[1m\][ \[\e[96m\]\w \[\e[39m\]]\\$ \[\e[0m\]'
alias ls="ls -F --color";
alias ll="ls -AlF --color";
alias la="ls -AF --color";
alias c="clear";
alias v="nvim";
alias nv-watch="watch -n1 nvidia-smi";

# Rust
. "$HOME/.cargo/env";
