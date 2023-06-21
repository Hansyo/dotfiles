# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export LSCOLORS_ARRAY=(gx fx Cx dx Bx eg ed ab ag ac ad)
export LSCOLORS=${(j::)LSCOLORS_ARRAY}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
fi

PIPR_PATH="~/.local/share/pipr/pipr_macos.zsh"
[ -f $PIPR_PATH ] && source $PIPR_PATH

