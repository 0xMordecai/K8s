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
```shell
    docker context use default
```

**Finally, we can bootstrap a `Minikube` cluster using the following command:**
```shell
    minikube start --driver=docker
```


**As `Minikube` is now up and running, we will use the `kubectl command-line` utility to interact with the Kube API server to manage Kubernetes resources. The `kubectl commands` have a standard structure and are self-explanatory in most cases. They are structured as follows:**
```shell
    kubectl <verb> <resource type> <resource name> [--flags]
```

**Here, we have the following:**

**• `verb`: The action to perform – for example, `get`, `apply`, `delete`, `list`, `patch`, `run`,and so on**

**• `resource type`: The Kubernetes resource to manage, such as `node`, `pod`, `deployment`,`service`, and so on**

**• `resource name`: The name of the resource to manage**

**Let’s use kubectl to get nodes and check whether our cluster is ready to run our containers**
```shell
    $ kubectl get nodes
    NAME       STATUS   ROLES           AGE     VERSION
    minikube   Ready    control-plane   2m25s   v1.26.3
```