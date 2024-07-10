FROM slurm-base:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y \
  && apt full-upgrade -y \
  && apt install -y \
  slurmctld \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/spool/slurmctld

COPY docker-entrypoint.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
