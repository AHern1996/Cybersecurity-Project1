#!/bin/bash

date=$1
times=$2

for file in *_Dealer_schedule
do
   awk 'NR.2 {print FILENAME (NF?" ":"") $0}' $file
done |

   grep -E $date |
      grep -E $times |
      awk -F" " '{print $1,$3,$6,$7}'
