FROM  slurm-base:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
  apt install -y \
  python3-pip \
  python3-venv \
  python3-jupyterlab-server \
  dirmngr \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  node-configurable-http-proxy

RUN cd /home/admin && \
  python3 -m venv venv && \
  . ./venv/bin/activate &&  \
  pip3 install jupyterlab_slurm && \
  deactivate

COPY docker-entrypoint.sh /etc/slurm/
RUN chmod +rx /etc/slurm/docker-entrypoint.sh

# Ports: 8888: jupyterlab
EXPOSE 8888

ENV USER admin
ENV SHELL bash

ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]
