#!/bin/sh

channel="mu"
#channel="el"
tag="_v2"
masses="800 1000 1200 1400 1600 1800 2000 2500 3000 3500 4000 4500"

for mass in $masses;
do
  left="../sync_${channel}${tag}/BulkGravToZZToZlepZhad_narrow_${mass}/XZZDumpEvtList/eventlist.txt"
  right="sync_${channel}${tag}/eventlist_BulkGravToZZToZlepZhad_narrow_${mass}.txt"
  echo "# ${channel} channel, M ${mass} :"
  cp $left $right
done


