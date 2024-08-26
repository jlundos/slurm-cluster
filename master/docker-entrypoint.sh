#!/bin/bash

# Set CPUs etc in slurm.conf - the same for all docker containers
sudo /etc/slurm/dockerhelp/fix_cpu_in_slurmconf.sh

sudo service munge start

# Store munge.key so it is available for the other nodes
sudo mkdir -p ~admin/shared/mungesetup && sudo chmod u+rwx,go+rx ~admin/shared/mungesetup
sudo cp -a /etc/munge/munge.key ~admin/shared/mungesetup

sudo service ssh start
sudo service slurmctld start

tail -f /dev/null
