# ReplicaSet resources
**`ReplicaSet resources are Kubernetes controllers that help you run multiple pod replicas at a given time`. They provide horizontal scaling for your container workloads, forming the basic building block of a horizontal scale set for your containers, `a group of similar containers tied together to run as a unit`.** 

**`ReplicaSet` resources define the number of pod replicas to run at a given time. The Kubernetes controller then tries to maintain the replicas and recreates a pod if it goes down.**

# Tip
**You should never use `ReplicaSet` resources on their own, but instead, they should act as a backend to a `Deployment` resource.**

For understanding, however, let’s look at an example:

**The `ReplicaSet` resource manifest, `nginx-replica-set.yaml`, looks like this:**
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```