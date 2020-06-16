#!/bin/bash
echo "" >> $1
echo "********** Starting $0 ****************" >> $1
echo "Checking the size of the files contained on the backup drive..." >> $1
echo "Here is the list of drives: " >> $1
df -m >> $1

target_level=85
pct_val=`df -m | grep "G:" | awk '{print $5}' | sed s/.$//`
echo "Percent of drive capacity is $pct_val" >> $1
if [ $pct_val -gt $target_level ]; then
    echo "The current percent $pct_val is greater than $target_level, so will loop through and delete directories..." >> $1
    for dir in `find /cygdrive/g/ -maxdepth 1 -type d | grep '^/cygdrive/g/backup' | xargs ls -rtd1`
    do
        echo "Deleting directory $dir" >> $1
        rm -rf $dir
        echo "Directory $dir has been deleted" >> $1
        pct_val=`df -m | grep "G:" | awk '{print $5}' | sed s/.$//`
        echo "New percent of drive capacity is $pct_val" >> $1
        if [ $pct_val -le $target_level ]; then
            echo "$pct_val is less than or equal to $target_level.  Exiting script" >> $1
            echo "********** Ending $0 ****************" >> $1
            exit 0
        fi
        echo "$pct_val is NOT less than or equal to $target_level.  Looping again..." >> $1
    done
fi
echo "********** Ending $0 ****************" >> $1

