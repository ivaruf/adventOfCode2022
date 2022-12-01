#!/bin/bash

# readlines from callsmall.txt
currentMax=0
currentMax2=0
currentMax3=0
currentTotal=0
placed=false
while read line; do
  # Empty line is new elf
  if [ -z "$line" ]; then
    if [ "$currentTotal" -gt "$currentMax" ]; then
      currentMax3=$currentMax2
      currentMax2=$currentMax
      currentMax=$currentTotal
      placed=true
    fi

    if [ "$currentTotal" -gt "$currentMax2" ] && [ "$placed" = false ]; then
      currentMax3=$currentMax2
      currentMax2=$currentTotal
      placed=true
    fi

    if [ "$currentTotal" -gt "$currentMax3" ] && [ "$placed" = false ]; then
      currentMax3=$currentTotal
    fi

    currentTotal=0
    placed=false
  else
    currentTotal=$(($currentTotal + $line))
  fi

done < calories.txt

echo $currentMax
echo $currentMax2
echo $currentMax3

# add currentMax to currentMax2 to currentMax3
# echo result
echo "Total: $(($currentMax + $currentMax2 + $currentMax3))"