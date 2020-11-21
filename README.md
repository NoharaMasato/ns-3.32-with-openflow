# NS-3.32 with openflow

The docker image, which is already build and ready to use ns-3.32 with openflow, is in docker hub(https://hub.docker.com/repository/docker/masato338/ns-3-docker)  
So, you can run ns-3.32 with the command below.
```
docker run -it masato338/ns-3-docker bash
```

## how to build ns-3.32 with openflow
```
docker-compose up -d --build
```
