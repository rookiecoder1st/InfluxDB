#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then 
    curl "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions?u=root&p=root"

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
