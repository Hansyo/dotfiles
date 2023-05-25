#!/bin/zsh

# スクリプトのあるディレクトリを参照する
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
# DOTFILESをここに設定する
export DOTFILES=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# OS毎に固有のコマンドを利用する。
case "$OSTYPE" in
    linux*)
        LN_OPTION_DIR=-sd
        LN_OPTION_FILE=-sf
        ;;
    darwin*)
        LN_OPTION_DIR=-s
        LN_OPTION_FILE=-sf
        ;;
esac



# すべてのディレクトリについて、適切な場所にシンボリックリンクを貼る
IGNORES=".git|.vim/" # リンクから除外すべきものはきちんと指定する
DIRS=`find ${SCRIPT_DIR} -mindepth 1 -type d -printf '%P\n'|grep -vE "${IGNORES}"`
for dir in ${(f)DIRS};do
    if [[ -e ${HOME}/${dir} ]];then
        echo "Skip(Exist) ${dir}"
    else
        # ディレクトリが存在しない場合のみ、リンク
        echo "linking ${SCRIPT_DIR}/${dir} -> ${HOME}/${dir}"
        ln ${LN_OPTION_DIR} ${SCRIPT_DIR}/${dir} ${HOME}/${dir}
    fi
done


# dotfiles直下のファイルをリンク
IGNORE_FILES=".git"
FILES=`find ${SCRIPT_DIR} -maxdepth 1 -type f -name '.*' -printf '%P\n'|grep -vE "${IGNORE_FILES}"`
for f in ${(f)FILES};do
    if [[ -e ${HOME}/${f} ]];then
        echo "Skip(Exist) ${f}"
    else
        echo "linking ${SCRIPT_DIR}/${f} -> ${HOME}/${f}"
        ln ${LN_OPTION_FILE} ${SCRIPT_DIR}/${f} ${HOME}/${f}
    fi
done

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
        ln ${LN_OPTION_FILE} ${SOURCE} ${DEST}
    fi
done

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
        cp ${SOURCE} ${DEST}
    fi
done
