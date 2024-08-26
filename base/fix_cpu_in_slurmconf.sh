#!/bin/bash

# Set CPUs etc in slurm.conf - the same for all docker containers.
# The following also sets CoresPerSocket and ThreadsPerCore - note that CPUs might not be the product of these two when only some cores have hyperthreading (P vs E cores).

sed -i "s/REPLACE_IT/CPUs=$(nproc) CoresPerSocket=$(lscpu | grep 'Core(s) per socket:' | cut -d ' ' -f 4- | tr -d ' ') ThreadsPerCore=$(lscpu | grep 'Thread(s) per core:'  | cut -d ' ' -f 4- | tr -d ' ')/g" /etc/slurm/slurm.conf
