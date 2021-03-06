#!/bin/sh


#tag="ForZPtScale_GJetsStdPtScale_DataB2H29fbinv_ICHEPcfg_"
#tag="Test_GJets_DataB2H29fbinv_ICHEPcfg_"
tag="GJetsStdPtScaleElCorrScale_DataB2H29fbinv_ICHEPcfg_"

#tag="ForZPtScale_GJets_DataB2H29fbinv_ICHEPcfg_"
#tag="Test_GJets_DataB2H29fbinv_ICHEPcfg_"
#tag="GJets_DataB2H29fbinv_ICHEPcfg_"
channels="all mu el"
#cutChains="tightzpt50 tightzpt100 tightzpt100met50"
#cutChains="tightzpt100 tightzpt100met50"
cutChains="tightzpt50"
#cutChains="tightzptgt50lt200"
#blind="--Blind"
#logy="--LogY"
#Test=""
logdir="log_b2h29fbinv"

#./stack_dtmc_skim.py -l -b -q  --tag="Test_DataB2G_ICHEPcfg_" --cutChain="tight" --channel="mu" --Blind --LogY --test


for cutChain in $cutChains;
do
   for channel in $channels;
   do
      ./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --Blind --LogY &> ${logdir}/${tag}${cutChain}_bld_log_${channel}.log &
      #./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --Blind &> ${logdir}/${tag}${cutChain}_bld_${channel}.log &
      ./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --LogY &> ${logdir}/${tag}${cutChain}_log_${channel}.log &
      #./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" &> ${logdir}/${tag}${cutChain}_${channel}.log &
      #./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --test &> ${logdir}/${tag}${cutChain}_${channel}.log &
      #./stack_dtmc_skim_gjets_dt.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --LogY  --test &> ${logdir}/${tag}${cutChain}_${channel}.log &

   done
done
