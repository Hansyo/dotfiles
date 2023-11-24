fpath+=~/.zfunc

# source を高速化(zcompileを使うことで、爆速になる)
function source {
  ensure_zcompiled $1
  builtin source $1
}
function ensure_zcompiled {
  local compiled="$1.zwc"
  if [[ ! -r "$compiled" || "$1" -nt "$compiled" ]]; then
    echo "\033[1;36mCompiling\033[m $1"
    zcompile $1
  fi
}
ensure_zcompiled "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc"

# zinit -> sheldon
## sheldon高速化の秘技
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/sheldon"
sheldon_cache="${cache_dir}/sheldon.zsh"
sheldon_tol="${XDG_CONFIG_HOME:-$HOME/.config}/sheldon/plugins.toml"
## キャッシュがない、またはキャッシュが古い場合にキャッシュを作成
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  mkdir -p $cache_dir
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
## 使い終わった変数を削除
unset cache_dir sheldon_cache sheldon_toml

# 万が一設定されていなかった場合のための保険
Z_DOT_DIR=${ZDOTDIR-~/.config/zsh}

# OS固有の設定
[ -f ${Z_DOT_DIR}/os/$(uname).zsh ] && source ${Z_DOT_DIR}/os/$(uname).zsh

# Need to compinit
# autoload -Uz compinit; compinit

# source $Z_DOT_DIR/local.zsh

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

zsh-defer unfunction source

# tmux-up
