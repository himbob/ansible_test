# kill all
docker kill $(docker ps -q)

# Remove all Containers
docker rm $(docker ps -a -q)

# Remove all images
docker rmi $(docker images -q)

# -d = detach mode
# -p = map container port to host port
# --name create hard coded name
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
  
#make a docker network for a app
docker network create mongo-network 
  

  
