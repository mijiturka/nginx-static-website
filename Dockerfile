FROM debian:10

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx
# Not required, but convenient to have
RUN apt-get -y install curl

ARG SITE_NAME=app
ENV SITE_NAME=$SITE_NAME

# Configure NGINX
WORKDIR /home/root/setup
COPY nginx/ .
RUN /bin/bash configure.sh

# Put the files on the server
COPY $SITE_NAME/ /www/$SITE_NAME/

# CMD /bin/bash
CMD nginx && /bin/bash
