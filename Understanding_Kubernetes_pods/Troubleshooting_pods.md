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

# Tip
If you modify files or download packages within the container in exec mode, they will persist
until the current pod is alive. Once the pod is gone, you will lose all changes. Therefore, it isn’t
a great way of fixing issues. You should only diagnose problems using exec, bake the correct
changes in a new image, and then redeploy it.