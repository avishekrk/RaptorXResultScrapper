#!/bin/bash
#Scrap RaptorX results

base_url="raptorx.uchicago.edu/ContactMap/myjobs/"
begin_no=203625 #start id
end_no=203641   #end id

current_no=$begin_no

while [ $current_no -le $end_no ]
do
    echo $current_no
    current_no=$(( $current_no + 1))
    url=${base_url}${current_no}summary_data/detail
    echo $url
    wget -O ${current_no}.zip $url 
done
