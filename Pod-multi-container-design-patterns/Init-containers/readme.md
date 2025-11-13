# Init containers
**`Init containers` are run before the main container is bootstrapped, so you can use them to initialize your container environment before the main container takes over. Here are some examples:**

**• A directory might require a particular set of ownership or permissions before you want to start your container using the non-root user**

**• You might want to clone a Git repository before starting the web server**

**• You can add a startup delay**

**• You can generate configuration dynamically, such as for containers that want to dynamically connect to some other pod that it is not aware of during build time but should be during runtime**

# Tip
**Use init containers only as a last resort, as they slow down the startup time of your containers. `Try to bake the configuration within your container image or customize it`.**

**Now, let’s look at an example to see init containers in action.**

**Let’s serve the `example.com` website from our nginx web server. We will get the `example.com` web page and save it as `index.html` in the nginx default HTML directory before starting `nginx`. Access the manifest file, `nginx-init.yaml`, which should contain the following:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
  - name: nginx-container
    image: nginx
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: html-volume
  initContainers:
  - name: init-nginx
    image: busybox:1.28
    command: ['sh', '-c', 'mkdir -p /usr/share/nginx/html && wget -O /usr/share/nginx/html/index.html http://example.com']
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: html-volume
  volumes:
  - name: html-volume
    emptyDir: {}
```

**If we look at the spec section of the manifest file, we’ll see the following:**

**• `containers`: This section defines one or more containers that form the pod.**

**• `containers.name`: This is the container’s name, which is `nginx-container` in this case.**

**• `containers.image`: This is the container image, which is nginx in this case.**

**• `containers.volumeMounts`: This defines a list of volumes that should be mounted to the container. It is similar to the volumes we read about in `Creating and Managing Container Images`.**

**• `containers.volumeMounts.mountPath`: This defines the path to mount the volume on, which is `/usr/share/nginx/html` in this case. We will share this volume with the init container so that when the init container downloads the `index.html` file from `example. com`, this directory will contain the same file.**

**• `containers.volumeMounts.name`: This is the name of the volume, which is `html-volume` in this case.**

**• `initContainers`: This section defines one or more init containers that run before the main containers.**

**• `initContainers.name`: This is the init container’s name, which is `init-nginx` in this case.**

**• `initContainers.image`: This is the init container image, which is `busybox:1.28 `in this case.**

**• `initContainers.command`: This is the command that the busybox should execute. In this case, `'mkdir -p /usr/share/nginx/html && wget -O /usr/share/ nginx/html/index.html http://example.com'` will download the content of `example.com` to the `/usr/share/nginx/html` directory.**

**• `initContainers.volumeMounts`: We will mount the same volume we defined in `nginx-container` on this container. So, anything we save in this volume will automatically appear in `nginx-container`.**

**• `initContainers.volumeMounts.mountPath`: This defines the path to mount the volume on, which is `/usr/share/nginx/html` in this case.**

**• `initContainers.volumeMounts.name`: This is the name of the volume, which is `html-volume` in this case.**

**`volumes`: This section defines one or more volumes associated with the pod’s containers.**

**`volumes.name`: This is the volume’s name, which is `html-volume` in this case.**

**`volumes.emptyDir`: This defines an `emptyDir` volume. It is similar to a `tmpfs` volume in Docker. Therefore, it is not persistent and lasts just for the container’s lifetime.**

**So, let’s go ahead and apply the manifest and watch the pod come to life using the following commands:**

```shell
kubectl delete pod nginx && kubectl apply -f nginx-init.yaml && \
kubectl get pod nginx -w
NAME    READY   STATUS            RESTARTS   AGE
nginx   0/1     Init:0/1          0          0s
nginx   0/1     PodInitializing   0          1s
nginx   1/1     Running           0          3s
```

**Initially, we can see that the `nginx` pod shows a status of `Init:0/1`. `This means that 0 out of 1 init containers have started initializing`. After some time, we can see that the pod reports its status, `PodInitializing`, `which means that the init containers have started running`. The pod reports a running status once the init containers have run successfully.**

**Now, once the pod starts to run, we can port-forward the container from port 80 to host port 8080 using the following command:**
```shell
    kubectl port-forward nginx 8080:80
```

Open a duplicate Terminal and try to curl the localhost on port 8080 by using the following command: