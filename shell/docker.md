# kill all
## docker kill $(docker ps -q)

# Remove all Containers
## docker rm $(docker ps -a -q)

# Remove all images
## docker rmi $(docker images -q)

# -d = detach mode
# -p = map container port to host port
# --name create hard coded name
## docker run --name catdog -d -p 6667:6379 redis
