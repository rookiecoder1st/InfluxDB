from influxdb import InfluxDBClient
import sched
import time
import random

host = 'localhost'
port = 8094
user = 'root'
password = 'root'
dbname = 'thedb'
client = InfluxDBClient(host, port, user, password, dbname)

# Uncomment when needed
# client.create_database(dbname)

s = sched.scheduler(time.time, time.sleep)


def scheduled_write():
    t = int(time.time())
    value = random.randint(0, 100000)

    possible_kws = ["ixltrade:ixl", "pool:barton", "margin:average",
                    "size:alot", "type:profit"]
    kws = possible_kws[random.randint(0, len(possible_kws))-1]

    ts_point = (t, value)
    json_point = [{"name": kws,
                   "columns": ["time", "value"],
                   "points": [ts_point]}]

    #    print json_point
    # client.write_points(json_point)

scheduled_write()

'''
while True:
    s.enter(1, 1, scheduled_write, ())
    s.run()
'''
