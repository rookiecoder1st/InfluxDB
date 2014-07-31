#/bin/sh

if [ -z $HTTPPORT ] && [ -z $DBNAME ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/users?u=root&p=root" \
            -d '{"name": "thumps", "password": "chupee"}'

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
