#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/query_subscriptions/1?u=root&p=root&pretty=true"

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
