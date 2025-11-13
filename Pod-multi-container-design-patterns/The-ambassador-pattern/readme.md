# The ambassador pattern
**The `ambassador pattern` derives its name from an ambassador, an envoy representing a country overseas. You can also think of an ambassador as a proxy of a particular application. Let’s say, for example, that you have migrated one of your existing Python Flask applications to containers, and one of your containers needs to communicate with a Redis database. The database always existed in the local host. Therefore, the database connection details within your application contain `localhost` everywhere.**

**Now, there are two approaches you can take:**

**1 • You can change the application code and use config maps and secrets (more on these later) to inject the database connection details into the environment variable.**

•You can keep using the existing code and use a second container as a TCP proxy to the Redis
database. The TCP proxy will link with the config map and secrets and contain the Redis
database’s connection details.