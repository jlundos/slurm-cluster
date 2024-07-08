FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y \
  && apt full-upgrade -y \
  && apt install -y \
  nano \
  iputils-ping \
  sudo \
  openssh-server \
  python3 \
  libopenmpi-dev \
  python3-mpi4py \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/slurm/dockerhelp
COPY slurm.conf /etc/slurm/
RUN chmod +r /etc/slurm/slurm.conf
COPY cgroup.conf /etc/slurm/

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
  echo "admin:admin" | chpasswd && \
  adduser admin sudo && \
  echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Make mount point for shared drive/volume where development can happen and automatickly be distributed among nodes
RUN mkdir /home/admin/shared

WORKDIR /home/admin

COPY docker-entrypoint.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
