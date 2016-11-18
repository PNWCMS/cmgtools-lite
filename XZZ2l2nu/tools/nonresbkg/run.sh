#! /bin/bash
runtag(){
tags='zveto full_log_blind metzpt30 metzpt50 metzpt100 sigall_log_blind sigzpt100_log_blind sigpt100_log_blind'

for itag in $tags
do
    echo "command: $1 $itag"
    python $1 $itag >$1_$itag.log &
done
}
if [ -z "$1" ]
then
    echo -e "\n$0 script1 [script2]  [script3] ...\n"
    exit
fi
for whatscript in $*
do
    runtag $whatscript
done

