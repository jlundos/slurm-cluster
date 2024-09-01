#!/bin/bash
#
#SBATCH --job-name=test_1
#SBATCH --output=test_1.out
#
#SBATCH --ntasks=24

# sbcast can be used to distribute files to nodes
# Not necessary as we have test_1.py on a shared directory:
##sbcast -f test.py /tmp/test.py

srun python3 test_1.py
