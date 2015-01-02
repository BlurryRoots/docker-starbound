FROM ubuntu:14.04

MAINTAINER blurryroots <blurryroots@posteo.de>

# Silence terminal output
ENV DEBIAN_FRONTEND noninteractive
# Update source lists
RUN apt-get update -y && apt-get upgrade -y
# Install dependencies for steamcmd
RUN apt-get install -y lib32gcc
# Install wget to fetch tar
RUN apt-get install -y wget

# Create a user for steam cmd
RUN useradd -m steam && su - steam
# Set execution environment to home of steam
WORKDIR /home/steam
# Fetch steamcmd
RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
# Unpack it and remove archive
RUN tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz

# Create a volume for starbound data
VOLUME /home/steam/starbound

# Set entrypoint to run control script
ENTRYPOINT /bin/bash
