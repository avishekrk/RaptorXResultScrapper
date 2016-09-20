#!/bin/bash
#Scrap RaptorX results
#Written 2016 Avishek Kumar <avishek.kumar@asu.edu>
#Released into the public domain (can be used by anyone
#without limitation; you may delete the comments at the top)

PROGRAM=$(basename $0)

usage="usage : ${PROGRAM} [options] begin_no end_no

Downloads RaptorX results.

Options:

-h              show this help
-d DIRECTORY    download results in the specified directory
begin_no beginning of sequence
end_no end of sequence
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


base_url="raptorx.uchicago.edu/ContactMap/myjobs/"
current_no=$start_no


while [ $current_no -le $end_no ]
do
    echo $current_no
    current_no=$(( $current_no + 1))
    url=${base_url}${current_no}summary_data/detail
    echo $url
    wget -O ${current_no}.zip $url 
done









