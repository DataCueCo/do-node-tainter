# Node Tainter for Digital Ocean Managed Kubernetes

Currently, it is not possible to taint new nodes in a node pool automatically. Deploy this project in your cluster and it'll watch for new nodes via cronjob.

# Quick start

First modify these two files to fit what you need:

1. `cronjob.yaml` - adjust the frequency as you like, it's currently set to run every 15 mins.
2. `taint-nodes.sh` - change the node pool names and change the taint to what you need.
3. Change the namespace in `node-tainter.yaml` to what you need, I use `default`

Then, deploy!

`kubectl create -f node-tainter.yaml`
