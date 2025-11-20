# The need for advanced Kubernetes resources

**In the last chapter, we looked at pods, the basic building blocks of Kubernetes that provide everything for your containers to run within a Kubernetes environment. However, pods on their own are not that effective. The reason is that while they define a container application and its specification, they do not replicate, auto-heal, or maintain a particular state. When you delete a pod, the pod is gone.**

You cannot maintain multiple versions of your code or roll out and roll back releases using a pod. You
also cannot autoscale your application with traffic with pods alone. Pods do not allow you to expose
your containers to the outside world, and they do not provide traffic management capabilities such as
load balancing, content and path-based routing, storing persistent data to externally attached storage,and so on.