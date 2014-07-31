#!/bin/sh

if [ -z $HTTPPORT ]
then 
    curl -X DELETE "http://localhost:$HTTPPORT/cluster_admins/paul?u=root&p=root"
    
    echo
else
    echo "HTTPPORT env variable must be set. Aborting."
fi
