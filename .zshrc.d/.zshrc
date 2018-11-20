# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/saito/.zshrc'

##autoload -Uz compinit
##compinit
# End of lines added by compinstall
if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

source ~/.zshrc.hash
source ~/.zshrc.custom
source ~/.zshrc.laptop
source ~/.zshrc.usability
##source ~/.zshrc.tmux

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/student/j15/j15436/programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/student/j15/j15436/programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/student/j15/j15436/programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/student/j15/j15436/programs/google-cloud-sdk/completion.zsh.inc'; fi
