#!/bin/sh

source .session

aws s3 sync s3://waf-temp-logs-ing-prod/ waf-logs/





