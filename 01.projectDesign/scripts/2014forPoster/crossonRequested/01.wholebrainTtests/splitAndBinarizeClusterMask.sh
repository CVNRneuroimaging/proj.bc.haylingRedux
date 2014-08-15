#!/bin/sh

# This script just splits BC's original multi-intensity cluster map into
# individual cluster maps, one per cluster, each with voxel intensities
# binarized to ones and zeros instead of their original cluster-identity
# intensities.


clusterDir="$HOME/gitRepos/proj.bc.haylingRedux/03.derivedData/analysisHigherLevel/2014forPoster/crossonRequested/01.wholebrainTtests/finalClustersForPoster-endorsedByBruce20140812"
allClusters="${clusterDir}/finalClusterMaskFromBruce.OLDvYOUNGforB-A.nii.gz"

ls -al ${clusterDir}
ls -al ${allClusters}

for intensity in 1 2 3 4 7; do
   fslmaths $allClusters -thr $intensity -uthr $intensity -div $intensity ${clusterDir}/cluster${intensity}.bin1.nii.gz -odt char
done
