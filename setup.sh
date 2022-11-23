#!/usr/bin/env bash
set -eu

COLOR_RED="\033[0;31m"
COLOR_RESET="\033[0m"

echo ">>> update setup project"
git fetch origin

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "your branch is up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "your branch is behind your tracking branch"
    echo "I pull and rerun the script "
    git pull
    ./$0
    exit $?
elif [ $REMOTE = $BASE ]; then
    echo "your branch is ahead of your tracking branch"
    echo "remember to push your changes but I will run the script anyway"
else
    echo "your branch and your tracking remote branch have diverged"
    echo "resolve all conflicts before rerunning the script"
    exit 1
fi

if [ ! -e config.sh ]; then
    echo "first configure your build:"
    echo "cp config.sh.template config.sh"
    echo "edit config.sh"
    exit -1
fi

source config.sh

CUR=`pwd`

function remote {
    if $HTTPS; then
        echo "https://github.com/$1"
    else
        echo "git@github.com:$1"
    fi
}

function clone_or_update {
    branch=${3:-master}
    if [ ! -e "$2" ]; then
        echo ">>> clone $1/$2 $COLOR_RED($branch)$COLOR_RESET"
        echo -e "git clone --recursive `remote $1/$2.git` --branch $branch"
        git clone --recursive `remote $1/$2.git` --branch $branch
    else
        cd $2
        echo -e ">>> pull $1/$2 $COLOR_RED($branch)$COLOR_RESET"
        git fetch --tags origin
        git checkout $branch
        set +e
        git symbolic-ref HEAD
        if [ $? -eq 0 ]; then
            git pull
        fi
        set -e
        cd ..
    fi
    mkdir -p "$2"/build/
}

clone_or_update EnzymeAD Enzyme main