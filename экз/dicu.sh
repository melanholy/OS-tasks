#!/bin/bash
cat $1 | tr -d [:punct:] | tr 'A-Z' 'a-z' | tr " " "\n" | sort | uniq -c
