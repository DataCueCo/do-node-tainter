#!/bin/sh
echo "Checking if we have new nodes without a taint"
NODES_TO_TAINT=$(kubectl get nodes -l doks.digitalocean.com/node-pool=redis -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers | grep none | wc -l | awk '{print $1}')
if [ "$NODES_TO_TAINT" != "0" ]; then
    echo "$NODES_TO_TAINT redis nodes require tainting"
    kubectl taint nodes -l -l doks.digitalocean.com/node-pool=redis app=redis:NoSchedule
fi
NODES_TO_TAINT=$(kubectl get nodes -l doks.digitalocean.com/node-pool=algo -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers | grep none | wc -l | awk '{print $1}')
if [ "$NODES_TO_TAINT" != "0" ]; then
    echo "$NODES_TO_TAINT algo nodes require tainting"
    kubectl taint nodes -l doks.digitalocean.com/node-pool=algo app=algo:NoSchedule
fi
