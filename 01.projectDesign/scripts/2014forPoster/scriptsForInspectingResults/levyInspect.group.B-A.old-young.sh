#!/bin/bash
#
# LOCATION:     levyInspect.group.B-A.old-young.sh
# USAGE:        see internal function below: fxnPrintUsage() 
#
# CREATED:      20140804 by stowler@gmail.com
# LAST UPDATED: 20140804 by stowler@gmail.com
#
# DESCRIPTION:
# This script makes it easy to inspect certain group-level data from levyDiss.
# 
# SYSTEM REQUIREMENTS:
# - awk must be installed for fxnCalc()
# <EDITME: list or describe other system requirements>
#
# INPUT FILES AND PERMISSIONS FOR OUTPUT:
# <EDITME: list or describe>
#
# OTHER ASSUMPTIONS:
# <EDITME: list or describe>
#
#
# NOTES TO HELP YOU READ AND EDIT THIS SCRIPT:
# 
# This script contains a few first-level sections, each starting with one of these headings:
# ------------------------- START: define functions ------------------------- #
# ------------------------- START: define basic script constants ------------------------- #
# ------------------------- START: greet user/logs ------------------------- #
# ------------------------- START: body of script ------------------------- #
# ------------------------- START: restore environment and say bye to user/logs ------------------------- #
#
# Searchable keywords that mark areas of code:
# EDITME :  areas that should be edited to meet specific needs of system/script/experiment/whatever
# TBD :     areas where I have work to do or decisions to make
# DEBUG :   areas that I only intend to uncomment and execute during debugging
#
# Three has marks ("###") at the beginning of a line mark the line as a comment
# containing training material. This allows the reader to find or skip over
# training material as needed, and allows a shorter version of the script to be
# created by filtering out those training lines.
#
# TBD: implement quiet mode so only summary appears
# TBD: add pretty borders to the summary table
# TBD: usage and self-test if no arguments given
#



# ------------------------- START: define functions ------------------------- #



fxnPrintUsage() {
cat <<endOfTextBlock

#
# ${scriptName} - a script to help inspect levyDiss group-level results.
#
# EDITME: a slightly longer description of what the script does, probably
# requiring a few lines. Maybe describe the output here. And any return
# codes. This is followed by syntax guidance, in which square brackets ("[]")
# generally indicate optional arguments, angle brackets ("<>") generally
# indicate required arguments, and the pipe symbol ("|") indicates an
# exclusive choice among multiple options.  Example of short syntax guidance
# with all options on one line: 
#
# Usage: ${scriptName} -y <year>
#   ...where <year> is 2011, 2014, or both
#

endOfTextBlock
# NB: the terminal "endOfTextBlock" line above must not be indented.
}



fxnPrintDebug() {
  # A function called to print debugging information but only if the debug
  # variable is set to 1.
  
  if [ "${debug}" = "1" ]; then 
     echo "////// DEBUG: ///// $@"
  fi
}



fxnCalc() {
   # fxnCalc is also something I include in my .bash_profile:
   # e.g., calc(){ awk "BEGIN{ print $* }" ;}
   # use quotes if parens are included in the function call:
   # e.g., calc "((3+(2^3)) * 34^2 / 9)-75.89"
   awk "BEGIN{ print $* }" ;
}



