#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/query_follow?u=root&p=root&pretty=true" \
            -d '{"kw":"ixltrade:ixl","startTime":"2014-08-04 05:00:00","endTime":"2014-08-04 15:00:00"}'
    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
