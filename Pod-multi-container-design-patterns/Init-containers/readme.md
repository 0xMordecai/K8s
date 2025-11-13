# Init containers
**`Init containers` are run before the main container is bootstrapped, so you can use them to initialize your container environment before the main container takes over. Here are some examples:**

**• A directory might require a particular set of ownership or permissions before you want to start your container using the non-root user**

**• You might want to clone a Git repository before starting the web server**

**• You can add a startup delay**

**• You can generate configuration dynamically, such as for containers that want to dynamically connect to some other pod that it is not aware of during build time but should be during runtime**

# Tip
**Use init containers only as a last resort, as they slow down the startup time of your containers. `Try to bake the configuration within your container image or customize it`.**

**Now, let’s look at an example to see init containers in action.**

Let’s serve the example.com website from our nginx web server. We will get the example.com
web page and save it as index.html in the nginx default HTML directory before starting nginx.
Access the manifest file, nginx-init.yaml, which should contain the following: