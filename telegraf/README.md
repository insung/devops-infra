## telegraf + influxdb

* telegraf + influxdb test command

    $ curl -G http://localhost:8086/query --data-urlencode "db=influxdb" --data-urlencode "q=SHOW MEASUREMENTS"