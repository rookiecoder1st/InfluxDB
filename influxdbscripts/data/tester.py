#!/usr/bin/python
import gzip
import os
import re
import sys
import shlex
from collections import defaultdict
from influxdb import InfluxDBClient
from influxdb.client import InfluxDBClientError

def parse_args():
    import optparse
    usage="%prog [options] ts_relay_file_name.\nNote: requires exactly one filename"

    parser = optparse.OptionParser(usage=usage)
    parser.add_option('-H', '--HOST', type="string", default="localhost",
                      help="Database connection host")
    parser.add_option('-P', '--PORT', type="int", default=8086,
                      help="Database connection port number")
    parser.add_option('-u', '--user', type="string", default="root",
                      help="User name for writing to the database")
    parser.add_option('-p', '--password', type="string", default="root",
                      help="User password for writing to the database")
    parser.add_option('-d', '--dbname', type="string", default="mydb",
                      help="database name")
    parser.add_option('--time_operations', default=False, action="store_true",
                      help="record and periodically summarize and emit timing data")
    
    opts, args = parser.parse_args()
    return opts, args

def get_client(opts):
    client = InfluxDBClient(opts.HOST, opts.PORT,
                            opts.user, opts.password,
                            opts.dbname)
    try:
        client.create_database(opts.dbname)
    except InfluxDBClientError:
        print >> sys.stderr, "debug: database %s exists. Continuing" % opts.dbname

    return client

def get_filehandle(args):
    if len(args) != 1:
        print >> sys.stderr, "parse.py requires one and only one input file name argument."
        exit(1)

    # Better hope that .gz is actually gzipped
    if os.path.splitext(args[0])[-1] == '.gz':
        return gzip.open(args[0]) 

    # Basic text file
    return open(args[0])

def import_data(client, filehandle, time_operations=False):
    ts_regex = re.compile(' tm=(\S+)\ id=(\S+)\ keywords=(\S+) value=([0-9.]+)')
    timeseries = defaultdict(list)

    counter = 0
    find_tm = 0.0
    process_tm = 0.0
    insert_tm = 0.0

    for line in filehandle:
        if not line.strip():
            continue

        timeseries.clear()
        data = ts_regex.findall(line.strip())
        for ts in data:
            timeseries[ts[2]].append((int(float(ts[0]) * 1e6), float(ts[3])))
        insert_ts = [ {"name": ts_key.replace("%20", " "),
                       "columns": ["time", "value"],
                       "points": timeseries[ts_key]} for ts_key in timeseries]
        try:
            print insert_ts
            #client.write_points_with_precision(insert_ts, "u")
        except InfluxDBClientError, err:
            print >> sys.sterr, "warning: client error: %s\n    attempted to insert '%s'" % (err, ts)
            continue

if __name__ == '__main__':
    opts, args = parse_args()
    client = get_client(opts)

    filehandle = get_filehandle(args)

    import_data(client, filehandle, opts.time_operations)

