#!/bin/bash
t=$((`date +10#%H*360000+10#%M*6000+10#%S*100+10#%N/10000000`))
let t1=$t+$1*100
while [[ $t1 > $t ]]; do
t=$((`date +10#%H*360000+10#%M*6000+10#%S*100+10#%N/10000000`))
done
