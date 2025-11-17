# install MiniKube

**We will install `Minikube` in the same Linux machine we used to install `Docker`**

**First, we will install `kubectl`. As described previously, `kubectl` is the command-line utility that interacts with the Kubernetes API server. We will use `kubectl` multiple times in this book.**

**To download the latest release of `kubectl`, run the following command:**
```shell
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

**We will Install kubectl to /usr/local/bin/kubectl**
```shell
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
**Now, let’s check whether kubectl has been successfully installed by running the following command:**
```shell
    kubectl version --client
```

**Since kubectl was installed successfully, you must download the minikube binary and then move it to your system path using the following commands:**
```shell
    curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

**Now, let’s install the packages required by Minikube to function correctly by running the following command:**
```shell
    sudo apt-get install -y conntrack
```

**Check if there is existing Docker contexts**
```shell
    docker context ls
```

**We will set Docker context to `default` to avoid problems running minikube**