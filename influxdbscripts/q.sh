#!/bin/sh

curl -G "http://localhost:$HTTPPORT/db/thedb/series?u=root&p=root&pretty=true" \
        --data-urlencode "q=select * from /.*/"

echo
