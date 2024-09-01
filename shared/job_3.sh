#!/bin/bash
#
#SBATCH --job-name=test_3
# %x = jobname, %N = short hostname, %t = task id. Hmm, we only seem to get ONE output file even if we use the latter?
#SBATCH --output=%x.out
#
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
# cpus-per-task says how many tasks we allocate per cpu.
# Of SelectType=select/linear in slurm.conf then all cpus would be allocated automaticly, but we have SelectType=select/cons_tres as the is the default.
# Connects to oversubscribe/overcommit setting
# What is a good setting if not all threads are 100% busy all the time?
#SBATCH --cpus-per-task=8

srun python3 test_3.py
