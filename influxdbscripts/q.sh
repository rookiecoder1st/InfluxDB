#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then
    curl -G "http://localhost:$HTTPPORT/db/$DBNAME/series?u=root&p=root&pretty=true" \
            --data-urlencode "q=select * from /.*/"

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
