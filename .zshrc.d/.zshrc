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

# local settings
source ~/.zshrc.d/.zshrc_local

_echo 'start .zshrc_usability'
# コマンド関連
#source ~/.zshrc.d/.zshrc_usability
_echo 'end .zshrc_usability'
_echo 'start .zshrc_looks'
# 見た目関連
source ~/.zshrc.d/.zshrc_looks
_echo 'end .zshrc_looks'

# zkbd
_echo 'start .zshrc_zkbd' false
#source ~/.zshrc.d/.zshrc_zkbd
_echo 'end .zshrc_zkbd' false


# arch linux only
if test $(uname -n) = "archlinux";then
  _echo 'start .zshrc_arch' false
  source ~/.zshrc.d/.zshrc_arch
  _echo 'end .zshrc_arch'
fi

### Added by zinit's installer
if [[ ! -d $HOME/.zinit/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing zinit…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma-continuum/zinit.git $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit installer's chunk

# zplug -> zinit へ移行
_echo 'start .zshrc_zinit' false
source ~/.zshrc.d/.zshrc_zinit
_echo 'end .zshrc_zinit' false

zinit ice wait'!0'
zinit snippet "${ZDOTDIR}/.zshrc_usability"
zinit ice wait'!0'
zinit snippet "${ZDOTDIR}/.zshrc_zkbd"

if $(uname -r | grep Microsoft > /dev/null); then
  umask 022
  export DISPLAY=:0
  export GPG_TTY=$(tty)
  export PATH=$HOME/.poetry/bin:$PATH
fi


# tmuxの自動起動
if [[ ! -v IS_QUESTION_ALREADY_DONE && ! -z `which tmux` ]]; then
	IS_QUESTION_ALREADY_DONE="true"
	if [[ ! -n $TMUX ]]; then
		# get the IDs
		S_SELECTOR="`tmux list-sessions`"
		if [[ -z "$S_SELECTOR" ]]; then # sessionがない場合、defaultを作る
			tmux new-session -ds default
			S_SELECTOR="`tmux list-sessions`" # defaultを含めるため、面倒だがもう一度取得
		fi

		create_new_session="Create New Session"
		only_zsh="Avoid tmux"
		connect_server="ssh"
		PERCOL=fzf

		S_SELECTOR="$S_SELECTOR\n${create_new_session}:\n${connect_server}:\n${only_zsh}:"
		S_SELECTOR="`echo $S_SELECTOR | $PERCOL | cut -d: -f1`"

		if [[ "$S_SELECTOR" = "${create_new_session}" ]]; then
			echo -n "Session name?\n> "
			read S_SELECTOR
			if [[ -z "$S_SELECTOR" ]]; then tmux new-session && exit
			else tmux new-session -s $S_SELECTOR && exit; fi
		elif [[ "$S_SELECTOR" = "${only_zsh}" ]]; then :  # Start terminal normally
		elif [[ "$S_SELECTOR" = "${connect_server}" ]]; then
			# tmuxがSSH先のサーバーにいる場合、こちらを使ったほうが良い
			# 理由として、自端末側のtmuxのバインドが優先されてしまうためなどがある。
			echo "Select server"
			if [[ -v SSH_LIST_TMUX ]]; then S_SELECTOR="${SSH_LIST_TMUX}\n";
			else S_SELECTOR=""; fi
			S_SELECTOR="${S_SELECTOR}: Anything else."
			S_SELECTOR="`echo $S_SELECTOR | $PERCOL | cut -d: -f1`"

			if [[ -z "$S_SELECTOR" ]]; then # sshのオプションとサーバーを自分で指定する場合
				echo -n "type (option and) server name\n> "
				read S_SELECTOR
			fi
			ssh $S_SELECTOR && exit
		elif [[ -n "$S_SELECTOR" ]]; then tmux attach-session -t "$S_SELECTOR" && exit;
		else :; fi  # Start terminal normally
	fi
fi
