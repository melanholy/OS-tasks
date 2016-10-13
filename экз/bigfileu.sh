#!/bin/bash
find / -type f -printf %s'\n' | sort -gr | tr "\n" " " | cut -d " " -f 1
