#!/bin/sh

if [ $HTTPPORT -eq 8094 ]
then 
    curl -X POST -d '[{"columns": ["num_vals_tm", "num_vals_id", "nvkw1", "nvkw2", "nvkw3", "nvkw4", "nvkw5", "nvkw6", "nvkw7", "nvkw8", "num_vals_value"], "name": "ts_data.txt", "points": [[1400126739.622135, 0, "host:f9f3521", "location:ixl", "pool:ixltrade", "service:81ac2351", "starman_pool:6ba4c47", "transport:b39040ce", "type:replayer_messages", "valtype:avg", 3.907985046680551e-14], [1400126753.4519517, 0, "host:4918d803", "location:ixl", "pool:ixltrade", "service:81ac2351", "starman_pool:6ba4c47", "transport:b39040ce", "type:replayer_messages", "valtype:avg", 0.0009853946746503084], [1400126761.19427, 0, "location:ixl", "pool:ixltrade", "type:norders_total", "x", "x", "x", "x", "x", 0.04163100159461308], [1400126761.19427, 0, "location:ixl", "pool:ixltrade", "type:size_traded_total", "x", "x", "x", "x", "x", 0.05083191425143241], [1400126761.19427, 0, "location:ixl", "pool:ixltrade", "type:invested_margin_total", "", "", "", "", "", 0.7670511597301406]]}]' "http://localhost:$HTTPPORT/db/thedb/series?u=root&p=root"

    echo
else
    echo "HTTPPORT env variable not set properly"
fi
