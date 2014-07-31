#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions?u=root&p=root" \
            -d '{"kws":["joe", "flacco"],"duration":1,"startTm":"2014-07-24 11:11:11","endTm":"2014-07-25 12:12:12"}'
    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
