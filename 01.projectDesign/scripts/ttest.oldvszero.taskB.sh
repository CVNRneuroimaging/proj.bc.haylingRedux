#!/bin/sh
#ttest.oldvszero.taskB.sh
# 3dttest sign direction: set2-set1
# ...or for one-tailed vs zero: 
# 3dttest [options] -base1 bval -set2 datasets ...
#   for comparing the mean of 1 set of datasets against a constant.

3dttest \
-prefix group/ttest.oldvszero.taskB.nii.gz \
-base1 0 \
-set2 \
individual/aucTaskB.101.denoisedAndWarped.nii.gz \
individual/aucTaskB.102.denoisedAndWarped.nii.gz \
individual/aucTaskB.103.denoisedAndWarped.nii.gz \
individual/aucTaskB.104.denoisedAndWarped.nii.gz \
individual/aucTaskB.107.denoisedAndWarped.nii.gz \
individual/aucTaskB.108.denoisedAndWarped.nii.gz \
individual/aucTaskB.109.denoisedAndWarped.nii.gz \
individual/aucTaskB.110.denoisedAndWarped.nii.gz \
individual/aucTaskB.112.denoisedAndWarped.nii.gz \
individual/aucTaskB.113.denoisedAndWarped.nii.gz \
individual/aucTaskB.114.denoisedAndWarped.nii.gz \
individual/aucTaskB.116.denoisedAndWarped.nii.gz \
individual/aucTaskB.117.denoisedAndWarped.nii.gz \
individual/aucTaskB.118.denoisedAndWarped.nii.gz \
individual/aucTaskB.119.denoisedAndWarped.nii.gz 
