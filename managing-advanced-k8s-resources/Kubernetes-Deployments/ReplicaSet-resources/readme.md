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

**The resource manifest includes `apiVersion` and `kind`, as with any other resource. It also contains a `metadata` section that defines the resource’s `name` and `labels` attributes, similar to any other Kubernetes resource.**

The spec section contains the following attributes:
•   `replicas`: This defines the number of pod replicas matched by the selector to run at a given time.

•   `selector`: This defines the basis on which the ReplicaSet resource will include pods.

**•   `selector.matchLabels`: This defines labels and their values to select pods. Therefore,`the ReplicaSet resource will select any pod with the app: nginx label`.**

**•   `template`: `"This is an optional section that you can use to define the pod template"`. This section’s contents are very similar to defining a pod, except it lacks the name attribute, as the ReplicaSet resource will generate dynamic names for pods. `If you don’t include this section, the ReplicaSet resource will still try to acquire existing pods with matching labels`. However, `it cannot create new pods because of the missing template. Therefore, it is best practice to specify a template for a ReplicaSet resource`.**