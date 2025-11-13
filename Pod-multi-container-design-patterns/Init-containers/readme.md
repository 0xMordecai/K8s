# Init containers
**`Init containers` are run before the main container is bootstrapped, so you can use them to initialize your container environment before the main container takes over. Here are some examples:**

**• A directory might require a particular set of ownership or permissions before you want to start your container using the non-root user**