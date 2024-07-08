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
  libopenmpi-dev \
  python3-mpi4py

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
  echo "admin:admin" | chpasswd && \
  adduser admin sudo && \
  echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Make mount point for shared volume
RUN mkdir /home/admin/shared

COPY slurm.conf /etc/slurm/
RUN chmod +r /etc/slurm/slurm.conf
COPY cgroup.conf /etc/slurm/
COPY docker-entrypoint.sh /etc/slurm/
RUN chmod +rx /etc/slurm/docker-entrypoint.sh

EXPOSE 6817 6818 3306

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]
