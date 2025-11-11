# Ensuring pod reliability
**We talked about health checks , Creating and Managing Container Images, and I also mentioned that you should not use them on the Docker level and instead use the ones provided by your container orchestrator. Kubernetes provides three probes to monitor your pod’s health – the `startup probe`, `liveness probe`, and `readiness probe`.**

**The following diagram depicts all three probes graphically:**
![alt text](figure.png)

# Startup probe
**Kubernetes uses `startup probes` to check whether the application has started. `You can use startup probes on applications that start slow or those you don’t know how long it might take to start`. While the startup probe is active, it disables other probes so that they don’t interfere with its operation. As the application has not started until the startup probe reports it, there is no point in having any other probes active.**

# Readiness probe
**`Readiness probes` ascertain whether a container is ready to serve requests. `They differ from startup probes because, unlike the startup probe, which only checks whether the application has started, the readiness probe ensures that the container can begin to process requests`. A pod is ready when all the containers of the pod are ready. Readiness probes ensure that no traffic is sent to a pod if the pod is not ready. Therefore, it allows for a better user experience.**

# Liveness probe
**`Liveness probes` are used to check whether a container is running and healthy. `The probe checks the health of the containers periodically. If a container is found to be unhealthy, the liveness probe will kill the container. If you’ve set the restartPolicy field of your pod to Always or OnFailure, Kubernetes will restart the container`. Therefore, it improves the service’s reliability by detecting deadlocks and ensuring the containers are running instead of just reporting as running.**

# Probes in action
**Let’s improve the last manifest and add some probes to create the following `nginx-probe.yaml` manifest file:**

```yaml
 ...
    startupProbe:
      exec:
        command:
        - cat
        - /usr/share/nginx/html/index.html
      failureThreshold: 30
      periodSeconds: 10
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 5
    livenessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 3
  restartPolicy: Always
```