#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/thedb/query_current/ixltrade?u=root&p=root" \

    echo
else
    echo "HTTPPORT env variable not set properly"
fi
