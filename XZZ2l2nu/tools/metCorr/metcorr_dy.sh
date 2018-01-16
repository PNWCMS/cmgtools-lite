#!/bin/sh

#inputs
inputdir=/afs/cern.ch/work/t/tocheng/Heppy/CMSSW_8_0_26_patch1/src/CMGTools/XZZ2l2nu/cfg/mc80x/sub/DySamplesCleanWithZ
outputdir=DySamplesCleanWithZ
config=config/parameters_light

mkdir -p ${outputdir}

gmake all

njob="0"

for infile in $(ls $inputdir/*.root | grep  DYJetsToLL ); 
do
  echo "+++ skimming $infile +++"
  outfile="${outputdir}/${infile/$inputdir\//}"
  #echo "outfile $outfile"

  # options for outputs
  #outfile="${outfile/\/vvTreeProducer\/tree/}"

  inSkimFile=${infile%.root}
  inSkimFile=${inSkimFile}/skimAnalyzerCount/SkimReport.txt
  #echo "inSkimFile $inSkimFile"

  AllEvents=`grep "All Events" ${inSkimFile} | awk {'print $3'}`
  SumWeights=`grep "Sum Weights" ${inSkimFile} | awk {'print $3'}`

  if [ -z $AllEvents ]; then
    echo Fail to get All Events from file ${inSkimFile}
    continue
  fi
  if [ -z $SumWeights ]; then
    SumWeights=$AllEvents
  fi

  echo -- Input file: $infile
  echo -- Output file: $outfile
  echo -- AllEvents: $AllEvents , SumWeights: $SumWeights
  echo -- Selection: $selection
  echo -- Command: ./bin/metcorr.exe $config $infile $outfile $AllEvents $SumWeights

  ./bin/metcorr.exe $config $infile $outfile $AllEvents $SumWeights &> ${outfile}.skim.log &

  #njob=$(( njob + 1 ))
  #if [ "$njob" -eq "200" ]; then
   ## wait
   # njob="0"
  #fi

done

