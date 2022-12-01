#!/bin/bash

topElf=0
topElf2=0
topElf3=0
currentElfCalories=0

placed=false

while read line; do
  # Empty line is new elf
  if [ -z "$line" ]; then
    if [ "$currentElfCalories" -gt "$topElf" ]; then
      topElf3=$topElf2
      topElf2=$topElf
      topElf=$currentElfCalories
      placed=true
    fi

    if [ "$currentElfCalories" -gt "$topElf2" ] && [ "$placed" = false ]; then
      topElf3=$topElf2
      topElf2=$currentElfCalories
      placed=true
    fi

    if [ "$currentElfCalories" -gt "$topElf3" ] && [ "$placed" = false ]; then
      topElf3=$currentElfCalories
    fi

    currentElfCalories=0
    placed=false
  else
    currentElfCalories=$(($currentElfCalories + $line))
  fi

done < calories.txt

echo $topElf
echo $topElf2
echo $topElf3

echo "Total: $(($topElf + $topElf2 + $topElf3))"