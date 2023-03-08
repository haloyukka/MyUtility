#!/bin/bash

# 引数が指定されているかをチェックする
if [ $# -eq 0 ]; then
    echo "Usage: ./create_project.sh [project_name]"
    exit 1
fi

# 引数の値を変数に代入する
project_name=$1

# ディレクトリを作成する
mkdir $project_name
cd $project_name

# 必要なディレクトリを作成する
mkdir src
mkdir dist
mkdir test
mkdir docs

# README.md ファイルを作成する
touch README.md
echo "# $project_name" > README.md

# .gitignore ファイルを作成する
touch .gitignore
echo "node_modules/" > .gitignore

# package.json ファイルを作成する
npm init -y

# メッセージを表示して終了する
echo "Project $project_name has been created."
