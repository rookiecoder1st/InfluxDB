#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db?u=root&p=root" \
            -d '{"name": "thedb"}'

    echo
else
    echo "HTTPPORT env variable not set properly"
fi
