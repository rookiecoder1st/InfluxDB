#!/bin/sh

if [ ! -z $HTTPPORT ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db?u=root&p=root" \
            -d '{"name": "thedb"}'

    echo
else
    echo "HTTPPORT env variable must be set. Aborting."
fi
