#!/bin/bash

LANG=en_US.UTF-8
logfile=test_complex_curl_imageserver_${user}.log
useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 curl/performancetest"

curlops1=" -k --connect-timeout 30 --limit-rate 752k --compressed -w @curl-format.txt -o /dev/null -s "


while read line; do
    c="$curlops1 $line"
    cx="$cx $c"
done < ${user}.txt

d=`date`
result=`curl --user-agent "$useragent "  $cx`

count=1
IFS='!' read -ra ADDR <<< "$result"
for i in "${ADDR[@]}"; do
    echo "$date; $i;  T${count}$2" >> $logfile
    ((count = count + 1))
done



