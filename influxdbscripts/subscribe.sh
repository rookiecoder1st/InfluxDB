#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions?u=root&p=root" \
            -d '{"kws":["ixtrade:ixl", "type:profit"],"duration":1,"startTm":"2014-07-30 12:00:00","endTm":"2014-08-01 20:00:00"}'
    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
