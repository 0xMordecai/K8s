# Container Orchestration with Kubernetes

**we will deep dive into container orchestration. We will learn how to `schedule` and `run containers` using the most popular container orchestrator – `Kubernetes`. In this chapter, we’re going to cover the following main topics:**

**• What is Kubernetes, and why do I need it?**

**• Kubernetes architecture**

**• Installing Kubernetes (Minikube and KinD)**

**• Understanding Kubernetes pods**

# What is Kubernetes, and why do I need it?

By now, you should understand what containers are and how to build and run containers using Docker. However, how we ran containers using Docker was not optimal from a production standpoint. Let me give you a few considerations to think about:

• As portable containers can run on any Docker machine just fine, multiple containers also share server resources to optimize resource consumption. Now, think of a microservices application that comprises hundreds of containers. How will you choose what machine to run the containers on? What if you want to dynamically schedule the containers to another machine based on resource consumption?

• Containers provide horizontal scalability as you can create a copy of the container and use a load balancer in front of a pool of containers. One way of doing this is to decide upfront and deploy the desired number of containers, but that isn’t optimal resource utilization. What if I tell you that you need to horizontally scale your containers dynamically with traffic – in other words, by creating additional container instances to handle the extra load when there is more traffic and reducing them when there is less?

• There are container health check reports on the containers’ health. What if the container is unhealthy, and you want to auto-heal it? What would happen if an entire server goes down and you want to schedule all containers running on that server to another?

• As containers mostly run within a server and can see each other, how would I ensure that only the required containers can interact with the other, something we usually do with VMs? We cannot compromise on security.

• Modern cloud platforms allow us to run autoscaling VMs. How can we utilize that from the perspective of containers? For example, if I need just one VM for my containers during the night and five during the day, how can I ensure that the machines are dynamically allocated when we need them?

**• How do you manage the networking between multiple containers if they are part of a more comprehensive service mesh?**