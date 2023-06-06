# 影響範囲が大きいので、クリティカルな設定のみを行う
# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HONME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # zshの設定ファイルをありったけ集めたディレクトリ

# Any Path here
export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.nimble/bin:$HOME/opt/cross/bin:$HOME/.config/composer/vendor/bin:$PATH"

# Language
export LANG=ja_JP.UTF-8

# Pyenv settings
if [[ -e "$HOME/.pyenv" ]];then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	command -v pyenv >/dev/null && eval "$(pyenv init -)"
fi

# Deno settings
if [[ -e "$HOME/.deno" ]];then
	export DENO_INSTALL="$HOME/.deno"
	export PATH="$DENO_INSTALL/bin:$PATH"
fi
