#!/bin/bash

count=0

while read line; do
    before=$(cut -d ',' -f 1 <<< $line)
    # split before on '-' and get first
    min=$(cut -d '-' -f 1 <<< $before)
    # split before on '-' and get second
    max=$(cut -d '-' -f 2 <<< $before)

    after=$(cut -d ',' -f 2 <<< $line)
    # split after on '-' and get first
    min2=$(cut -d '-' -f 1 <<< $after)
    # split after on '-' and get second
    max2=$(cut -d '-' -f 2 <<< $after)

    # put range of numbers in min and max into array range1
    range1=($(seq $min $max))
    # put range of numbers in min2 and max2 into array range2
    range2=($(seq $min2 $max2))

    # if any number in range1 is in range2, then count++
    for i in ${range1[@]}; do
        for j in ${range2[@]}; do
            if [ $i -eq $j ]; then
                count=$((count+1))
                break 2
            fi
        done
    done

done < input.txt

echo count: $count

