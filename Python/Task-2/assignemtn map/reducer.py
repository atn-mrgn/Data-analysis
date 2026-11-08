#!/usr/bin/env python3
import sys
    
# Student ID: <Replace with your ID number>

# This reducer just sums up the counts of each key and will
# require significant changes to meet the assignment requirements.
       
counts = {}
current_key = None

# input comes from STDIN
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()

    # parse the input we got from mapper.py, splitting on tabs
    (key,sum) = line.split('\t')

    if current_key == None: current_key = key
	
    # convert sum to an int
    count = int(sum)

    if current_key == key:
        if (key in counts):
            counts[key] = counts[key] + count
        else:
            counts[key] = count
    else:
        print("%s\t%s" % (current_key,counts[current_key]))
        counts = {}
        counts[key] = count
        current_key = key

# Make sure we print out the last key used
print("%s\t%s" % (current_key,counts[current_key]))
