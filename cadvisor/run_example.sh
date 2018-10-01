# create project
mkdir -p Projects/DCIG/influxdb && cd Projects/DCIG/

# start InfluxDB
$ docker run --name influxdb --restart=always -d -p 8086:8086 -v $PWD/influxdb:/var/lib/influxdb influxdb
 
# create new user
$ curl -G http://localhost:8086/query --data-urlencode "q=CREATE USER cadvisor WITH PASSWORD 'password123' WITH ALL PRIVILEGES"
 
# create database for cadvisor
$ curl -G http://localhost:8086/query -u cadvisor:password123 --data-urlencode "q=CREATE DATABASE cadvisor_db"
 
# show ip of influxdb container
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' influxdb

# start cAdvisor
$ docker run -d --name=cadvisor \
                -v /:/rootfs:ro \
                -v /var/run:/var/run:rw \
                -v /sys:/sys:ro \
                -v /var/lib/docker/:/var/lib/docker:ro \
                -p 8080:8080 \
                --restart=always \
                google/cadvisor:latest \
                -storage_driver=influxdb \
                -storage_driver_db=cadvisor_db \
                -storage_driver_user=cadvisor \
                -storage_driver_password=password123 \
                -storage_driver_host=172.17.0.2:8086
 
# check cAdvisor logs (optional)
$ docker logs -f cadvisor
 
# open cAdvisor WebUI
$ open -a Safari http://localhost:8080

# show measurements (be patient)
$ curl -G http://localhost:8086/query -u cadvisor:password123 --data-urlencode "db=cadvisor_db" --data-urlencode "q=SHOW MEASUREMENTS"

# run grafana container
$ docker run --name grafana -i -p 3000:3000 grafana/grafana
 
# open Grafana WebUI and login (admin:admin)
$ open -a Safari http://localhost:3000