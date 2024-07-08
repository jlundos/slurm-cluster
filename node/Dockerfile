FROM slurm-base:latest

RUN apt update -y \
  && apt full-upgrade -y \
  && apt install -y \
  slurmd \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /etc/slurm/dockerhelp
RUN chmod +rx /etc/slurm/dockerhelp/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/dockerhelp/docker-entrypoint.sh"]
