#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=result.out
#
#SBATCH --ntasks=6

# Not necessary as we have first_test.py on a shared directory:
##sbcast -f test.py /tmp/test.py

srun python3 first_test.py
