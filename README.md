# NS-3.32 with openflow

The docker image, which is already build and ready to use ns-3.32 with openflow, is in docker hub(https://hub.docker.com/repository/docker/masato338/ns-3-docker)  
So, you can run ns-3.32 with the command below.
```bash
# pull image and login to container
docker run -it masato338/ns-3-docker bash

# run openflow switch simulation
cd ns-allinone-3.32/ns-3.32/ && ./waf --run openflow-switch

```

## how to build ns-3.32 with openflow
```bash
docker-compose up -d --build
```

# When you install ns-3.32 directry to ubuntu 18.04, you can use bash script
```bash
./install-ns3.sh
```
