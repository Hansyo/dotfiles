#!/bin/sh

# スクリプトのあるディレクトリを参照する
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# すべてのディレクトリについて、適切な場所にシンボリックリンクを貼る
for directory in `\find . -maxdepth 1 -type d`; do
	# ".",".git"以外のフォルダを見る
	if ! ( test ${directory} = "." || test ${directory:2} = ".git" ); then
		# ".config"のみ、再帰っぽく、もう一回おんなじことをやる
		if test ${directory:2} = ".config"; then
			cd .config
			for conf_d in `\find . -maxdepth 1 -type d`; do
				if ! test ${conf_d} = ".";then
					if [[ ! -h ${HOME}/.config/${conf_d:2} ]];then
						echo "linking ${SCRIPT_DIR}/${directory:2}/${conf_d:2} -> ${HOME}/${directory:2}/${conf_d:2}"
						ln -sd ${SCRIPT_DIR}/${directory:2}/${conf_d:2} ${HOME}/.config/${conf_d:2}
					fi
				fi
			done
			cd ..
		else
			if [[ ! -h ${HOME}/${directory:2} ]];then
				echo "linking ${SCRIPT_DIR}/${directory:2} -> ${HOME}/${directory:2}"
				ln -sd ${SCRIPT_DIR}/${directory:2} ${HOME}/${directory:2}
			fi
		fi
	fi
done

# 更に、個別に必要となりうるものは、全部手動でリンクする
ln -sf ${SCRIPT_DIR}/.zshrc.d/.zshrc ${HOME}/.zshrc

for f in `\find . -maxdepth 1 -type f`;do
  str=`echo $f | cut -c 3- `;
  if ( test `echo $str | cut -c 1` = "." && test $str != ".gitmodules" && test $str != ".gitignore" ); then
    ln -sf ${SCRIPT_DIR}/$str ${HOME}/$str
    echo "linking ${SCRIPT_DIR}/$str -> ${HOME}/$str"
  fi
done
