#!/bin/bash
inputFile=$1
while read LINE
do
    echo "Downloading $LINE ..."
    nm=`echo $LINE | awk -F/ '{print $NF}'`
    #echo "File name is $nm"
    directoryName=${inputFile%/*}
    #echo "Directory name is $directoryName"
    outputPath=${directoryName}/${nm}
    #echo "output path is $outputPath"
    curl $LINE > $outputPath
done < $inputFile
