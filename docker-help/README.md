# Useful docker command list

- docker volume remove with filter
  $ docker volume rm $(docker volume ls -q -f dangling=true)

- docker container remove with filter  
  $ docker rm $(docker ps -q -f status=exited)

- docker-compose up with specific file  
  $ docker-compose -f docker-compose.yml up -d