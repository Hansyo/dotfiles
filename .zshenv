# 影響範囲が大きいので、クリティカルな設定のみを行う

export ZDOTDIR=$HOME/.zshrc.d # zshの設定ファイルをありったけ集めたディレクトリ

export PATH=~/.bin:~/.nimble/bin:~/.local/bin:~/opt/cross/bin:$PATH
export PATH=~/.config/composer/vendor/bin:$PATH

export LANG=ja_JP.UTF-8

source $ZDOTDIR/.zshrc
