## Kubernetes Examples

In this folder you'll see 2 files
* proxy-rpl.yaml | Replication controller definitions
* proxy-service.yaml | Service definitions

These files together form the load balancer architecture.

### Preface
I use this setup to create 3 LoadBalancer containers across my 3 Kubernetes/Rancher/docker hosts.
The replication controller currently has 3 replicas set up so that each host gets a LoadBalancer instance.
Additionally to this I've setup 3 DNS entries with the same name so that
the clients can choose which host to hit.

By default this service will try to bind to port 80 and 443 but this can be easily modified in the service and rpl files.


### Instructions

1. Have a Kubernetes cluster setup
2. `cd` to the folder where you definitions files are i.e `./kubernetes-examples`
3. Run `kubectl create -f ./path/to/service.yaml`
4. Run `kubectl create -f ./path/to/replicationCtl.yaml`
5. Hopefully you'll have no errors, if so fix them, and you'll have the service and replication controller running.
6. To verify this you can run `kubectl get service` for the service and `kubectl get rc` for the replication controller



#### Links for mentioned terms

[Kubernetes](http://kubernetes.io/)

[`kubectl`](http://kubernetes.io/docs/user-guide/kubectl-overview/)

[Rancher](http://rancher.com/rancher/)

[Docker](https://www.docker.com/)
