#!/bin/sh

curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/users/thumps?u=root&p=root" \
        -d '{"admin": false}'

echo
