## Usage

- $ docker push localhost:5000/hello-world

- $ curl -X GET http://localhost:5000/v2/_catalog  
출력: {"repositories":["hello-world"]}

- $ curl -X GET http://localhost:5000/v2/hello-world/tags/list  
출력: {"name":"hello-world","tags":["latest"]}

## TODO List

- domain 설정  
- https 구성

## 참고자료 

- https://docs.docker.com/registry/deploying/