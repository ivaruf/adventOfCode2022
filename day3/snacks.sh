#!/bin/bash

# read lines in input.txt

pri=0
while read line; do
  length=${#line}
  # get first half chars
  first_half=${line:0:$((length/2))}
  # get second half chars
  second_half=${line:$((length/2)):length}

  # get chars that are both in first and second half
  common_chars=$(echo $first_half | grep -o . | grep -f <(echo $second_half | grep -o .) | sort | uniq)

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
done < input.txt
echo $pri