fxnSetTempDir() {
   # Attempt to create a temporary directory ${tempDir} .  It will be a child
   # of directory ${tempParent}, which may be set prior to calling this fxn, or
   # will be set to something sensible by this function.
   #
   # NB: ${tempParent} might need to change on a per-system, per-script, or per-experiment basis.
   #    If tempParent or tempDir needs to include identifying information from the script,
   #    just remember to assign values before calling fxnSetTempDir !
   #    e.g., tempParent=${participantDirectory}/manyTempProcessingDirsForThisParticipant && fxnSetTempDir()
   fxnPrintDebug "Starting fxnSetTempDir ..."

   # Is $tempParent already defined as a writable directory? If not, try to define a reasonable one here:
   tempParentPrevouslySetToWritableDir=''
   hostname=`hostname -s`
   kernel=`uname -s`
   fxnPrintDebug "\$tempParent is currently set to ${tempParent}"
   if [ ! -z "${tempParent}" ] && [ -d "${tempParent}" ] && [ -w "${tempParent}" ]; then
      tempParentPreviouslySetToWritableDir=1
      fxnPrintDebug "\$tempParentPreviouslySetToWritableDir=1"
   elif [ $hostname = "stowler-rmbp" ]; then
      tempParent="/Users/stowler/temp"
   elif [ $kernel = "Linux" ] && [ -d /tmp ] && [ -w /tmp ]; then
      tempParent="/tmp"
   elif [ $kernel = "Darwin" ] && [ -d /tmp ] && [ -w /tmp ]; then
      tempParent="/tmp"
   else
      echo "fxnSetTempDir cannot find a suitable parent directory in which to \
	    create a new temporary directory. Edit script's $tempParent variable. Exiting."
      exit 1
   fi
   fxnPrintDebug "\${tempParent} is now ${tempParent}"

   # Now that writable ${tempParent} has been confirmed, create ${tempDir}:
   # e.g., tempDir="${tempParent}/${startDateTime}-tempDirFrom_${scriptName}.${scriptPID}.d"
   tempDir="${tempParent}/${startDateTime}-tempDirFrom_${scriptName}.${scriptPID}.d"
   fxnPrintDebug "\${tempDir} has been set to ${tempDir}"
   # does this $tempDir already exit? if so, don't try to make it again:
   if [ -d "${tempDir}" ] && [ -w "${tempDir}" ]; then
      echo ""
      echo "Can't create this new temporary directory because it already exists as a writable directory:"
      echo "${tempDir}"
      echo ""
   else
      mkdir ${tempDir}
      if [ $? -ne 0 ] ; then
         echo ""
         echo "ERROR: fxnSetTempDir was unable to create temporary directory ${tempDir}."
         echo 'You may want to confirm the location and permissions of ${tempParent}, which is understood as:'
         echo "${tempParent}"
         echo ""
         echo "Exiting."
         echo ""
         exit 1
      else
         echo ""
         echo "A temporary directory has been created:"
         echo "${tempDir}"
         ls -ald "${tempDir}"
         echo ""
      fi
   fi
   fxnPrintDebug "...completed fxnSetTempDir ."
}


