#!/bin/sh

curl -X POST 'http://localhost:8086/db/mydb/users/thumps?u=root&p=root' \
        -d '{"admin": false}'
