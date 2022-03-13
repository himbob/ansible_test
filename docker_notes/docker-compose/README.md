# Simple bridge network test
## docker-compose.yml
```yaml
version: "3.9"
services:
  ubuntu01:
    container_name: ubuntu01
    image: weibeld/ubuntu-networking
    command: tail -F anything
    networks:
      - network-aaron  
  ubuntu02:
    container_name: ubuntu02
    image: weibeld/ubuntu-networking
    command: tail -F anything
    networks:
      - network-aaron 
networks:
  network-aaron:  
    driver: bridge
```

```bash
#You can see this makes a simple 172.21.0.0/16 network and spins up two containers in it
docker network inspect docker-compose_network-aaron
```
```json
[
    {
        "Name": "docker-compose_network-aaron",
        "Id": "45fe38ca4c001d1a812cacc3b3e5ac90faad2a7e371f4c2add3f3dbbd27598d7",
        "Created": "2022-03-13T21:52:53.3771608Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.21.0.0/16",
                    "Gateway": "172.21.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": true,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "08957bb307f0fb82ca4af904e8b91b848e6640d560b14d2e8f9717c7c75f9e71": {
                "Name": "ubuntu02",
                "EndpointID": "ec280a3c972c3b12758f2dc853aeff58071fea7e3f2269c2b0ffa0ac9972f91a",
                "MacAddress": "02:42:ac:15:00:03",
                "IPv4Address": "172.21.0.3/16",
                "IPv6Address": ""
            },
            "9d518b92cae1412fb607c9ae751a494cb14d41429ebaa3f8c3e1530a1e155032": {
                "Name": "ubuntu01",
                "EndpointID": "c307dcc9e2b3fb7aa3a7b2db1e35dfdc50b625c01b621c8c5815ec157d47efa9",
                "MacAddress": "02:42:ac:15:00:02",
                "IPv4Address": "172.21.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {
            "com.docker.compose.network": "network-aaron",
            "com.docker.compose.project": "docker-compose",
            "com.docker.compose.version": "1.29.2"
        }
    }
]
```
```bash
#login to one of the containers
docker exec -it 5b bash
#look at ip's
container01#  ip a
...
37: eth0@if38: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:ac:15:00:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.21.0.3/16 brd 172.21.255.255 scope global eth0
       valid_lft forever preferred_lft forever
#ping the other container
ping ubuntu02
PING ubuntu02 (172.21.0.2) 56(84) bytes of data.
64 bytes from ubuntu02.docker-compose_network-aaron (172.21.0.2): icmp_seq=1 ttl=64 time=0.059 ms

```
