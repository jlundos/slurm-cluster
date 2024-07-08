#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm/slurm.conf

# Copy munge.key stored by slurmmaster
sudo cp -a -f ~admin/shared/mungesetup/munge.key /etc/munge/munge.key

sudo service munge start
sudo service ssh start
sudo slurmd -N $(hostname)

tail -f /dev/null
