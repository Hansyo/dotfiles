_echo '  start set PATH'
## export(PATH)関連
export PYTHONPATH=/usr/local/lib/python3.6/dist-packages:$PYTHONPATH
export XDG_CONFIG_HOME=~/.config
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PGDATA=/usr/local/var/postgres
export LESS='-R' #lessコマンドを常時カラー表示できるようにする
export LANGUAGE=ja
export DOTFILES=${HOME}/dotfiles # dotfilesを設定しておく

_echo '  start alias'
# alias関連
#alias touchpad-disable='xinput disable 12'
#alias touchpad-enabe='xinput enable 12'
#alias touchpad-on-off='touchpad-on-off.sh'
alias reload='exec zsh'
alias more='\less -R'
alias rm='\rm -i'
alias cp='\cp -i'
alias ls='\ls --color=always'

_echo '  start compinit'
## 関連して、間違ったら修正を表示
setopt correct

# ヒストリの設定
## ヒストリの共通化
setopt share_history

### 場所
HISTFILE=$ZDOTDIR/.zsh_history

### 個数
HISTSIZE=1000000
SAVEHIST=1000000


### 重複したら古いコマンドを消す
#### どちらかを選択すれば良い
setopt hist_ignore_all_dups # 過去の全履歴をみて消す(下を包含)
# setopt hist_ignore_dups # 前回と同じコマンドのみ削除する

### スペースで始まるコマンドを履歴に残さない
setopt hist_ignore_space

### historyコマンドはhistに入れない
setopt hist_no_store

### 余分な空白は詰める
setopt hist_reduce_blanks

_echo '  start pushd'
# cdしたら自動でpushdする
setopt auto_pushd

_echo '  start bindkey'
# bindey関連
## emacs風のキーバインド
bindkey -e

## その他のキーバインド

_echo '  start user_Made'

# exportのもろもろ
export EDITOR='nvim'
export VISUAL='nvim'

