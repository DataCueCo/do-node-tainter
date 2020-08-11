# Node Tainter for Digital Ocean Managed Kubernetes

Currently, it is not possible to taint new nodes in a node pool automatically. Deploy this project in your cluster and it'll watch for new nodes via cronjob.

You'll want to modify two files:

1. `cronjob.yaml` - adjust the frequency as you like, it's currently set to run every 15 mins.
2. `taint-nodes.sh` - change the node pool names and change the taint to what you need.

That's it!
