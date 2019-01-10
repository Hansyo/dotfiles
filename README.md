# Hansyのdotfilesへようこそ

## Vimについて
こちらの設定ファイルでは、NeoVim + deinを前提としています。
ご了承ください

## emacsについて
このリポジトリでは、submoduleを使ってemacsの設定を管理しています。
使用する際は、
` git clone --recursive https://github.com/Hansyo/dotfiles.git `
のように`recursive`オプションをclone時につけるか、
clone後に、
```
git submodule init
gti submodule update
```
として、submoduleの更新をするようにしてください。
でないと、中身が空のままになってしまいます。
