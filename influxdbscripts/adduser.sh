#/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST "http://localhost:$HTTPPORT/db/$DBNAME/users?u=root&p=root" \
            -d '{"name": "thumps", "password": "chupee"}'

    echo
else
    echo "HTTPPORT env variable not set properly"
fi


