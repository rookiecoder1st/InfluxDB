#!/usr/bin/python
import re
from collections import defaultdict
from influxdb import InfluxDBClient
import time
import gzip
import sys

FILE_NAME = 'data/ts_relay_bereq102_20140501_bereq101_3_12500.ipc.l.gz'

HOST = 'localhost'
PORT = 8086
USER = 'root'
PASSWORD = 'root'
DBNAME = 'mydb'

client = InfluxDBClient(HOST, PORT, USER, PASSWORD, DBNAME)

# Uncomment when needed to make a new database with 'DBNAME'
try:
    client.create_database(DBNAME)
except:
    print >> sys.stderr, "database %s exists. Continuing" % DBNAME

def nonblank_lines(f):
    for l in f:
        line = l.rstrip()
        if line:
            yield line


ts_regex = re.compile(' tm=(\S+)\ id=(\S+)\ keywords=(\S+) value=([0-9.]+)')
timeseries = defaultdict(list)

count = 0
for line in gzip.open(FILE_NAME):
    if not line.strip():
        continue

    timeseries.clear()
    data = ts_regex.findall(line.strip())
    for ts in data:
	timeseries[ts[2]].append((int(float(ts[0]) * 1e6), float(ts[3])))
    insert_ts = [{"name": ts_key.replace("%20", " "),
                  "columns": ["time", "value"],
                  "points": timeseries[ts_key]} for ts_key in timeseries]
    client.write_points_with_precision(insert_ts, "u")
