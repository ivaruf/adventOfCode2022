#!/bin/bash
# Round 1 + 2
sed 's?A X?4?g;s?A Y?8?g;s?A Z?3?g;s?B X?1?g;s?B Y?5?g;s?B Z?9?g;s?C X?7?g;s?C Y?2?g;s?C Z?6?g' input.txt | awk '{sum+=$1} END {print sum}'


#&& sed 's?A X?3?g' input.txt | sed 's?A Y?4?g' | sed 's?A Z?8?g' | sed 's?B X?1?g' | sed 's?B Y?5?g' | sed 's?B Z?9?g' | sed 's?C X?2?g' | sed 's?C Y?6?g' | sed 's?C Z?7?g' | awk '{sum+=$1} END {print sum}'