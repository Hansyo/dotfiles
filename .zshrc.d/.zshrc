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

# hash
_echo 'start .zshrc_hash' false
#source ~/.zshrc.d/.zshrc_hash
_echo 'end .zshrc_hash' false

# arch linux only
if test $(uname -n) = "archlinux";then
  _echo 'start .zshrc_arch' false
  source ~/.zshrc.d/.zshrc_arch
  _echo 'end .zshrc_arch'
fi

### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

# zplug -> zplugin へ移行
_echo 'start .zshrc_zplugin' false
source ~/.zshrc.d/.zshrc_zplugin
_echo 'end .zshrc_zplugin' false

zplugin ice wait'!0'
zplugin snippet "${HOME}/.zshrc.d/.zshrc_usability"
zplugin ice wait'!0'
zplugin snippet "${HOME}/.zshrc.d/.zshrc_zkbd"
zplugin ice wait'!0'
zplugin snippet "${HOME}/.zshrc.d/.zshrc_hash"
