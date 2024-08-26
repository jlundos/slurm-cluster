#!/bin/bash

# Set CPUs etc in slurm.conf - the same for all docker containers
sudo /etc/slurm/dockerhelp/fix_cpu_in_slurmconf.sh

sudo service ssh start

/usr/bin/bash
