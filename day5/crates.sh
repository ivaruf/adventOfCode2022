#!/bin/bash

# read first 9 lines of input.txt

stack1=GBDCPR
stack2=GVH
stack3=MPJDQSN
stack4=MNCDGLSP
stack5=SLFPCNBJ
stack6=STGVZDBQ
stack7=QTFHMZB
stack8=FBDMC
stack9=GQCF

# put all stacks in an array
stacks=($stack1 $stack2 $stack3 $stack4 $stack5 $stack6 $stack7 $stack8 $stack9)

tail +11 input.txt > moves.txt

count=0
while read line; do
  # column 2 is amt
  amt=$(echo $line | cut -d ' ' -f 2)
  # column 4 is from
  from=$(echo $line | cut -d ' ' -f 4)
  #from is from -1
  from=$((from - 1))
  # column 6 is to
  to=$(echo $line | cut -d ' ' -f 6)
  # to is to -1
  to=$((to - 1))

  from_stack=${stacks[$from]}
  moving=$(echo $from_stack | cut -c 1-"$amt" | rev)
  stacks[$from]=$(echo $from_stack | cut -c "$((amt + 1))"-)
  stacks[$to]="$moving${stacks[$to]}"

done < moves.txt

# for each stack in stacks print first char
for stack in "${stacks[@]}"; do
  # echo first char of stack no newline
  echo -n $(echo $stack | cut -c 1)
done
