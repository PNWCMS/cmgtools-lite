#! /bin/bash
runtag(){
tags='zveto full metzpt30 metzpt50 metzpt100'
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

