fpath+=~/.zfunc

print_message=false
function _echo() {
    if $print_message; then
        echo $1
    elif [ $# -eq 2 ]; then
        if $2; then echo $1; fi
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
if [[ $(uname -r) =~ "arch" ]];then
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

unset print_message


# tmuxの起動スクリプト
function tmux-up () {
    if [[ ! -z $(which tmux) && ! -n $TMUX ]]; then
        # get the IDs
        sessions=$(tmux list-sessions)
        if [[ -z "$sessions" ]]; then # sessionがない場合、defaultを作る
            tmux new-session -ds default
            # defaultを含めるため、面倒だがもう一度取得
            sessions=$(tmux list-sessions)
        fi

        session_names=${${(f)sessions}%%:*}
        create_new_session="Create New Session"
        only_zsh="Avoid tmux"
        connect_server="ssh"
        SELECTOR=fzf

        S_SELECTOR="${sessions}\n${create_new_session}:\n${connect_server}:\n${only_zsh}:"
        result=$(echo $S_SELECTOR | $SELECTOR | cut -d: -f1)

        if [[ "$result" = "${create_new_session}" ]]; then
            # 新規セッションを作成
            echo -n "Session name?\n> "
            read result
            if [[ -z "$result" ]]; then
                tmux new-session && exit
            else
                tmux new-session -s $result && exit
            fi
        elif [[ ! -z $result && ${session_names[(I)${result}]} -ne 0 ]]; then
            # session名に含まれている場合
            tmux attach-session -t "$result" && exit
        elif [[ "$result" = "${connect_server}" ]]; then
            # tmuxでなく、SSHを起動する。
            if [[ -v SSH_LIST_TMUX ]]; then
                SSH_LIST="${SSH_LIST_TMUX}\n"
            else
                SSH_LIST=""
            fi
            SSH_LIST="${SSH_LIST}: Anything else."
            echo "Select server"
            result=$(echo $SSH_LIST | $SELECTOR | cut -d: -f1)
            # sshのオプションとサーバーを自分で指定する場合
            if [[ -z "$result" ]]; then
                echo -n "type (option and) server name\n> "
                read result
            fi
            ssh $result && exit
        fi
    fi
}

tmux-up
