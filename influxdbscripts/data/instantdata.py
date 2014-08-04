from influxdb import InfluxDBClient
from influxdb.client import InfluxDBClientError
import sched
import time
import random
import sys


def parse_args():
    import optparse
    usage="%prog [options] ts_relay_file_name.\nNote: requires exactly one filename"

    parser = optparse.OptionParser(usage=usage)
    parser.add_option('-H', '--HOST', type="string", default="localhost",
                      help="Database connection host")
    parser.add_option('-P', '--PORT', type="int", default=8094,
                      help="Database connection port number")
    parser.add_option('-u', '--user', type="string", default="root",
                      help="User name for writing to the database")
    parser.add_option('-p', '--password', type="string", default="root",
                      help="User password for writing to the database")
    parser.add_option('-d', '--dbname', type="string", default="thedb",
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


def scheduled_write():
    t = int(time.time())
    value = float(random.randint(0, 100000))

    possible_kws = ["ixltrade:ixl", "pool:barton", "margin:average",
                    "size:alot", "type:profit"]
    kws = possible_kws[random.randint(0, len(possible_kws))-1]

    ts_point = (t, value)
    json_point = [{"name": kws,
                   "columns": ["time", "value"],
                   "points": [ts_point]}]

    client.write_points_with_precision(json_point, "u")


if __name__ == '__main__':
    opts, args = parse_args()
    client = get_client(opts)

    s = sched.scheduler(time.time, time.sleep)

    while True:
        s.enter(1, 1, scheduled_write, ())
        s.run()
