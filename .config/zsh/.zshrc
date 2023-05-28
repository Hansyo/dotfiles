fpath+=~/.zfunc

print_message=false
function _echo() {
    if $print_message;then
        echo $1
    elif [ $# -eq 2 ];then
        if $2;then
            echo $1
        fi
    fi
}

# zinit -> sheldon
eval "$(sheldon source)"

# Need to compinit
autoload -Uz compinit; compinit

_echo 'start options'
# 基本的なオプション
source "${ZDOTDIR-~/.config/zsh}/options.zsh"

_echo 'start looks'
# 見た目関連
source "${ZDOTDIR-~/.config/zsh}/looks.zsh"

# arch linux only
if test $(uname -n) = "archlinux";then
  _echo 'start arch' false
  source "${ZDOTDIR-~/.config/zsh}/arch.zsh"
fi

# local settings
_echo 'start local'
source "${ZDOTDIR-~/.config/zsh}/local.zsh"

# os settings
if $(uname -r | grep Microsoft > /dev/null); then
  umask 022
  export DISPLAY=:0
  export GPG_TTY=$(tty)
  export PATH=$HOME/.poetry/bin:$PATH
fi

# auto renew command
zstyle ":completion:*:commands" rehash 1


# tmuxの起動スクリプト
function tmux-up () {
    if [[ ! -z $(which tmux) && ! -n $TMUX ]]; then
        # get the IDs
        S_SELECTOR=$(tmux list-sessions)
        if [[ -z "$S_SELECTOR" ]]; then # sessionがない場合、defaultを作る
            tmux new-session -ds default
            # defaultを含めるため、面倒だがもう一度取得
            S_SELECTOR=$(tmux list-sessions)
        fi

        create_new_session="Create New Session"
        only_zsh="Avoid tmux"
        connect_server="ssh"
        PERCOL=fzf

        S_SELECTOR="$S_SELECTOR\n${create_new_session}:\n${connect_server}:\n${only_zsh}:"
		S_SELECTOR=$(echo $S_SELECTOR | $PERCOL | cut -d: -f1)

        if [[ "$S_SELECTOR" = "${create_new_session}" ]]; then
            echo -n "Session name?\n> "
            read S_SELECTOR
            if [[ -z "$S_SELECTOR" ]]; then
                tmux new-session && exit
            else
                tmux new-session -s $S_SELECTOR && exit
            fi
        elif [[ -n "$S_SELECTOR" ]]; then
            tmux attach-session -t "$S_SELECTOR" && exit
        elif [[ "$S_SELECTOR" = "${connect_server}" ]]; then
            # tmuxがSSH先のサーバーにいる場合、こちらを使ったほうが良い
            # 自端末側のtmuxのバインドが優先されてしまうためなどがある。
            echo "Select server"
            if [[ -v SSH_LIST_TMUX ]]; then
                S_SELECTOR="${SSH_LIST_TMUX}\n";
            else
                commandS_SELECTOR="";
            fi
            S_SELECTOR="${S_SELECTOR}: Anything else."
			S_SELECTOR=$(echo $S_SELECTOR | $PERCOL | cut -d: -f1)
            # sshのオプションとサーバーを自分で指定する場合
            if [[ -z "$S_SELECTOR" ]]; then
                echo -n "type (option and) server name\n> "
                read S_SELECTOR
            fi
            ssh $S_SELECTOR && exit
        fi
    fi
}

tmux-up
