#!/bin/sh
# setup environment for subsequent scripts:

#export studyDir="/data/birc/RESEARCH/STN/SUBCORT_DISS_2009/SC"
export studyDir="/data/birc/Florida/STN/SUBCORT_DISS_2009/SC"

#export outDir="${studyDir}/stowler_reprocess"
export outDir="${studyDir}/stowler-temp-201407XX"

# In the image list below: 16 young , 15 old participants:
# Ilana analyzed only 15 young for diss, having excluded participant 010
# (Participant 10 per my old meeting notes about BC's confusion about whether
# she excluded 010 or 012, confirmed as 010 by the command-line history of file
# from dissertation figure 4-8:
# ./modern0to12s/M/Ttest.modern0to12s.m.OldvsYoung.TaskB-A+tlrc.HEAD)
#
export subjsYoung="002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017"
export subjsOld="101 102 103 104 107 108 109 110 112 113 114 116 117 118 119"

# convert both of those subject lists to columns for other use:
export subjsYoung_column="`echo ${subjsYoung} | sed 's/ /\n/g'`"
export subjsOld_column="`echo ${subjsOld} | sed 's/ /\n/g'`"
export subjs="`echo ${subjsYoung}` `echo ${subjsOld}`"
export subjs_column="`echo ${subjs} | sed 's/ /\n/g'`"

echo ""
echo "studyDir=${studyDir}"
echo "outDir=${outDir}"
echo "subjsYoung=${subjsYoung}"
echo "subjsOld=${subjsOld}"
echo "subjs=${subjs}"
echo ""
echo "Same subject lists, but as columns:"
echo ""
echo "subjsYoung_column="
echo "${subjsYoung_column}"
echo ""
echo "subjsOld_column="
echo "${subjsOld_column}"
echo ""
echo "subjs_column="
echo "${subjs_column}"
