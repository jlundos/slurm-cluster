#!/bin/bash
#
#SBATCH --job-name=first_test
#SBATCH --output=first_test.out
#
#SBATCH --ntasks=24

# Not necessary as we have first_test.py on a shared directory:
##sbcast -f test.py /tmp/test.py

srun python3 first_test.py
