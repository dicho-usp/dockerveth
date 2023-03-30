#!/bin/bash

NAME=$1
PID=$(docker inspect $NAME --format "{{.State.Pid}}")
while read iface id; do
        [[ "$iface" == lo || ! "$iface" = eth* ]] && continue
        veth=$(ip -br addr | sed -nre "s/(veth.*)@if$id.*/\1/p")
        echo -e "$NAME\t$iface\t$veth"
done < <(</proc/$PID/net/igmp awk '/^[0-9]+/{print $2 " " $1;}')
