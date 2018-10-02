## telegraf + influxdb

* telegraf + influxdb test command

    $ curl -G http://localhost:8086/query --data-urlencode "db=telegraf" --data-urlencode "q=SHOW MEASUREMENTS"

## 참고 자료

* http://softwaretester.info/docker-telegraf-influxdb-and-grafana/