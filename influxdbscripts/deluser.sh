#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X DELETE "http://localhost:$HTTPPORT/db/mydb/users/thumps?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable not set properly"
fi
