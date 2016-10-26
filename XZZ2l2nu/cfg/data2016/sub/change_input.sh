#!/bin/sh

dir=dt12_v2
#dir=dt3_truncated
#dir=dt3

#tag="Single"
#tag="SingleElectron_"
#tag="SingleMuon_"
tag="MET_"
#from="eoscms.cern.ch\/\/eos\/cms"
#to="cms-xrd-global.cern.ch\/"
#from="cms-xrd-global.cern.ch"
#to="cmsxrootd.fnal.gov"
#to="xrootd-cms.infn.it"
#from="xrootd-cms.infn.it"
from="cmsxrootd.fnal.gov"
to="cms-xrd-global.cern.ch"

cd $dir

for dd in ${tag}*; 
do
  cd $dd
  sed "s/${from}/${to}/g" config.pck > config.pck.new 
  mv config.pck.new config.pck
  cd ..
done

cd ..