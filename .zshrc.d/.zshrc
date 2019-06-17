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
source ~/.zshrc.d/.zshrc_usability
_echo 'end .zshrc_usability'
_echo 'start .zshrc_looks'
# 見た目関連
source ~/.zshrc.d/.zshrc_looks
_echo 'end .zshrc_looks'

# zplug
_echo 'start .zshrc_zplug' false
source ~/.zshrc.d/.zshrc_zplug
_echo 'end .zshrc_zplug' false

# zkbd
_echo 'start .zshrc_zkbd' false
source ~/.zshrc.d/.zshrc_zkbd
_echo 'end .zshrc_zkbd' false

# hash
_echo 'start .zshrc_hash' false
source ~/.zshrc.d/.zshrc_hash
_echo 'end .zshrc_hash' false

# arch linux only
if test $(uname -n) = "archlinux";then
  _echo 'start .zshrc_arch' false
  source ~/.zshrc.d/.zshrc_arch
  _echo 'end .zshrc_arch'
fi
