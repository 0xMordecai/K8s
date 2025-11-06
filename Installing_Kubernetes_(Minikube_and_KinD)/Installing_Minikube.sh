# Download the latest release of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Test to ensure the version you installed is up-to-date
kubectl version --client

curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64