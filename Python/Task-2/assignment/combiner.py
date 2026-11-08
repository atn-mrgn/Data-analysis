#!/usr/bin/env python3

import sys
import string

# Student ID: <Replace with your ID number>

# input comes from STDIN (standard input)
words=[]
scores=[]
for line in sys.stdin:
    (word, score)=line.strip().split('\t')
    words.append(word)
    scores.append(int(score))

for i in range(1,max(scores)+1):
    for j in range(len(scores)):
        if scores[j]==i:
            print('%s\t%s' % (i,words[j]))
    
