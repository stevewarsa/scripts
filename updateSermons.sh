#!/bin/bash
inputFile=/cygdrive/c/backup/code/Angular/angular-workspace/Bridgeway/WebContent/sermons.php
addline=0
audiolinecounter=1
while read LINE
do
    if (( addline == 1 )) 
    then
        audioline=`sed -n ${audiolinecounter},${audiolinecounter}p audio.txt`
        echo $audioline
        ((audiolinecounter++))
        addline=0
    fi
    echo $LINE
    if echo $LINE | grep "</h3>" >/dev/null; then
        addline=1
    fi 
done < $inputFile
