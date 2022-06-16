#!/bin/sh

#
# Put your session token in Session.ini file
#


source Session.ini

aws s3 sync s3://waf-temp-logs-ing-prod/ waf-logs/





