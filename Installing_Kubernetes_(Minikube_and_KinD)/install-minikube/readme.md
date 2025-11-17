# install MiniKube

**We will install `Minikube` in the same Linux machine we used to install `Docker`**

**First, we will install `kubectl`. As described previously, `kubectl` is the command-line utility that interacts with the Kubernetes API server. We will use `kubectl` multiple times in this book.**

**To download the latest release of `kubectl`, run the following command:**
```shell
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

**Install kubectl to /usr/local/bin/kubectl**
```shell
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
Test to ensure the version you installed is up-to-date
kubectl version --client