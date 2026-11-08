#!/usr/bin/env bash

cat ratedReviews.txt |python mapper.py > mapout.txt
cat mapout.txt |python combiner.py > comout.txt 
sort comout.txt |python reducer.py > results.txt