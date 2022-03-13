## kill all
## Remove all Containers
## Remove all images
## Remove all volumes
```bash
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker volume prune --force
docker network prune
```

## basics
```bash
docker ps
docker images
docker start <contID>
docker stop <contID>
```

|flag|desc|
|--------|-----------------------------|
|-d | detach mode|
|-p | map container port to host port|
|--name | create hard coded name|
```bash
docker run --name catdog -d -p 6667:6379 redis  

#### list all the containers available locally  (incl the size)
docker ps -as

#container logs logs
docker logs <contID>
  
#login to contrainer 
docker exec -it <contID> bash
docker exec -it <contID> /bin/sh
  
#make a docker network for a app.  This allows my containers to just use the container 'name'
docker network create mongo-network 
docker network ls

#  start a container with a mapped port,  user/pass, name and network 
## https://gitlab.com/nanuchi/techworld-js-docker-demo-app
## https://www.youtube.com/watch?v=3c-iBn73dDE&t=803s
docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    
  
docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express  

#how to build an image from a local Dockerfile
docker build -t my-app:1.0 .

```  
  
  
  

  
  
  
  
  
  

  
