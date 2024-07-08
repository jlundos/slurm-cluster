FROM slurm-base:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
  apt install -y \
  mariadb-server

COPY docker-entrypoint.sh /etc/slurm/
RUN chmod +rx /etc/slurm/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]