fxnProcessInvocation() {
   fxnPrintDebug "Starting fxnProcessInvocation..."

   # If not using getopt to process arguments (see further down), at least
   # check for the correct number of arguments. Or you could do both:
   #if [ "${scriptArgsCount}" -ne "2" ] ; then
   #   echo ""
   #   echo "ERROR: this script is expecting exactly zero arguments, but it was called with ${scriptArgsCount} arguments."
   #   echo ""
   #   fxnPrintUsage
   #   echo ""
   #   exit 1
   #fi
  
 
   # Process commandline arguments with getopt:
   # (recalling it can't handle arguments with spaces in them)
   #
   # The blocks below may look excessively complex, but the debugging really helps as
   # arguments with spaces and platform incompatibilies need to be dealt with.
   
   
   # STEP 1/3: initialize any variables that receive values during argument processing:
   # (see while loop below for a list of those variables)
   launchSelftest=''
   factorName=''
   levelNameList=''
   levelScript=''
   # ...and if already set, $debug must not lose its current value:
   #if [ -n ${debug} ] ; then debug=${debug} ; else debug=''; fi
   if [ -n ${debug} ] ; then echo "" ; else debug=''; fi
   
   
   # STEP 2/3: set the getopt string:
   
   fxnPrintDebug ""
   fxnPrintDebug "getopt debugging: These are the the variables manipulated while preparing to process arguments:"
   fxnPrintDebug ""
   fxnPrintDebug "getopt debugging:   \$scriptArgsVector : the vector of arguments called at script launch"
   fxnPrintDebug "getopt debugging:   \$scriptArgsCount  : the number of arguments called at script launch"
   fxnPrintDebug "getopt debugging:   \$@ - working vector of arguments"
   fxnPrintDebug 'getopt debugging:   $# - working count of arguments'
   fxnPrintDebug ""
   fxnPrintDebug "getopt debugging: Values before executing 'eval set -- \${scriptArgsVector}' :"
   fxnPrintDebug "getopt debugging: \${scriptArgsVector}=${scriptArgsVector}"
   fxnPrintDebug "getopt debugging: \${scriptArgsCount}=${scriptArgsCount}"
   fxnPrintDebug "getopt debugging: \${@}=${@}"
   fxnPrintDebug "getopt debugging: \${#}=${#}"
   fxnPrintDebug ""
   
   # ...part a of step 2:
   fxnPrintDebug 'getopt debugging: a) assign contents of ${scriptArgsVector} to $@ :'
   eval set -- ${scriptArgsVector}
   fxnPrintDebug "getopt debugging: ...done. Values after executing 'eval set -- \${scriptArgsVector}' :"
   fxnPrintDebug "getopt debugging: \${scriptArgsVector}=${scriptArgsVector}"
   fxnPrintDebug "getopt debugging: \${scriptArgsCount}=${scriptArgsCount}"
   fxnPrintDebug "getopt debugging: \${@}=${@}"
   fxnPrintDebug "getopt debugging: \${#}=${#}"
   fxnPrintDebug ""
   
   
   # ...part b of step 2:
   fxnPrintDebug "getopt debugging: b) use getopt command to parse \$@ and assign result to \$parsedArgs:"
   parsedArgs=`getopt -- y:d "$@"`
   if [ $? != 0 ] ; then 
      echo "Terminating...could not set string for getopt. Check out the Usage note:" >&2 
      fxnPrintUsage 
      exit 1 
   fi
   fxnPrintDebug "getopt debugging: ...done. Values after executing 'parsedArgs=\`getopt ... \$@\`' :"
   fxnPrintDebug "getopt debugging: \${scriptArgsVector}=${scriptArgsVector}"
   fxnPrintDebug "getopt debugging: \${scriptArgsCount}=${scriptArgsCount}"
   fxnPrintDebug "getopt debugging: \${@}=${@}"
   fxnPrintDebug "getopt debugging: \${#}=${#}"
   fxnPrintDebug "getopt debugging: \${parsedArgs}=${parsedArgs}"
   fxnPrintDebug ""
   
   
   # ...part c of step 2:
   fxnPrintDebug "getopt debugging: c) generate final arguments (\$1, \$2, etc.) for while loop:"
   eval set -- "${parsedArgs}"
   fxnPrintDebug "getopt debugging: ...done. Values after 'eval set -- \${parsedArgs}\' :"
   fxnPrintDebug "getopt debugging: (i.e., immeditaly prior to while loop)"
   fxnPrintDebug 'getopt debugging: (notice that getopt changes $@ and $#, not $scriptArgsVector or $scriptArgsCount)'
   fxnPrintDebug "getopt debugging: \${scriptArgsVector}=${scriptArgsVector}"
   fxnPrintDebug "getopt debugging: \${scriptArgsCount}=${scriptArgsCount}"
   fxnPrintDebug "getopt debugging: \${@}=${@}"
   fxnPrintDebug "getopt debugging: \${#}=${#}"
   fxnPrintDebug "getopt debugging: \${parsedArgs}=${parsedArgs}"
   fxnPrintDebug ""


   # STEP 3/3: process the command line switches:
   fxnPrintDebug "getopt debugging: executing the while loop to act on the parsed arguments:"
   while true ; do
       fxnPrintDebug "\$1=${1}"
       case "$1" in
         -y)   year="${2}"; shift 2 ;;
         -d)   debug="1" ;  shift ;;
         --)   shift; break ;;
         -*)   echo >&2 "usage: $0 -s [levelScript] -f [factorLabel] -l [factorLevelList]" exit 1 ;;
          *)   echo "Error in arguments to ${scriptName}" ; fxnPrintUsage ; exit 1 ;;		# terminate while loop
       esac
   done
   
   # ...and now all command line switches have been processed.
   fxnPrintDebug "getopt debugging: ...done. Values after the getopt while loop :"
   fxnPrintDebug "getopt debugging: \${scriptArgsVector}=${scriptArgsVector}"
   fxnPrintDebug "getopt debugging: \${scriptArgsCount}=${scriptArgsCount}"
   fxnPrintDebug "getopt debugging: \${@}=${@}"
   fxnPrintDebug "getopt debugging: \${#}=${#}"
   fxnPrintDebug "getopt debugging: \${parsedArgs}=${parsedArgs}"
   
   
   # check for incompatible invocation options:
   # if [ "$headingsoff" != "0" ] && [ "$headingsonly" != "0" ] ; then
   #    echo ""
   #    echo "ERROR: cannot specify both -r and -n:"
   #    echo ""
   #    fxnPrintUsage
   #    echo ""
   #    exit 1
   # fi
   
   # if we're showing debug messages, include this final check of invocation
   # variables before returning from fxn:
   fxnPrintDebug ""
   fxnPrintDebug "\${launchSelftest}=${launchSelftest}"
   fxnPrintDebug "\${debug}=${debug}"
   fxnPrintDebug "\${factorName}=${factorName}"
   fxnPrintDebug "\${levelNameList}=${levelNameList}"
   fxnPrintDebug "\${levelScript}=${levelScript}"
   fxnPrintDebug "...completed fxnProcessInvocation ."
   fxnPrintDebug ""
   


}


