#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm/slurm.conf

sudo service munge start

# Store munge.key so it is available for the other nodes
sudo mkdir -p ~admin/shared/mungesetup && sudo chmod u+rwx,go+rx ~admin/shared/mungesetup
sudo cp -a /etc/munge/munge.key ~admin/shared/mungesetup

sudo service ssh start
sudo service slurmctld start

tail -f /dev/null
