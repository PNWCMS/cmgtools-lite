#!/bin/sh


g++ killdup.cc -o killdup.exe `root-config --cflags` `root-config --libs`

#inputs
#infile=/home/heli/XZZ/80X_20160825/SingleEMU_Run2016BCD_PromptReco/vvTreeProducer/tree.root
#outfile=/home/heli/XZZ/80X_20160825/SingleEMU_Run2016BCD_PromptReco/vvTreeProducer/tree_killdup.root
#infile=/data2/XZZ2/80X_20160905/SingleEMU_Run2016G_PromptReco/vvTreeProducer/tree.root
#outfile=/data2/XZZ2/80X_20160905/SingleEMU_Run2016G_PromptReco/vvTreeProducer/tree_killdup.root
#infile=/data2/XZZ2/80X_20161006/SingleEMU_Run2016B2G_PromptReco/vvTreeProducer/tree.root
#outfile=/data2/XZZ2/80X_20161006/SingleEMU_Run2016B2G_PromptReco/vvTreeProducer/tree_killdup.root
#infile=/data2/XZZ2/80X_20161018/SingleEMU_Run2016B2H29fbinv_PromptReco/vvTreeProducer/tree.root
#outfile=/data2/XZZ2/80X_20161018/SingleEMU_Run2016B2H29fbinv_PromptReco/vvTreeProducer/tree_killdup.root
#infile=/home/heli/XZZ/80X_20161029/SingleEMU_Run2016B2H_ReReco_33fbinv/vvTreeProducer/tree.root
#outfile=/home/heli/XZZ/80X_20161029/tree_killdup.root
infile=/home/heli/XZZ/80X_20161029/SingleEMU_Run2016B2H_ReReco_36p1fbinv/vvTreeProducer/tree.root
outfile=/home/heli/XZZ/tree_killdup.root


echo -- Command: ./killdup.exe $infile $outfile
./killdup.exe $infile $outfile

