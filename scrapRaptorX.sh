#!/bin/bash
#Scrap RaptorX results
#Written 2016 Avishek Kumar <avishek.kumar@asu.edu>
#Released into the public domain (can be used by anyone
#without limitation; you may delete the comments at the top)

PROGRAM=$(basename $0)

usage="usage : ${PROGRAM} [options] ARG1 ARG2

Downloads RaptorX results.

Options:

-h              show this help
-d DIRECTORY    download results in the specified directory
ARG1 beginning of sequence
ARG2 end of sequence
"""

function check_directory() {
#check if the directory exits if not create it
if [ ! -d $1 ]
then
echo "${1} does not exist..creating it now"
mkdir -vp ${1}
fi
}

# process options and arguments
DIRECTORY="." # default directory is current dir
while getopts hd: OPT; do
case "${OPT}" in
h)  echo "${usage}";
exit 0
;;
d)  DIRECTORY="${OPTARG}"
;;
?)  die "unknown option or missing arument; see -h for usage" 2
;;
esac
done
shift $((OPTIND - 1))
job_numbers="$*"

check_directory ${DIRECTORY}
start_no=$1
end_no=$2










