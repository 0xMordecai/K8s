# Troubleshooting pods

**Similar to how we can browse logs from a container using `docker logs`, we can browse logs from a container within a Kubernetes pod using the `kubectl logs` command. If more than one container runs within the pod, we can specify the container’s name using the `-c` flag.**

**To access the container logs, run the following command:**

```shell
    kubectl logs nginx -c nginx
    ...
    27.0.0.1 - - [08/Nov/2025:20:59:54 +0000] "GET / HTTP/1.1" 200 615 "-" "curl/8.5.0" "-"
```

**As the pod is running a single container, we need not specify the `-c` flag, so instead, you can use the following command:**

```shell
    kubectl logs nginx
```

**There might be instances where you may want to get a shell to a running container and troubleshoot what’s going on within that. We use `docker exec` for that in the Docker world. Similarly, we can use `kubectl exec` for that within Kubernetes.**

**Run the following command to open a shell session with the container:**
```shell
    kubectl exec -it nginx -- /bin/bash
    root@nginx:/# cd /etc/nginx/ && ls
    conf.d fastcgi_params mime.types modules nginx.conf scgi_params uwsgi_params
    root@nginx:/etc/nginx# exit
```

**You can even run specific commands without opening a shell session. For example, we can perform the preceding operation with a single line, something like the following:**

```shell
    $ kubectl exec nginx -- ls /etc/nginx
    conf.d fastcgi_params mime.types modules nginx.conf scgi_params uwsgi_params
```
**kubectl exec is an important command that helps us troubleshoot containers.**

# Tip I

**If you modify files or download packages within the container in `exec` mode, they will persist until the current pod is alive. Once the pod is gone, you will lose all changes. Therefore, it isn’t a great way of fixing issues. You should only diagnose problems using `exec`, bake the correct changes in a new image, and then redeploy it.**

# Tip II 

**When we looked at `distroless` containers, they did not allow exec into the container for security reasons. There are debug images available for `distroless` that will enable you to open a shell session for troubleshooting purposes if you wish.**

# Tip III

**By default, a container runs as the root user if you don’t specify the user within the Dockerfile while building the image. You can set a `runAsUser` attribute within your pod’s security context if you want to run your pod as a specific user, but this is not ideal. The best practice is to bake the user within the container image.**

**`We’ve discussed troubleshooting running containers, but what if the containers fail to start for some reason?`**

**Let’s look at the following example:**

```shell
    kubectl run nginx-1 --image=nginx-1
```

**Now, let’s try to get the pod and see for ourselves:**

```shell
    $ kubectl get pod nginx-1
    NAME      READY   STATUS             RESTARTS   AGE
    nginx-1   0/1     ImagePullBackOff   0          25s
```

**Oops! There is some error now, and the status is `ImagePullBackOff`. Well, it seems like there is some issue with the image. While we understand that the issue is with the image, we want to understand the real issue, so for further information on this, we can describe the pod using the following command:**

```shell
    kubectl describe pod nginx-1
```

**Now, this gives us a wealth of information regarding the pod, and if you look at the events section, you will find a specific line that tells us what is wrong with the pod:**

```shell 
    Warning  Failed     60s (x4 over 2m43s)  kubelet            Failed to pull image "nginx-
    1": rpc error: code = Unknown desc = failed to pull and unpack image "docker.io/library/
    nginx-1:latest": failed to resolve reference "docker.io/library/nginx-1:latest": pull
    access denied, repository does not exist or may require authorization: server message:
    insufficient_scope: authorization failed
```
**So, this one is telling us that either the repository does not exist, or the repository exists but it is private, and hence authorization failed.**

# Tip IV

You can use kubectl describe for most Kubernetes resources. It should be the first command you use while troubleshooting issues.