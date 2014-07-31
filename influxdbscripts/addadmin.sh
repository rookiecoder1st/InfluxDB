#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/users/thumps?u=root&p=root" \
        -d '{"admin": true}'

    echo
else
    echo "HTTPPORT env variable not set properly"
fi

