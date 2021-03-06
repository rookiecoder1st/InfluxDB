#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/users/thumps?u=root&p=root" \
         -d '{"admin": false}'

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
