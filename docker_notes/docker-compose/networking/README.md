# CNM = Container Neworking Model  [ not for K8s typoes :-) ]
https://github.com/moby/libnetwork/blob/master/docs/design.md

# Libnetwork = Main implimentation of CNM on linux and windows (non K8s setups)

# Drivers = Network types already created for Docker to use
```bash
#lets see what network driver types my install has
docker info | grep Network
  ...
  Network: bridge host ipvlan macvlan null overlay
```
## bridge
## host
## overlay 

# Scope = What can get to my docker driver networks
