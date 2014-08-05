#!/bin/sh

if [ ! -z $HTTPPORT ] && [ ! -z $DBNAME ]
then
    curl -G "http://localhost:$HTTPPORT/db/$DBNAME/series?u=root&p=root&pretty=true" \
            --data-urlencode "q=select value from \"ixltrade:ixl\" where time > 1407500000000u"
#            --data-urlencode "q=select value from \"ixltrade:ixl\" where time < 1407146683000u"

#            --data-urlencode "q=select value from \"ixltrade:ixl\" where time > 1406918161 and time < 1406930000"

    echo
else
    echo "HTTPPORT and DBNAME env variables must be set. Aborting."
fi
