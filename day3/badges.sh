#!/bin/bash

pri=0
elf=1
rdy=false
while read line; do

  # if elf=1
  if [[ $elf -eq 1 ]]; then
    line1=$line
    # elf ++
    elf=$((elf + 1))
  elif [[ $elf -eq 2 ]]; then
    line2=$line
    elf=$((elf + 1))
  else
    line3=$line
    elf=1
    rdy=true
  fi

  # if rdy
  if [[ $rdy == true ]]; then
    # get common chars from line1 line2 line3
    common_chars=$(echo $line1 | grep -o . | grep -f <(echo $line2 | grep -o .) | grep -f <(echo $line3 | grep -o .) | sort | uniq)
      # if common_chars is upper case
      if [[ $common_chars =~ [A-Z] ]]; then
        ascii=$(printf '%d' "'$common_chars")
        # ascii - 38
        pri=$((pri + ascii - 38))
      fi
      # if common_chars is lower case
      if [[ $common_chars =~ [a-z] ]]; then
        ascii=$(printf '%d' "'$common_chars")
        # ascii - 96
        pri=$((pri + ascii - 96))
      fi
    rdy=false
  fi

done < input.txt
echo $pri