FROM  slurm-base:latest

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  slurm-client \
  python3-pip \
  python3-venv \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN cd /home/admin && \
  python3 -m venv venv && \
  . ./venv/bin/activate &&  \
  pip3 install jupyterlab_slurm && \
  deactivate

COPY docker-entrypoint.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/docker-entrypoint.sh

# Ports: 8888: jupyterlab
EXPOSE 8888

ENV USER admin
ENV SHELL bash

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
