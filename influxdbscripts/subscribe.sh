#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions?u=root&p=root" \
            -d '{"kws":["ixltrade:ixl", "type:profit"],"duration":10,"startTm":"2014-08-04 05:00:00","endTm":"2014-08-04 15:00:00"}'
    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
