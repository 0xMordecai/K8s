#   Deployment resources

**`Kubernetes Deployment resources help to manage deployments for container applications. They are typically used for managing stateless workload`s.**

**You can still use them to manage stateful applications, but the recommended approach for stateful applications is to use `StatefulSet` resources.**

**Kubernetes Deployments use `ReplicaSet` resources as a backend**, and the chain of resources looks like what’s shown in the following diagram:

![alt text](img.png)

**Let’s take the preceding example and create an nginx Deployment resource `manifest—nginx-deployment.yaml`:**
```yaml
apiVersion: apps/v1
kind: Deployment
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

**The manifest is very similar to the `ReplicaSet` resource, except for the `kind` attribute — `Deployment`, in this case.**

**Let’s apply the manifest by using the following command:**
```shell
    kubectl apply -f nginx-deployment.yaml
```
**So, as the Deployment resource has been created, let’s look at the chain of resources it created. Let’s run `kubectl get` to list the `Deployment` resources using the following command:**

```shell
$ kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   3/3     3            3           6s
```

**And we see there is one `Deployment` resource called `nginx`, with `3/3 ready pods` and `3 up-to-date pods`. As Deployment resources manage multiple versions, UP-TO-DATE signifies whether the latest Deployment resource has rolled out successfully.**