#!/bin/bash

# Round 2
rr="A X" # 4 points
rp="A Y" # 8 point
rs="A Z" # 3 point

pr="B X" # 1 point
pp="B Y" # 5 points
ps="B Z" # 9 points

sr="C X" # 7 points
sp="C Y" # 2 point
ss="C Z" # 6 points

# read input.txt line by line
points=0
while read line; do
  #if line is rr
  if [ "$line" = "$rr" ]; then
    points=$((points + 3))
  fi
  #if line is rp
  if [ "$line" = "$rp" ]; then
    points=$((points + 4))
  fi
  #if line is rs
  if [ "$line" = "$rs" ]; then
    points=$((points + 8))
  fi
  #if line is pr
  if [ "$line" = "$pr" ]; then
    points=$((points + 1))
  fi
  #if line is pp
  if [ "$line" = "$pp" ]; then
    points=$((points + 5))
  fi
  #if line is ps
  if [ "$line" = "$ps" ]; then
    points=$((points + 9))
  fi
  #if line is sr
  if [ "$line" = "$sr" ]; then
    points=$((points + 2))
  fi
  #if line is sp
  if [ "$line" = "$sp" ]; then
    points=$((points + 6))
  fi
  #if line is ss
  if [ "$line" = "$ss" ]; then
    points=$((points + 7))
  fi
done < input.txt

echo $points