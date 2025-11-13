# The ambassador pattern
---

### **What the text is saying**

The **Ambassador Pattern** is named after a real ambassador — someone who represents their country in another country.

In software, an **ambassador** works like a *representative* or *proxy* for your application.

---

### **Why this matters**

Imagine you have a Python Flask app that was originally running directly on your laptop or server (not in containers).
Inside that app, the code connects to a Redis database using:

```
localhost
```

Because previously the database was on the same machine.

---

### **The problem after containerizing**

Now you put the app inside a container.

But inside a container:

* **localhost refers to the container itself**,
  not the machine running Docker.

So the app will NOT find Redis anymore.

---

### **Where the Ambassador Pattern helps**

You create a small helper container (the **ambassador**):

* The Flask app connects to the ambassador using **localhost** (so no code changes).
* The ambassador forwards that traffic to the real Redis database running on the host machine or somewhere else.

So the ambassador acts like a **bridge or representative** between the app container and the real Redis.

---

### **Summary (super simple)**

> Your old app expects the database at `localhost`.
> When you put it in a container, localhost no longer points to the database.
>
> So you add an *ambassador container* that pretends to be the database on localhost and forwards the traffic to the real one.

---

If you want, I can draw a diagram of how the ambassador pattern works.
