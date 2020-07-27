#!/bin/sh
echo "Checking if we have new nodes without a taint"
NODES_TO_TAINT=$(kubectl get nodes -l nodetype=redis -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers | grep none | wc -l | awk '{print $1}')
if [ NODES_TO_TAINT=="0" ]; then
    echo "No nodes require tainting"
    exit
fi
kubectl taint nodes -l nodetype=redis app=redis:NoSchedule