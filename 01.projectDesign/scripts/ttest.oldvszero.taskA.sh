#!/bin/sh
#ttest.oldvszero.taskA.sh
# 3dttest sign direction: set2-set1
# ...or for one-tailed vs zero: 
# 3dttest [options] -base1 bval -set2 datasets ...
#   for comparing the mean of 1 set of datasets against a constant.

3dttest \
-prefix group/ttest.oldvszero.taskA.nii.gz \
-base1 0 \
-set2 \
individual/aucTaskA.101.denoisedAndWarped.nii.gz \
individual/aucTaskA.102.denoisedAndWarped.nii.gz \
individual/aucTaskA.103.denoisedAndWarped.nii.gz \
individual/aucTaskA.104.denoisedAndWarped.nii.gz \
individual/aucTaskA.107.denoisedAndWarped.nii.gz \
individual/aucTaskA.108.denoisedAndWarped.nii.gz \
individual/aucTaskA.109.denoisedAndWarped.nii.gz \
individual/aucTaskA.110.denoisedAndWarped.nii.gz \
individual/aucTaskA.112.denoisedAndWarped.nii.gz \
individual/aucTaskA.113.denoisedAndWarped.nii.gz \
individual/aucTaskA.114.denoisedAndWarped.nii.gz \
individual/aucTaskA.116.denoisedAndWarped.nii.gz \
individual/aucTaskA.117.denoisedAndWarped.nii.gz \
individual/aucTaskA.118.denoisedAndWarped.nii.gz \
individual/aucTaskA.119.denoisedAndWarped.nii.gz 
