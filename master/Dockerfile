FROM slurm-base:latest

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  slurmctld \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/spool/slurmctld

COPY docker-entrypoint.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
