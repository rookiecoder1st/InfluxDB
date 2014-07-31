#!/bin/sh

if [ -z $HTTPPORT ]
then 
    curl "http://localhost:$HTTPPORT/db?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable must be set. Aborting."
fi
