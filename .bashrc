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

# Rust
#if [ -d "$HOME/.cargo" ]; then
#    . "$HOME/.cargo/env"
#fi

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
PS1='\[\e[1m\][ \[\e[96m\]\w \[\e[39m\]]\\$ \[\e[0m\]'
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s checkwinsize
export HISTFILESIZE=10000
export HISTSIZE=50
export VISUAL=nvim
export EDITOR="$VISUAL" 
alias ls="ls -F --color";
alias ll="ls -AlF --color";
alias la="ls -AF --color";
alias c="clear";
alias x="exit";
alias v="nvim";
alias nv-watch="watch -n1 nvidia-smi";
