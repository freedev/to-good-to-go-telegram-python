#!/bin/bash


function my_readlink() {
  case "$OSTYPE" in
    solaris*) echo "SOLARIS" ;;
    darwin*)
       echo $(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
       ;;
    linux*)
       echo $(readlink -f $1)
        ;;
    bsd*)     echo "BSD" ;;
    *)        echo "unknown: $OSTYPE" ;;
  esac
}

BASE_DIR=$(my_readlink $(pwd))
cd $BASE_DIR
source ./.venv/bin/activate
TIMESTAMP=$(date "+%Y%m%d %H%M%S")
echo -n "$TIMESTAMP "
python3 main.py