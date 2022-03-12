#kill all
docker kill $(docker ps -q)

#Remove all Containers
docker rm $(docker ps -a -q)

#Remove all images
docker rmi $(docker images -q)
