#!/bin/sh

# スクリプトのあるディレクトリを参照する
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
# DOTFILESをここに設定する
export DOTFILES=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# リンクから除外すべきものはきちんと指定する
IGNORES=".git|.vim/"

# すべてのディレクトリについて、適切な場所にシンボリックリンクを貼る
DIRS=`find ${SCRIPT_DIR} -mindepth 1 -type d -printf '%P\n'|grep -vE "${IGNORES}"`
for dir in ${(f)DIRS};do
	if [[ -e ${HOME}/${dir} ]];then
		echo "Skip(Exist) ${dir}"
	else
		# ディレクトリが存在しない場合のみ、リンク
		echo "linking ${SCRIPT_DIR}/${dir} -> ${HOME}/${dir}"
		echo "ln -sd ${SCRIPT_DIR}/${dir} ${HOME}/${dir}"
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
		ln -sf ${SCRIPT_DIR}/${f} ${HOME}/${f}
	fi
done

# 個別ファイルのリンクとコピー
LINKS=`tail -n -1 ${SCRIPT_DIR}/link.list`
for f in ${(f)LINKS};do
	ARY=(`echo ${f} | tr -s ':' ' '`)
	SOURCE=$(eval echo ${ARY[1]})
	DEST=$(eval echo ${ARY[2]})
	if [[ -e ${DEST} ]];then
		echo "Skip(Exist) ${DEST}"
	else
		echo "linking ${SOURCE} -> ${DEST}"
		ln -sf ${SOURCE} ${DEST}
	fi
done

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
