#   Deployment resources

**`Kubernetes Deployment resources help to manage deployments for container applications. They are typically used for managing stateless workload`s.**

**You can still use them to manage stateful applications, but the recommended approach for stateful applications is to use `StatefulSet` resources.**

**Kubernetes Deployments use `ReplicaSet` resources as a backend**, and the chain of resources looks like what’s shown in the following diagram: