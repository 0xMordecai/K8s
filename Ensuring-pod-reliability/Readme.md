# Ensuring pod reliability
**We talked about health checks , Creating and Managing Container Images, and I also mentioned that you should not use them on the Docker level and instead use the ones provided by your container orchestrator. Kubernetes provides three probes to monitor your pod’s health – the `startup probe`, `liveness probe`, and `readiness probe`.**

**The following diagram depicts all three probes graphically:**
![alt text](figure.png)

# Startup probe
**Kubernetes uses `startup probes` to check whether the application has started. `You can use startup probes on applications that start slow or those you don’t know how long it might take to start`. While the startup probe is active, it disables other probes so that they don’t interfere with its operation. As the application has not started until the startup probe reports it, there is no point in having any other probes active.**