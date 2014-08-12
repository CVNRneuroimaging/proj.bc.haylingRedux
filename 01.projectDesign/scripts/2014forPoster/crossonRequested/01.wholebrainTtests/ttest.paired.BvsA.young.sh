#!/bin/sh
#ttest.paired.BvsA.young.sh
# 3dttest sign direction: set2-set1

3dttest \
-paired \
-prefix group/ttest.paired.BvsA.young.nii.gz \
-set1 \
individual/aucTaskA.002.denoisedAndWarped.nii.gz \
individual/aucTaskA.003.denoisedAndWarped.nii.gz \
individual/aucTaskA.004.denoisedAndWarped.nii.gz \
individual/aucTaskA.005.denoisedAndWarped.nii.gz \
individual/aucTaskA.006.denoisedAndWarped.nii.gz \
individual/aucTaskA.007.denoisedAndWarped.nii.gz \
individual/aucTaskA.008.denoisedAndWarped.nii.gz \
individual/aucTaskA.009.denoisedAndWarped.nii.gz \
individual/aucTaskA.011.denoisedAndWarped.nii.gz \
individual/aucTaskA.012.denoisedAndWarped.nii.gz \
individual/aucTaskA.013.denoisedAndWarped.nii.gz \
individual/aucTaskA.014.denoisedAndWarped.nii.gz \
individual/aucTaskA.015.denoisedAndWarped.nii.gz \
individual/aucTaskA.016.denoisedAndWarped.nii.gz \
individual/aucTaskA.017.denoisedAndWarped.nii.gz \
-set2 \
individual/aucTaskB.002.denoisedAndWarped.nii.gz \
individual/aucTaskB.003.denoisedAndWarped.nii.gz \
individual/aucTaskB.004.denoisedAndWarped.nii.gz \
individual/aucTaskB.005.denoisedAndWarped.nii.gz \
individual/aucTaskB.006.denoisedAndWarped.nii.gz \
individual/aucTaskB.007.denoisedAndWarped.nii.gz \
individual/aucTaskB.008.denoisedAndWarped.nii.gz \
individual/aucTaskB.009.denoisedAndWarped.nii.gz \
individual/aucTaskB.011.denoisedAndWarped.nii.gz \
individual/aucTaskB.012.denoisedAndWarped.nii.gz \
individual/aucTaskB.013.denoisedAndWarped.nii.gz \
individual/aucTaskB.014.denoisedAndWarped.nii.gz \
individual/aucTaskB.015.denoisedAndWarped.nii.gz \
individual/aucTaskB.016.denoisedAndWarped.nii.gz \
individual/aucTaskB.017.denoisedAndWarped.nii.gz
