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
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
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
