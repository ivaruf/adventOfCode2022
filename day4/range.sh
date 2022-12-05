#!/bin/bash

count=0

while read line; do
    lines=$((lines+1))
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

    if ([ $min -ge $min2 ] && [ $max -le $max2 ]) || ([ $min2 -ge $min ] && [ $max2 -le $max ]) ; then
        count=$((count+1))
    fi
done < input.txt

echo count: $count

