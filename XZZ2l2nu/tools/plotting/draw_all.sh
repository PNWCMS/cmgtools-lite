#!/bin/sh


#tag="Test1_DataB2H36p1fbinv_RcDataB2H36p1fbinv_"
#tag="Test1_DataB2H36p1fbinv_RcDataB2H36p1fbinvRhoCut_"
#tag="DataB2H36p1fbinv_RcDataB2H36p1fbinv_"
tag="Test1_DataB2H36p1fbinv_NoRecoilZJets_"
#tag="DataB2H36p1fbinv_NoRecoilZJets_"
#tag="ForRhoWeight_DataB2H33fbinv_"
#channels="mu"
channels="all mu el"
#cutChains="tight tightzpt100 tightzpt100met50"
#cutChains="tightzpt100 tightzpt100met50"
cutChains="tight"
#cutChains="tightzptlt200"
#blind="--Blind"
#logy="--LogY"
logdir="log_b2h36p1fbinv"

#./stack_dtmc_skim.py -l -b -q  --tag="Test_DataB2G_ICHEPcfg_" --cutChain="tight" --channel="mu" --Blind --LogY --test


for cutChain in $cutChains;
do
   for channel in $channels;
   do
#      ./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --Blind --LogY &> ${logdir}/${tag}${cutChain}_bld_log_${channel}.log &
      #./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --Blind &> ${logdir}/${tag}${cutChain}_bld_${channel}.log &
#      ./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --LogY &> ${logdir}/${tag}${cutChain}_log_${channel}.log &
      #./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" &> ${logdir}/${tag}${cutChain}_${channel}.log &
      #./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --test &> ${logdir}/${tag}${cutChain}_${channel}.log &
      ./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --LogY  --test &> ${logdir}/${tag}${cutChain}_${channel}.log &
      ./stack_dtmc_skim.py -l -b -q  --tag="$tag" --cutChain="$cutChain" --channel="$channel" --LogY --Blind  --test &> ${logdir}/${tag}${cutChain}_${channel}.log &

   done
done
