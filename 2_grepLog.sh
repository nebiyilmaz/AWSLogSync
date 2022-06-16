#!/bin/bash

# sync the logs...
#sh 1_syncWafLogs.sh



# check for parameters for searching previous days...
if [ $# -ne 1 ]; 
    then echo "\nChecking for today logs...\n\n"
    dayCount=0
else
    dayCount=$1
fi


# loop for how many day before
for (( c=$dayCount; c>=0; c-- ))
do
   dayFilter=`date -v-"$c"d +'%Y-%m-%d'`
   echo $dayFilter


	# With Day Filter
	#find . -name "aws-waf-logs*" | sort | grep $dayFilter | xargs cat | grep BLOCK | while read -r line

	# Without Day Filter # Bloklama sayisi ile grafik olusturmak icin kullaniyorum.
	find . -name "aws-waf-logs*" | sort |  xargs cat | grep BLOCK | while read -r line
	#find . -name "aws-waf-logs*" | sort | grep $dayFilter | xargs cat | grep COUNT | while read -r line
	#find . -name "aws-waf-logs*" | sort | grep $dayFilter | xargs cat | grep ALLOW | while read -r line
	#find . -name "aws-waf-logs*" | sort |  xargs cat | grep ALLOW | while read -r line
	do
	  echo "\n"
	  sdate=$(echo $line | cut -d: -f2 | cut -c 1-10)
	  #sdate=$(expr $sdate + 420892) # date format fix --now not applicable
	  date -r $sdate
	  echo "$line\n"
	  echo "Host: \c" 
	  echo $line | awk -F 'ost' '{ print $2}' | awk -F 'value' '{ print $2}' | cut -d'"' -f3
	  echo "URI: \c" 
	  echo $line | awk -F 'uri"' '{ print $2}' | cut -d'"' -f2
	  echo "RuleID: \c" 
	  echo $line | awk -F 'ruleId' '{ print $2}' | cut -d'"' -f3
	  echo "ClientIP: \c" 
	  echo $line | awk -F 'clientIp' '{ print $2}' | cut -d'"' -f3
	  echo "Country: \c" 
	  echo $line | awk -F 'country' '{ print $2}' | cut -d'"' -f3
	  echo "\n\n"
	done




done
