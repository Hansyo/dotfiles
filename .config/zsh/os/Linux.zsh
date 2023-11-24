# arch linux only
if [[ $(uname -r) =~ "arch" ]];then
    source "${Z_DOT_DIR}/os/arch.zsh"
elif [[ $(uname -r) =~ "WSL2" ]]; then
    source "${Z_DOT_DIR}/os/wsl.zsh"
fi
