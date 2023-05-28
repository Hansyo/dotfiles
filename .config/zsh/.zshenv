# 影響範囲が大きいので、クリティカルな設定のみを行う
# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HONME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # zshの設定ファイルをありったけ集めたディレクトリ

# Any Path here
export PATH="~/.bin:~/.nimble/bin:~/.local/bin:~/opt/cross/bin:~/.config/composer/vendor/bin:$PATH"

# Language
export LANG=ja_JP.UTF-8
