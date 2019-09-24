#! /bin/bash

CS375DIR=~/Dropbox/CS375_Compilers
AUTOGRADERDIR=$CS375DIR/autograder

copyifnotexist(){
    if [ ! -e "$1" ]; then
        cp $CS375DIR/cs375/$1 ./
    fi
}

cd p2_gradingDir

for entry in ./*
do
    cd $entry
    echo $entry
    for subentry in ./*
    do
        if [[ $subentry == *lexan*.l ]]; then
            mv $subentry lexan.l
        fi
        if [[ $subentry == *lex2*.l ]]; then
            mv $subentry lexan.l
        fi
    done
    cp $AUTOGRADERDIR/makefile ./
    copyifnotexist lexandr.c
    copyifnotexist token.h
    copyifnotexist lexan.h
    copyifnotexist scanner.c
    copyifnotexist printtoken.c
    copyifnotexist graph1.pas
    copyifnotexist graph1.lexer
    copyifnotexist scantst.pas
    copyifnotexist scantst.lexer
    copyifnotexist lexanl.c
    cd ..
done
