#!/bin/sh

if [ ! -z $HTTPPORT ]
then
    echo "chupee"
else
    echo "HTTPPORT env variable not set properly"
fi