fxnSelftestBasic() {
   # Tests the administrative internal functions and variables of the template
   # on which this script is based. This self-test can be used to confirm that
   # the basic functions of the script are working on a particular system, or
   # that they haven't been broken by recent edits. For manual auditing, valid
   # output may appear as comment text at the bottom of this script (TBD). 

   #obviously(?) we want to turn on debugging if we're going to bother with a self-test:
   debug=1
   fxnPrintDebug "Launching internal fxnSelftestBasic ..."

   # First test small functions with no or few dependencies:

   # ...fxnPrintDebug:

   # ...fxnCalc:

   # Now test more complex internal functions in the order in which they are designed to be
   # called from the script body:


   # 1) not really a function, but start by exposing the basic constants defined in this script:
   fxnPrintDebug ""
   fxnPrintDebug "Some basic administrative constants have been defined in this script:"
   fxnPrintDebug ""
   for scriptConstantName in ${listOfBasicConstants}; do
      echo "\$${scriptConstantName} == ${!scriptConstantName}"
   done

   # 2) fxnSetTempDir :
   fxnPrintDebug ""
   fxnPrintDebug "Creating temporary directory by calling this script's internal function 'fxnSetTempDir' :"
   fxnSetTempDir
   deleteTempDirAtEndOfScript=0
   if [ ! -z  "${tempDir}" ] && [ -d "${tempDir}" ] && [ -w "${tempDir}" ]; then
	fxnPrintDebug "...success: confirmed that you have file sysem write permissions for \${tempDir}:"
	ls -aldh ${tempDir}
	fxnPrintDebug "...with its final destiny set by \${deleteTempDirAtEndOfScript} == ${deleteTempDirAtEndOfScript}"
	fxnPrintDebug ""
   else
	echo "WARNING: was not able to create a writable temporary directory."
	exit 1
   fi

   # 3) fxnPrintUsage :
   fxnPrintDebug ""
   fxnPrintDebug "Below is the usage note the user should see if asking for help or incorrectly calling this script:"
   fxnPrintDebug "(produced by script's internal function 'fxnPrintUsage')"
   fxnPrintDebug ""
   fxnPrintUsage

   # Strip out all comments that are marked as training. This will create a
   # slimmer, more readable version of the script :
   trainingMarker='###'       # trainingMarker must be sed-friendly. See below:
   fxnPrintDebug "Removing training comments from the current script (lines prepended with '${trainingMarker}' ...)"
   cp ${scriptPath}/${scriptName} ${tempDir}/script-orig.sh
   sed "/^${trainingMarker}/ d" ${tempDir}/script-orig.sh > ${tempDir}/script-withoutTrainingComments.sh
   linecountOrig="`wc -l ${tempDir}/script-orig.sh | awk '{print $1}'`"
   linecountSkinny="`wc -l ${tempDir}/script-withoutTrainingComments.sh | awk '{print $1}'`"
   fxnPrintDebug "...done removing training comments."
   fxnPrintDebug "The current script (${scriptName}) has ${linecountOrig} lines, and I have generated a version"
   fxnPrintDebug "without training comments that has ${linecountSkinny} lines:"
   ls -l ${tempDir}/*
   fxnPrintDebug "Completed internal function fxnSelftestBasic ."
}


fxnSelftestFull() {
  # Tests the full function of the script. Begins by calling fxnSelftestBaic() , and then...
  # <EDITME: add description of tests and validating data>
  fxnSelftestBasic
}



fxnSetSomeFancyConstants() {


	: <<'COMMENTBLOCK'
	   intensity="t1bfc0"			         # ...to be used in file and folder names
	   orientation="radOrig"			      # ...ditto

	   # set image directories:

	   # ${blindParent}:
	   # parent dir where each subject's $blindDir reside (e.g. parent of blind1, blind2, etc.)
	   # e.g., blindParent="/home/leonardlab/images/ucr"
	   # e.g., allows mkdir ${blindParent}/importedSemiautoLatvens ${blindParent}/blind1

	   # ${blindDir}: 
	   # dir for each subject's images and image directories:
	   # e.g., blindDir="/home/leonardlab/images/ucr/${blind}"
	   # e.g., blindDir="${blindParent}/${blind}"

	   # ${origDir}: 
	   # dir or parent dir where original images will be stored (or are already stored if formatted)
	   # e.g., origDir="${blindDir}/acqVolumes"

	   # ${anatRoot}}:
	   # where the groomed images directory, among others, will live:
	   # e.g., anatRoot="${blindDir}/anat-${intensity}-${orientation}"

	   # ...source directories for input images:
	   # (script should copy images from these [probably poorly organized] source directories
	   # to $origDir
	   # e.g., sourceT1acqDir="/Users/Shared/cepRedux/acqVolumes"
	   # e.g., sourceLatvenDir="/Users/Shared/cepRedux/semiautoLatvens"
	   # e.g., sourceBrainDir="/Users/Shared/cepRedux/semiautoExtractedBrains"
	   # e.g., sourceFlairDir="/Users/Shared/libon-final/origOrientImageJ" 
	   # e.g., sourceWMHImaskDir="/Users/Shared/libon-final/masksOrientImageJ"  

	   # ...brainsuite09 paths and definitions:
	   #BSTPATH="/data/pricelab/scripts/sdt/brainsuite09/brainsuite09.x86_64-redhat-linux-gnu"
	   #BSTPATH="/Users/stowler/Downloads/brainsuite09.i386-apple-darwin9.0"
	   #export BSTPATH
	   #bstBin="${BSTPATH}/bin/"
	   #export bstBin
	   #ATLAS="${BSTPATH}/atlas/brainsuite.icbm452.lpi.v08a.img"
	   #export ATLAS
	   #ATLASLABELS="${BSTPATH}/atlas/brainsuite.icbm452.lpi.v09e3.label.img"
	   #export ATLASLABELS
	   #ATLASES="--atlas ${ATLAS} --atlaslabels ${ATLASLABELS}"
	   #export ATLASES

	   # ...FSL variables
	   # FSLDIR=""
	   # export FSLDIR
	   # FSLOUTPUTTYPEorig="${FSLOUTPUTTYPE}"
	   # export FSLOUTPUTTYPE=NIFTI_GZ

	
COMMENTBLOCK
}

# ------------------------- FINISHED: define functions ------------------------- #


# ------------------------- START: define basic script constants ------------------------- #


# NB: these are per-script constants, so it's safer to define them here rather
# than in an internal function.

listOfBasicConstants=''

scriptName="`basename $0`"
listOfBasicConstants="${listOfBasicConstants} scriptName"

# getting scriptPath is non-trivial, and this is adapted from
# http://stackoverflow.com/a/12197518 :
pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
while([ -h "${SCRIPT_PATH}" ]); do
    cd "`dirname "${SCRIPT_PATH}"`"
    SCRIPT_PATH="$(readlink "`basename "${SCRIPT_PATH}"`")";
done
cd "`dirname "${SCRIPT_PATH}"`" > /dev/null
scriptPath="`pwd`";
popd  > /dev/null
listOfBasicConstants="${listOfBasicConstants} scriptPath"
# less robust 1-line solution:
# scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

scriptPWD="`pwd`"
listOfBasicConstants="${listOfBasicConstants} scriptPWD"

scriptHostname="`hostname`"
listOfBasicConstants="${listOfBasicConstants} scriptHostname"

scriptUnameOS="`uname -s`"
listOfBasicConstants="${listOfBasicConstants} scriptUnameOS"

scriptUnameLong="`uname -a`"
listOfBasicConstants="${listOfBasicConstants} scriptUnameLong"

scriptPID="$$"
listOfBasicConstants="${listOfBasicConstants} scriptPID"

scriptArgsVector="${@}"
listOfBasicConstants="${listOfBasicConstants} scriptArgsCount"

scriptArgsCount=$#
listOfBasicConstants="${listOfBasicConstants} scriptArgsCount"

scriptUser="`whoami`"
listOfBasicConstants="${listOfBasicConstants} scriptUser"

startDate="`date +%Y%m%d`"
listOfBasicConstants="${listOfBasicConstants} startDate"

startDateTime="`date +%Y%m%d%H%M%S`"
listOfBasicConstants="${listOfBasicConstants} startDateTime"

deleteTempDirAtEndOfScript=0
listOfBasicConstants="${listOfBasicConstants} deleteTempDirAtEndOfScript"

# echo "DEBUG: \${listOfBasicConstants} is:"
# echo "${listOfBasicConstants}"



# ------------------------- FINISH: define basic script constants ------------------------- #


# ------------------------- START: greet user/logs ------------------------- #

clear

echo ""
echo ""
echo "#################################################################"
echo "START: \"${scriptName}\""
      date
echo "#################################################################"
echo ""
echo ""
# ------------------------- FINISHED: greet user/logs------------------------- #


# ------------------------- START: body of script ------------------------- #





# Setup a temporary directory, which can be configured for clean-up:
fxnSetTempDir                 # <- use internal function to create ${tempDir}
deleteTempDirAtEndOfScript=1  # <- set to 1 to delete ${tempDir} or 0 to leave it. See end of script.


fxnProcessInvocation          
# ...and then edit its function definition for your specific needs.


#fxnSetSomeFancyConstants
# ...and then edit its function definition for your specific needs.


#fxnSelftestBasic
#...the script will exit after completing the self-test, ignoring all lines below.



: <<'COMMENTBLOCK'
echo ""
echo ""
echo "================================================================="
echo "START: do some stuff (EDITME: add real one-line description)"
echo "(should take about EDITME minutes)"
      date
echo "================================================================="
echo ""
echo ""

echo "(EDITME) If this line weren't just a placeholder in the template I'd be executing some useful commmands here."

echo ""
echo ""
echo "================================================================="
echo "FINISHED: did some stuff  (EDITME: add real one-line description)"
      date
echo "================================================================="
echo ""
echo ""
COMMENTBLOCK


#TBD: call fxnSelftestBasic if nothing happened earlier in the script

# ------------------------- FINISHED: body of script ------------------------- #


# ------------------------- START: restore environment and say bye to user/logs ------------------------- #
#
# Output some final status info to the user/log and clean-up any resources.

# If a ${tempDir} was defined, remind the user about it and (optionally) delete it:
if [ -n "${tempDir}" ]; then 
	#tempDirSize=`du -sh ${tempDir} | cut -d ' ' -f 1`
	tempDirSize=`du -sh ${tempDir} | cut -f 1`
	tempDirFileCount=`find ${tempDir} | wc -l`
	echo ""
	echo ""
	echo "Script complete. This script's temporary directory is:"
	ls -ld ${tempDir}
	echo "...and it contains: ${tempDirFileCount} files and folders taking up total disk space of ${tempDirSize}"
	echo ""
	# if previously indicated, delete $tempDir
	if [ ${deleteTempDirAtEndOfScript} = "1" ]; then
		echo -n "...which I am now removing..."
		rm -fr ${tempDir}
		echo "done." 
      echo "Proof of removal per \"ls -ld \${tempDir}\" :"
		ls -ld ${tempDir}
	fi
	echo ""
fi

# Did we change any environmental variables? It would be polite to set them to their original values:
# export FSLOUTPUTTYPE=${FSLOUTPUTTYPEorig}

echo ""
echo ""
echo "#################################################################"
echo "FINISHED: \"${scriptName}\""
      date
echo "#################################################################"
echo ""
echo ""
# ------------------------- FINISHED: restore environment and say bye to user/logs ------------------------- #

