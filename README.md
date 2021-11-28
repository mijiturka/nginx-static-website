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
$ sudo docker build --build-arg SITE_NAME=<something_else> -t server_image .
```

## Run
```
$ sudo docker rm server && sudo docker run -it --name server server_image
```

Or, to expose the server to the host at port 8000:
```
$ sudo docker rm server && sudo docker run -it --name server -p 8000:80 server_image
```

## Test
Now, in your host you can do:
```
$ curl http://localhost:8000                                     
<html> ...
```


# Deploy on Linode

on local:
```
$ export LINODE_USER=<user>
$ export LINODE_IP=<ip>
$ export SITE_NAME=site
$ bash deploy/copy.sh
```

on node:
```
$ export SITE_NAME=site
$ cd /setup
$ bash deploy.sh
```

## Test
```
$ curl http://$LINODE_IP/
```
