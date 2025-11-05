# Kubernetes architecture

**let’s look at the following diagram to understand the high-level Kubernetes architecture:**

![alt text](image.png)

The control plane comprises the following components:

**• `API server`: the `API server` exposes a set of APIs for external and internal actors to interact with Kubernetes. All interactions with Kubernetes happen via the `API server`, as evident from the preceding diagram. If you visualize the Kubernetes cluster as a ship, the `API server` is the ship’s captain.**

**• `Controller manager`: The `controller manager` is the ship’s executive officer and is tasked with ensuring that the captain’s orders are followed in the cluster. From a technical perspective, the `controller manager` reads the current and desired states and takes all actions necessary to move the current state to the desired state. It contains a set of controllers that interact with the Kubernetes components via the API server as and when needed. Some of these are as follows:**