# Simple overlay created vie docker compose network test

### First make this file:
```yaml
version: "3.9"
services:
  ubuntu01:
    container_name: ubuntu03
    image: weibeld/ubuntu-networking
    privileged: true
    command: tail -F anything
    networks:
      - network-aaron  
  ubuntu02:
    container_name: ubuntu04
    image: weibeld/ubuntu-networking
    privileged: true
    command: tail -F anything
    networks:
      - network-aaron 
networks:
  network-aaron:  
    driver: overlay
    attachable: true
```


```bash
docker compose up
[+] Running 3/3
 - Network overlay_network-aaron  Created                                                                                                                             0.0s
 - Container ubuntu03             Created                                                                                                                             0.2s
 - Container ubuntu04             Created                                                                                                                             0.2s
Attaching to ubuntu03, ubuntu04
ubuntu03  | tail: cannot open 'anything' for reading: No such file or directory
ubuntu04  | tail: cannot open 'anything' for reading: No such file or directory
```

```bash
PS C:\WINDOWS\system32> docker network ls | grep overlay_network-aaron
NETWORK ID     NAME                           DRIVER    SCOPE
zyjae5m4t3or   overlay_network-aaron          overlay   swarm
```

```bash
docker network inspect overlay_network-aaron
```

```json
[
    {
        "Name": "overlay_network-aaron",
        "Id": "zyjae5m4t3or42txlqydborp6",
        "Created": "2022-03-14T20:36:38.9708337Z",
        "Scope": "swarm",
        "Driver": "overlay",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "10.0.2.0/24",
                    "Gateway": "10.0.2.1"
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
            "d7def841298661deebc21f1be86b738bd0af9ed26a4327373e0e93681064123e": {
                "Name": "ubuntu03",
                "EndpointID": "a728e7dd69b9aef43db333a673cc695fb9121b7a463433e5dc0b1b1b97cb37f8",
                "MacAddress": "02:42:0a:00:02:02",
                "IPv4Address": "10.0.2.2/24",
                "IPv6Address": ""
            },
            "ff65d3fa3f6140e956d11af439c6f1545aaf996dd00459183667ccb56d8dd22d": {
                "Name": "ubuntu04",
                "EndpointID": "62b0f44623eda32eafbc90753d4e7541f6a724b4161e7cc664a4509c0dc9f303",
                "MacAddress": "02:42:0a:00:02:04",
                "IPv4Address": "10.0.2.4/24",
                "IPv6Address": ""
            },
            "lb-overlay_network-aaron": {
                "Name": "overlay_network-aaron-endpoint",
                "EndpointID": "137cf4289185c33b71d001e0e5e3c9051772a3d1056d890730da87272e5509b9",
                "MacAddress": "02:42:0a:00:02:03",
                "IPv4Address": "10.0.2.3/24",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.driver.overlay.vxlanid_list": "4098"
        },
        "Labels": {
            "com.docker.compose.network": "network-aaron",
            "com.docker.compose.project": "overlay",
            "com.docker.compose.version": "2.2.3"
        },
        "Peers": [
            {
                "Name": "a638d08b1b60",
                "IP": "192.168.65.3"
            }
        ]
    }
]
```


### How to do it by hand outside swarm or compose:
#### Create an attachable overlay network:
```
docker network create --driver overlay --attachable my-attachable-overlay-network
```

#### Remove the network stack with a disabled "attachable" overlay network (in this example called: my-non-attachable-overlay-network):
```
docker service update --network-rm my-non-attachable-overlay-network myservice
```

#### Add the network stack with an enabled "attachable" overlay network:
```
docker service update --network-add my-attachable-overlay-network myservice
```




