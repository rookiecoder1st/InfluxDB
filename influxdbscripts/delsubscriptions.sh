#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl -X DELETE "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions/6?u=root&p=root" \

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting. "
fi
