# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export LSCOLORS_ARRAY=(gx fx Cx dx Bx eg ed ab ag ac ad)
export LSCOLORS=${(j::)LSCOLORS_ARRAY}

COREUTILS_LIBEXEC_PATH="/opt/homebrew/opt/coreutils/libexec"
if [ -d $COREUTILS_LIBEXEC_PATH ]; then
  export PATH=$COREUTILS_LIBEXEC_PATH/gnubin:$PATH
  export MANPATH=$COREUTILS_LIBEXEC_PATH/gnuman:$MANPATH
fi

PIPR_PATH="~/.local/share/pipr/pipr_macos.zsh"
[ -f $PIPR_PATH ] && source $PIPR_PATH

