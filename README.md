Simple setup for serving static websites via NGINX.

Assuming:
* all required files are in a single folder and should be servable
* subfolders should not be browsable (conveniently, this is the default option for NGINX)

Inspired by:
* https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/

# Locally

## Build
```
$ sudo docker build -t server_image .
```

Or, to use a different top-level directory for files:
```
$ sudo docker build --build-arg APP_NAME=<something_else> -t server_image .
```

## Run
```
$ sudo docker rm server && sudo docker run -it --name server server_image
```

Or, to expose the server to the host at port 8000:
```
$ sudo docker rm server && sudo docker run -it --name server -p 8000:80 server_image
```

Now, in your host you can do:
```
$ curl http://localhost:8000                                     
<html>
<head>
  <title>Success!</title>
</head>

<body>
  <h1>You've reached it!</h1>
  Huzzah. Here's <a href="another.html">another page.</a>
</body>

</html>
```
