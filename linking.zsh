#!/bin/zsh

# スクリプトのあるディレクトリを参照する
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
# DOTFILESをここに設定する
export DOTFILES=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

LN_OPTION_DIR=-s
LN_OPTION_FILE=-s

# すべてのディレクトリについて、適切な場所にシンボリックリンクを貼る
IGNORES=".git|.vim/" # リンクから除外すべきものはきちんと指定する
DIRS=`find ${SCRIPT_DIR} -mindepth 1 -type d -printf '%P\n'|grep -vE "${IGNORES}"`
for dir in ${(f)DIRS};do
	# ディレクトリが存在しない場合のみ、リンク
    if [[ -e ${HOME}/${dir} ]];then
        echo "Skip(Exist) ${dir}"
    else
        echo "linking ${SCRIPT_DIR}/${dir} -> ${HOME}/${dir}"
        builtin ln ${LN_OPTION_DIR} ${SCRIPT_DIR}/${dir} ${HOME}/${dir}
    fi
done
unset IGNORES
unset DIRS

# dotfiles直下のファイルをリンク
IGNORE_FILES=".git"
FILES=`find ${SCRIPT_DIR} -maxdepth 1 -type f -name '.*' -printf '%P\n'|grep -vE "${IGNORE_FILES}"`
for f in ${(f)FILES};do
    if [[ -e ${HOME}/${f} ]];then
        echo "Skip(Exist) ${f}"
    else
        echo "linking ${SCRIPT_DIR}/${f} -> ${HOME}/${f}"
        builtin ln ${LN_OPTION_FILE} ${SCRIPT_DIR}/${f} ${HOME}/${f}
    fi
done
unset IGNORE_FILES
unset FILES

# 個別ファイルのリンク
LINKS=`tail -n -1 ${SCRIPT_DIR}/link.list`
for f in ${(f)LINKS};do
    ARY=(`echo ${f} | tr -s ':' ' '`)
    SOURCE=$(eval echo ${ARY[1]})
    DEST=$(eval echo ${ARY[2]})
    if [[ -e ${DEST} ]];then
        echo "Skip(Exist) ${DEST}"
    else
        echo "linking ${SOURCE} -> ${DEST}"
        builtin ln ${LN_OPTION_FILE} ${SOURCE} ${DEST}
    fi
done
unset LINKS

# 個別ファイルのコピー
COPYS=`tail -n -1 ${SCRIPT_DIR}/copy.list`
for f in ${(f)COPYS};do
    ARY=(`echo ${f} | tr -s ':' ' '`)
    SOURCE=$(eval echo ${ARY[1]})
    DEST=$(eval echo ${ARY[2]})
    if [[ -e ${DEST} ]];then
        echo "Skip(Exist) ${DEST}"
    else
        echo "copying ${SOURCE} -> ${DEST}"
        builtin cp ${SOURCE} ${DEST}
    fi
done
unset COPYS

unset SCRIPT_DIR
unset LN_OPTION_DIR
unset LN_OPTION_FILE
