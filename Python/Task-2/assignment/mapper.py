#!/usr/bin/env python3

#!/usr/bin/env python3

import sys
import re
import string

with open("exclude.txt", "r") as file:
        excluded  = file.readlines()
        
excluded = [i.replace("\n","") for i in excluded]

def eprint(*args, **kwargs):
    print(args,file=sys.stderr,**kwargs)

def clean_text(text):
    text = text.lower()
    text = re.sub("\'s", " ", text)
    text = re.sub(" whats ", " what is ", text, flags=re.IGNORECASE)
    text = re.sub("\'ve", " have ", text)
    text = re.sub("can't", "can not", text)
    text = re.sub("n't", " not ", text)
    text = re.sub("i'm", "i am", text, flags=re.IGNORECASE)
    text = re.sub("\'re", " are ", text)
    text = re.sub("\'ll", " will ", text)
    text = re.sub("e\.g\.", " eg ", text, flags=re.IGNORECASE)
    text = re.sub("b\.g\.", " bg ", text, flags=re.IGNORECASE)
    
    text = text.replace("\"", " ")
    text = text.replace("'", " ")
    text = text.replace("-", " ")
    

    return text

line = "blank"
nopunc = line.maketrans("","",";()/.\,!:%?{}_|*[]#~`@=><")

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading, trailing whitespace and force to lower case
    line = line.strip()
 
    # remove punctuation marks and split up the line
    
    (review,score) = line.split('\t')
    review=clean_text(review)
    words = review.translate(nopunc).split()
    words=[w for w in words if w not in excluded]
    # Print the type and sentiment
    # Note that this is not the required output for a valid solution
    # and will just print out the first review word with the score.
    # You will need to change the code from this point onward to meet the
    # assignment requirements.
    for word in words:
        print('%s\t%s' % (word,score))
        