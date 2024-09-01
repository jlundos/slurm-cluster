#!/bin/bash
#
#SBATCH --job-name=test_1
#SBATCH --output=test_1.out
#
#SBATCH --ntasks=24

# Not necessary as we have first_test.py on a shared directory:
##sbcast -f test.py /tmp/test.py

srun python3 test_1.py
