# Container Orchestration with Kubernetes

**we will deep dive into container orchestration. We will learn how to `schedule` and `run containers` using the most popular container orchestrator – `Kubernetes`. In this chapter, we’re going to cover the following main topics:**

**• What is Kubernetes, and why do I need it?**

**• Kubernetes architecture**

**• Installing Kubernetes (Minikube and KinD)**

**• Understanding Kubernetes pods**

# What is Kubernetes, and why do I need it?

By now, you should understand what containers are and how to build and run containers using Docker. However, **how we ran containers using Docker was not optimal from a production standpoint**. Let me give you a few considerations to think about:

• As portable containers can run on any Docker machine just fine, **multiple containers also share server resources to optimize resource consumption**. Now, **think of a microservices application that comprises hundreds of containers. `How will you choose what machine to run the containers on`? `What if you want to dynamically schedule the containers to another machine based on resource consumption`?**

• **Containers provide horizontal scalability as you can create a copy of the container and use a `load balancer` in front of a pool of containers.** *One way of doing this is to decide upfront and deploy the desired number of containers, but that isn’t optimal resource utilization*. **What if I tell you that you need to horizontally scale your containers dynamically with traffic** – in other words, *by creating additional container instances to handle the extra load when there is more traffic and reducing them when there is less*?

• *There are container health check reports on the containers’ health*. **What if the container is unhealthy, and you want to auto-heal it? What would happen if an entire server goes down and you want to schedule all containers running on that server to another?**

• *As containers mostly run within a server and can see each other*, **how would I ensure that only the required containers can interact with the other**, something we usually do with VMs? We cannot compromise on security.

• **Modern cloud platforms allow us to run autoscaling VMs**. **How can we utilize that from the perspective of containers?** For example, *if I need just one VM for my containers during the night and five during the day*, **how can I ensure that the machines are dynamically allocated when we need them?**

**• How do you manage the networking between multiple containers if they are part of a more comprehensive service mesh?**

**The answer to all these questions is a container orchestrator, and the most popular and de facto standard for that is Kubernetes.**

Kubernetes is an open-source container orchestrator originally developed by Google and now maintained by the Cloud Native Computing Foundation (CNCF). It has revolutionized infrastructure management by treating servers as a unified cluster capable of running any containerized application, removing the need to handle high availability, scalability, and disaster recovery separately for each app.

Kubernetes provides:

Centralized control via an API server and kubectl command-line tool.

Container scheduling by choosing the right server to run containers through the kubelet.

State management using etcd, a key-value store that maintains the desired configuration and automatically corrects deviations.

Networking and service discovery through a virtual IP system and DNS, allowing containers to communicate seamlessly across nodes.

Cloud integration for automating resources like load balancers and persistent storage.

In essence, Kubernetes automates container deployment, scaling, networking, and maintenance, providing high availability, scalability, and zero downtime out of the box.