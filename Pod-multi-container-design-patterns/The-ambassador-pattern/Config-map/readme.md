# Config map
**A `config map` contains key-value pairs that we can use for various purposes, such as defining environment-specific properties or injecting an external variable at container startup or during runtime.**

**The idea of the config map is to decouple the application with configuration and to externalize configuration at a Kubernetes level. It is similar to using a properties file, for example, to define the environment-specific configuration.**

**The following diagram explains this beautifully:**

![alt text](image.png)

We will use ConfigMap to define the connection properties of the external Redis database within
the ambassador container.