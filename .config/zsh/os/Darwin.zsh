# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
if type brew &>/dev/null; then
    export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

export LSCOLORS_ARRAY=(gx fx Cx dx Bx eg ed ab ag ac ad)
export LSCOLORS=${(j::)LSCOLORS_ARRAY}

COREUTILS_LIBEXEC_PATH="/opt/homebrew/opt/coreutils/libexec"
if [ -d $COREUTILS_LIBEXEC_PATH ]; then
    export PATH=$COREUTILS_LIBEXEC_PATH/gnubin:$PATH
    export MANPATH=$COREUTILS_LIBEXEC_PATH/gnuman:$MANPATH
fi

PIPR_PATH="~/.local/share/pipr/pipr_macos.zsh"
[ -f $PIPR_PATH ] && source $PIPR_PATH


if [[ -e $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk && ! -e /Library/Java/JavaVirtualMachines/openjdk.jdk ]];then
    sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

if [[ -e $(brew --prefix)/share/google-cloud-sdk/path.zsh.inc ]];then
	source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
	source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

