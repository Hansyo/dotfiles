# 色を使用できるようにする
autoload -Uz colors
colors

# プロンプトの設定
## PROMPT内での変数展開を行う
setopt PROMPT_SUBST
## Dummy gitprompt
gitprompt(){}
## 実際の見た目
PROMPT='
%D %*
%F{blue}${VIRTUAL_ENV##*/}%f%(1l. .)%d
%#%F{cyan}%m%f%(?.%F{white}$%f.%F{yellow}[%?]%f%F{red}$%f) '
RPROMPT='$(gitprompt) '
## コマンド実行時に、再描画
re-prompt() {
  zle .accept-line
  zle .reset-prompt
}
zle -N accept-line re-prompt

# virtualenvでpromptを変更しない
export VIRTUAL_ENV_DISABLE_PROMPT=1
# setopt CLICOLOR=true
# zshの補完候補を色付けする
export LS_COLORS="no=00:fi=00:di=38;05;33:ln=38;05;45:or=01;36;41:ex=38;05;213"
case "$OSTYPE" in
    linux*) zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ;;
    darwin*)
		export LSCOLORS_ARRAY=(gx fx Cx dx Bx eg ed ab ag ac ad)
		export LSCOLORS=${(j::)LSCOLORS_ARRAY}
		zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
		;;
esac

# プラグインのsuggestionの色を変える 256色のカラーパレット
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

