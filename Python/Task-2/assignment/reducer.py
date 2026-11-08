#!/usr/bin/env python3
import sys
    
# Student ID: <Replace with your ID number>

# This reducer just sums up the counts of each key and will
# require significant changes to meet the assignment requirements.
       
counts = {}
current_key=None
# input comes from STDIN
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()

    # parse the input we got from mapper.py, splitting on tabs
    (key,word) = line.split('\t')

    if current_key==None : current_key=key

    if current_key==key:
        if (word in counts):
            counts[word] += 1
        else:
            counts[word] = 1
    else:
        most_repeat=sorted(counts.items(), key=lambda x: -x[1])[0]
        print(f"{current_key}\t{most_repeat[0]}[{most_repeat[1]}]")
        counts={}
        current_key=key

most_repeat=sorted(counts.items(), key=lambda x: -x[1])[0]
print(f"{current_key}\t{most_repeat[0]}[{most_repeat[1]}]")