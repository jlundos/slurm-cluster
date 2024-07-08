FROM slurm-base:latest

COPY docker-entrypoint.sh /etc/slurm/
RUN chmod +rx /etc/slurm/docker-entrypoint.sh

ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]
