# download KinD
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
# make it executable
chmod +x kind
# move it to the default PATH directory
sudo mv kind /usr/local/bin/