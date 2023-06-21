# arch linux only
if [[ $(uname -r) =~ "arch" ]];then
    _echo 'start arch' false
    source "${Z_DOT_DIR}/os/arch.zsh"
elif [[ $(uname -r) =~ "WSL2" ]]; then
    _echo 'start arch' false
    source "${Z_DOT_DIR}/os/wsl.zsh"
fi
