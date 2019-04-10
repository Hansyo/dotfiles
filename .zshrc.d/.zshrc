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
source ~/.zshrc_usability
_echo 'end .zshrc_usability'
_echo 'start .zshrc_looks'
# 見た目関連
source ~/.zshrc_looks
_echo 'end .zshrc_looks'

# zplug
_echo 'start .zshrc_zplug' false
source ~/.zshrc_zplug
_echo 'end .zshrc_zplug' false
