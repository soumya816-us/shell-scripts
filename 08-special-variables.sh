#!/bin/bash
#--------special variables-----

echo " All the Variables passed :: $@ "

echo " Number of Variables:: $# "

echo "script Name:: $0 "

echo " Present working directory:: $PWD "

echo " Home directory current User :: $HOME "

echo " which user is running the script :: $USER "

echo " process id of current script :: $$ "

sleep 60 &

echo "process id of last command in background :: $! "