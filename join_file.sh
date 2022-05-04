#!/bin/bash


(while IFS= read -r a <&3 && IFS= read -r b <&4;
do
echo "$a"
echo "$b"
done) 3<file1.txt 4<file2.txt
