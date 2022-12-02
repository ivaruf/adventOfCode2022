#!/bin/bash

#Replace newline with x
sed 's?^$?x?g' input.txt

# Translate newline followed by x to + followed by newline
tr '\nx' '+\n'

# remove trailing and leading + signs
sed -r 's?^\+|\+$??g'; echo ''

# run it through bc, will give sum
bc

# sort it
sort -n

# get last 3
tail -n 3

# put them on one line
tr '\n' ' '

# and awk the output
awk '{print $3; print $1+$2+$3}'

(sed 's?^$?x?g' calories.txt | tr '\nx' '+\n' | sed -r 's?^\+|\+$??g') | bc | sort -n | tail -n 3 | tr '\n' ' ' | awk '{print $3; print $1+$2+$3}'