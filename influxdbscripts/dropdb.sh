#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X DELETE "http://localhost:$HTTPPORT/db/thedb?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable not set properly"
fi
