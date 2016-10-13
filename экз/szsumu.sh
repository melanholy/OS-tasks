#!/bin/bash
b=0
for x in `sudo find / -type f -printf %s' '`; do
let b+=$x
done
echo $b bytes
