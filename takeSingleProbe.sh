#!/bin/bash

LANG=en_US.UTF-8
logfile=result.csv

useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 curl/performancetest"
curlops1="-k --connect-timeout 30 --limit-rate 752k --compressed -w @curl-format.txt -o /dev/null -s"

url=`rl -c 1 url.txt`
c="$curlops1 $url"


result=`curl --user-agent "$useragent "  $c`

echo "$(date),$(hostname);${result}" >> $logfile



