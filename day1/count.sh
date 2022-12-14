#!/bin/bash

topElf=0 topElf2=0 topElf3=0 currentElfCalories=0

while read line; do
  # Empty line is new elf
  if [ -z "$line" ]; then
    if [ "$currentElfCalories" -gt "$topElf" ]; then
      topElf3=$topElf2
      topElf2=$topElf
      topElf=$currentElfCalories
    elif [ "$currentElfCalories" -gt "$topElf2" ]; then
      topElf3=$topElf2
      topElf2=$currentElfCalories
    elif [ "$currentElfCalories" -gt "$topElf3" ]; then
      topElf3=$currentElfCalories
    fi
    currentElfCalories=0
  else
    currentElfCalories=$(($currentElfCalories + $line))
  fi
done < calories.txt

echo "Top elves:" $topElf $topElf2 $topElf3
echo "Total:     $(($topElf + $topElf2 + $topElf3))"