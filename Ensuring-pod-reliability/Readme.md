# Ensuring pod reliability
We talked about health checks , Creating and Managing Container Images, and I also mentioned that you should not use them on the Docker level and instead use the ones provided by your container orchestrator. Kubernetes provides three probes to monitor your pod’s health – the startup probe, liveness probe, and readiness probe.

![alt text](figure.png)