# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/bin


export PATH
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"


peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
