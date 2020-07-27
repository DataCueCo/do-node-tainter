#!/bin/sh
echo "Checking if we have new nodes without a taint"
NODES_TO_TAINT=$(kubectl get nodes -l nodetype=redis -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers | grep none | wc -l | awk '{print $1}')
echo "$NODES_TO_TAIN require tainting"
if [ NODES_TO_TAINT=="0" ]; then
    exit
fi
kubectl taint nodes -l nodetype=redis app=redis:NoSchedule