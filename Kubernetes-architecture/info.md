# Kubernetes architecture

**let’s look at the following diagram to understand the high-level Kubernetes architecture:**

![alt text](image.png)

**The control plane comprises the following components:**

**• `API server`: the `API server` exposes a set of APIs for external and internal actors to interact with Kubernetes. All interactions with Kubernetes happen via the `API server`, as evident from the preceding diagram. If you visualize the Kubernetes cluster as a ship, the `API server` is the ship’s captain.**

**• `Controller manager`: The `controller manager` is the ship’s executive officer and is tasked with ensuring that the captain’s orders are followed in the cluster. From a technical perspective, the `controller manager` reads the current and desired states and takes all actions necessary to move the current state to the desired state. It contains a set of controllers that interact with the Kubernetes components via the API server as and when needed. Some of these are as follows:**

    • Node controller: This watches for when the node goes down and responds by interacting with the Kube scheduler via the Kube API server to schedule the pods to a healthy node.

    • Replication controller: This ensures that the correct amount of container replicas defined by replication controller objects in the cluster exist.

    • Endpoints controller: These assist in providing endpoints to your containers via services.

    • Service account and token controllers: These create default accounts and tokens for new namespaces.

**• `Cloud controller manager`:The `cloud controller manager` interacts with the cloud provider APIs to provision resources such as `persistent disks` and `load balancers` that you declare in your Kubernetes configuration.**

**• `etcd`:  this is a key-value store where all the desired Kubernetes configuration is stored. The `controller manager` refers to the information in this database to action changes in the cluster**

**`•Scheduler`: A `Kubernetes scheduler` schedules containers in a worker node it finds fit after considering the availability of resources to run it, the `HA(High Availability)` of your application, and other aspects.**

**• ``kubelet``: the `kubelet` interacts with the underlying container runtime to run containers on the scheduler’s instruction. While most Kubernetes components can run as a container, the `kubelet` is the only component that runs as a systemd service. They usually run on worker nodes, but if you plan to run the control plane components as containers instead, the `kubelet` will also run on the control plane nodes.**

**• `kube-proxy`: `kube-proxy` runs on each worker node and provides the components for your containers to interact with the network components inside and outside your cluster. They are vital components that facilitate Kubernetes networking.**

**Well, that’s a lot of moving parts, but the good news is that tools are available to set that up for you, and provisioning a `Kubernetes cluster` is very simple. If you are running on a public cloud, it is only a few clicks away, and you can use your cloud’s web UI or CLI to provision it very quickly. You can use `kubeadm` for the setup if you have an `on-premises` installation.**

**For development and your CI/CD environments, you can use `Minikube` or `Kubernetes in Docker(KinD)`.**

**While `Minikube` can run a `single-node` Kubernetes cluster on your development machine directly by using your machine as the node, it can also run a `multi-node cluster` by running Kubernetes nodes as containers.**

**`KinD`, on the other hand, exclusively runs your nodes as containers on both `single-node` and `multi-node` configurations. You need a VM with the requisite resources in both cases, and you’ll be good to go.**