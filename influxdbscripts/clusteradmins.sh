#!/bin/sh

if [ -z $HTTPPORT ]
then 
    curl "http://localhost:$HTTPPORT/cluster_admins?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable must be set. Aborting."
fi
