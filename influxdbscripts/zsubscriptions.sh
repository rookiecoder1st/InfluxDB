#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl "http://localhost:$HTTPPORT/db/$DBNAME/subscriptions?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable not set properly"
fi