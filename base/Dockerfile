FROM ubuntu:24.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  less \
  nano \
  iputils-ping \
  sudo \
  openssh-server \
  python3 \
  && apt-get clean \
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
COPY fix_cpu_in_slurmconf.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/fix_cpu_in_slurmconf.sh

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
