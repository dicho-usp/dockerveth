# dockerveth
Fetch veth names of network interfaces of docker containers via the following steps:
* fetch process id: docker ps NAME --format "{{.State.Pid}}"
* read network interface: /proc/$PID/net/igmp
* read veth name: ip -br addr
* output DOCKER_NAME INTERFACE_NAME VETH_INTERFACE_NAME

run
```
$ ./veth.sh app_1
```

will produce updates like this

```
app_1 eth0    veth7870b4c
app_1 eth1    veth04b7bbc
```
