# Simple overlay (swarm) network test

```bash
docker swarm init
Swarm initialized: current node (4zvn09jioy971a863d9vnwlnb) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-1dwt6yyegwu3e2xgbmimspa3r83jrks66ew0bfl5lva238tr1g-4brp6llxhazuimd8ym4441tbi 10.11.33.55:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

```bash
docker network ls | grep overlay
r5t6owum1ez6   ingress           overlay   swarm

docker network inspect ingress
[
    {
        "Name": "ingress",
        "Id": "r5t6owum1ez61ajn0c4esw6am",
        "Created": "2022-03-14T17:41:57.861675998Z",
        "Scope": "swarm",
        "Driver": "overlay",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "10.0.0.0/24",
                    "Gateway": "10.0.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": true,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "ingress-sbox": {
                "Name": "ingress-endpoint",
                "EndpointID": "7fd853e01f8d3ff4c22ba002cf818c3e067801261f7baa3892014480bdef32ca",
                "MacAddress": "02:42:0a:00:00:02",
                "IPv4Address": "10.0.0.2/24",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.driver.overlay.vxlanid_list": "4096"
        },
        "Labels": {},
        "Peers": [
            {
                "Name": "4b0ef5da0432",
                "IP": "10.11.33.55"
            }
        ]
    }
]
```

```bash
docker node ls
ID                            HOSTNAME         STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
xl8i0e5tmjdp9atbfpv01drdc     docker-desktop   Ready     Active                          20.10.12
4zvn09jioy971a863d9vnwlnb *   k3sserver01      Ready     Active         Leader           20.10.7
```





