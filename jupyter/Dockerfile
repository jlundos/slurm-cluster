FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
  apt install -y \
  munge \
  nano \
  iputils-ping \
  openssh-server \
  build-essential \
  git \
  mariadb-server \
  wget \
  slurm-wlm \
  slurm-wlm-basic-plugins \
  sudo \
  python3 \
  python3-pip \
  python3-venv \
  libopenmpi-dev \
  python3-mpi4py \
  python3-jupyterlab-server \
  curl \
  dirmngr \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  node-configurable-http-proxy

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
  echo "admin:admin" | chpasswd && \
  adduser admin sudo && \
  echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Make mount point for shared volume
RUN mkdir /home/admin/shared

RUN cd /home/admin && \
  python3 -m venv venv && \
  . ./venv/bin/activate &&  \
  pip3 install jupyterlab_slurm && \
  deactivate

COPY slurm.conf /etc/slurm/
RUN chmod +r /etc/slurm/slurm.conf
COPY cgroup.conf /etc/slurm/
COPY docker-entrypoint.sh /etc/slurm/
RUN chmod +rx /etc/slurm/docker-entrypoint.sh

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]
