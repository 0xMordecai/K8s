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