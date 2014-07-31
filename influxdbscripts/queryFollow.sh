#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/query_follow?u=root&p=root" \
            -d '{"kw":"ixltrade","startTime":"2000-01-01 05:00:00","endTime":"2010-01-01 2:13:00}'
    echo
else
    echo "HTTPPORT env variable not set properly"
fi
