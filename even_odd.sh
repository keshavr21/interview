#!/bin/bash

declare -a even_list=()
declare -a odd_list=()

for i in $*
do
  if [ `expr $i % 2` == 0 ];
  then
      even_list+=($i)
  else
      odd_list+=($i)
  fi
done

echo "list of even numbers: ${even_list[@]}"
echo "list of odd  numbers: ${odd_list[@]}"
