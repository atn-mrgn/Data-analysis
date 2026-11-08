#!/usr/bin/env bash

cat shortReviews.txt | ./mapper.py > mapout.txt
cat mapout.txt | ./combiner.py > comout.txt 
sort comout.txt | ./reducer.py > results.txt