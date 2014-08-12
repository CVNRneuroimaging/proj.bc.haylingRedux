#!/bin/sh
#ttest.paired.BvsA.old.sh
# 3dttest sign direction: set2-set1

3dttest \
-paired \
-prefix group/ttest.BvsA.old.nii.gz \
-set1 \
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
individual/aucTaskA.119.denoisedAndWarped.nii.gz \
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
