#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/query_current/ixltrade:ixl?u=root&p=root" \

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
