# 自作関数
## 現在のPATHの一覧を表示
function echo_PATH() {
    echo $PATH | command sed -e "s/:/\n/g" | command sort
}

# gitのアカウントを登録する
# ~/.git-usersファイルを作り、そこに名前とメルアドを入れておく
function gituser-add () {
    if test ! $1;then
        echo "Please type 'gituser-add USERNAME'"
        return
    fi
    # ユーザー名で、~/.git-usersを検索する
	TARGET_STRING=$(grep $1 ~/.git-users)
    if test ! ${TARGET_STRING};then
        echo "$1 does not exist."
        return
    fi
    GIT_USER_ARRAY=(${(s.:.)TARGET_STRING})
    git config user.name "${GIT_USER_ARRAY[1]}"
    git config user.email "${GIT_USER_ARRAY[2]}"
    git config user.signingkey "${GIT_USER_ARRAY[3]}"
    git config --list | grep user
}

# gitignore.ioからデータ引っ張って来て、gitignoreを作ってもらう
function get-gitignore () {
    QUERY=$@
    echo ${QUERY// /,}
    curl -sSL https://gitignore.io/api/${QUERY// /,} >> .gitignore
}

# dotfilesにディレクトリを登録する
# いちいち、dotfilesにcpしてlnするのは面倒なので...
function regist-dot () {
    TARGET=$1
    CURRENT=$(pwd)
    if [[ ! $CURRENT = $HOME ]]; then
        H_C="${CURRENT#${HOME}/}/" # $HOMEからのファイルパス
    else
        H_C=""
    fi

    # lnのオプションを指定
    if test -f ${CURRENT}/${TARGET}; then
        case "$OSTYPE" in
            linux*) LN_OPT="-sf" ;;
            darwin*) LN_OPT="-s" ;;
        esac
    elif test -d ${CURRENT}/${TARGET}; then
        LN_OPT="-sd"
    else
        echo "not good pattern"
        return 1
    fi

    # DOTFILESからファイルを移動しリンク
    mkdir -p ${DOTFILES}/${H_C} # 必要ならディレクトリを生成(あったら無視される)
    mv ${TARGET} ${DOTFILES}/${H_C} # ファイルの移動 ↓リンク
    ln ${LN_OPT} ${DOTFILES}/${H_C}${TARGET} ${HOME}/${H_C}${TARGET}
}

