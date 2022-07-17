## Build the server with docker
The following describes how to build the fastify server locally

```
make docker
```

## Start the server with docker
The following will start the server in docker

```
docker run --init -p 8080:8080 chrishayuk/fastify-server
```

You can open the browser on http://localhost:8080