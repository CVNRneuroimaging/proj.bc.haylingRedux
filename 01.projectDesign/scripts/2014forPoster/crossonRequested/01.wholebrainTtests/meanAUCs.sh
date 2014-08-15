#!/bin/sh

# This script just calculates mean AUC for each combination of participant X
# condition X cluster. Result is exported to csv.

clusterDir="${HOME}/gitRepos/proj.bc.haylingRedux/03.derivedData/analysisHigherLevel/2014forPoster/crossonRequested/01.wholebrainTtests/finalClustersForPoster-endorsedByBruce20140812"
individualDir="${HOME}/gitRepos/proj.bc.haylingRedux/03.derivedData/analysisFirstLevel/fmriTask/individual"
outFile="/tmp/meanAuc_cluster_X_participant_X_condition.csv"

# get rid of existing output before entering loop:
rm -f $outfile

# for each cluster, calculate per-participant mean AUCs:
for clusterNumber in 1 2 3 4 7; do
   clusterMask=${clusterDir}/cluster${clusterNumber}.bin1.nii.gz
   #3dinfo $clusterMask

   #...for each group...
   for group in Young Old; do

      # ...for each participant...
      while read blind; do
         #echo $group,$blind
         
         #...for each condition...
         for condition in TaskA TaskB TaskB-A; do
            #ls -al ${individualDir}/auc${condition}.${blind}.denoisedAndWarped.nii.gz 
            aucFile="${individualDir}/auc${condition}.${blind}.denoisedAndWarped.nii.gz"
            meanAUC=`3dmaskave -mask ${clusterMask} -quiet ${aucFile}`
            echo "clusterNumber${clusterNumber},${group},${blind},${condition},${meanAUC}" >> ${outFile}
         done # end of condition loop
      done<~/gitRepos/proj.bc.haylingRedux/01.projectDesign/scripts/2014forPoster/subjs${group}.txt
   done # end of group loop
done # end of cluster loop

echo ""
echo ""
ws -al ${outFile}
Line count:
wc -l ${outFile}
echo ""
echo ""

