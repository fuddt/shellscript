#!/bin/bash


if [ -n "$1" ]; then
    select_txt=$1
else
    echo "Please select :word :error :diary :idea"
    echo -n "Your select..." && read USERINPUT
    select_txt=$USERINPUT 
fi

selecteditor=$2

diary_path="${HOME}/Diary/diary.txt"  # 日々の日記
error_path="${HOME}/Diary/error.txt"  # エラーのメモと対処
word_path="${HOME}/Diary/word.txt"  # 英単語の記録
idea_path="${HOME}/Diary/idea.txt"  # アイディアの記録


# 日時とタイトルの追記
case "$select_txt" in
    diary )
        filepath=$diary_path ;;

    error )
        filepath=$error_path ;;
        
    word )
        filepath=$word_path
        if [  "$selecteditor" == "vim" ]; then
            vim "$filepath"
        else
            code "$filepath"
        fi
        exit ;;
        
    idea )
        filepath=$idea_path ;;
    
    * )
        echo "not support:$1"
        exit 1 ;;
esac

echo -e "\n\n" >> "$filepath" && date '+%Y/%m/%d  %H:%M  Title  ' >> "$filepath"
if [  "$selecteditor" == "vim" ]; then
    vim "$filepath"
else
    code "$filepath"
fi

