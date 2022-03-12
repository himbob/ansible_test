# kill all
docker kill $(docker ps -q)

# Remove all Containers
docker rm $(docker ps -a -q)

# Remove all images
docker rmi $(docker images -q)

#-d = detach mode
#-p = map container port to host port
#--name create hard coded name
docker run --name catdog -d -p 6667:6379 redis

# basics
docker ps
docker images
docker start <contID>
docker stop <contID>


#list all the containers available locally  (incl the size)
docker ps -as

#container logs logs
docker logs <contID>
  
#login to contrainer 
docker exec -it <contID> bash
docker exec -it <contID> /bin/sh
  
#make a docker network for a app.  This allows my containers to just use the container 'name'
docker network create mongo-network 
  
docker network ls
#NETWORK ID     NAME            DRIVER    SCOPE
#46cbfec9fb9c   bridge          bridge    local
#fb99fc735fc5   host            host      local
#96ac2d381edb   mongo-network   bridge    local
#07e071560540   none            null      local

  #  start a container with a mapped port,  user/pass, name and network 
  # https://gitlab.com/nanuchi/techworld-js-docker-demo-app
docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    
  
docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   
  
  

  
  
  
  
  
  

  
