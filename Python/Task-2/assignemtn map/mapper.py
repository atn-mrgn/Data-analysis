#!/usr/bin/env python3

import sys
import string

# Student ID: <Replace with your ID number>

excluded = {"i","not","is","a","it","of","than"}

def eprint(*args, **kwargs):
    print(args,file=sys.stderr,**kwargs)

line = "blank"
nopunc = line.maketrans("","",";().,!?")

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading, trailing whitespace and force to lower case
    line = line.strip().lower()
    # remove punctuation marks and split up the line
    
    (review,score) = line.split('\t')
    words = review.translate(nopunc).split()

    # Print the type and sentiment
    # Note that this is not the required output for a valid solution
    # and will just print out the first review word with the score.
    # You will need to change the code from this point onward to meet the
    # assignment requirements.           
    print('%s\t%s' % (words[0],score))
        