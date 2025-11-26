# ReplicaSet resources
**`ReplicaSet resources are Kubernetes controllers that help you run multiple pod replicas at a given time`. They provide horizontal scaling for your container workloads, forming the basic building block of a horizontal scale set for your containers, `a group of similar containers tied together to run as a unit`.** 

ReplicaSet resources define the number of pod replicas to run at a given time. The Kubernetes controller then tries to maintain the replicas and recreates a pod if it goes down.