#!/bin/bash

# readlines from callsmall.txt
currentMax=0
currentMax2=0
currentMax3=0
currentTotal=0
placed=false
while read line; do
  # skip empty line
  if [ -z "$line" ]; then
    # else if set currentMax to currentTotal if currentTotal is bigger
    if [ "$currentTotal" -gt "$currentMax" ]; then
      currentMax3=$currentMax2
      currentMax2=$currentMax
      currentMax=$currentTotal

      placed=true
    fi

    # if currentTotalt is greater than currentMax2 and placed is false
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
    continue
  fi

  currentTotal=$(($currentTotal + $line))

done < calories.txt

echo $currentMax
echo $currentMax2
echo $currentMax3

# add currentMax to currentMax2 to currentMax3
# echo result
echo "Total: $(($currentMax + $currentMax2 + $currentMax3))"