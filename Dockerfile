# Use the Latest LTS Ubuntu Version
FROM ubuntu:16.04

MAINTAINER HONK Technologies, Inc.

# Curl Nonsense to get NodeJS 6.X (LTS) Version
RUN apt-get -yy update && apt-get -yy install curl \
&& (curl -sL https://deb.nodesource.com/setup_6.x | bash -) \
&& apt-get -yy install \
    build-essential \
    git \
    nginx \
    nodejs \
    rsyslog \
    libpq-dev \
&& rm -rf /var/lib/apt/lists/*

# Copy our nginx config to the right place
COPY nginx.conf /etc/nginx/nginx.conf

# Port corresponding to the port we send traffic to in our nginx.conf
ENV PORT=5000

# Set the Working Directory for All Commands that Follow
WORKDIR /app