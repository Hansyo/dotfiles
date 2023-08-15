# Set PATH, MANPATH, etc., for Homebrew.
if [[ $OSTYPE =~ "darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if which pyenv-virtualenv-init > /dev/null;then
	eval "$(pyenv virtualenv-init -)"
fi
