#!/bin/bash
#
#SBATCH --job-name=test_2
# %a is replaced with array task id, if not done this way output is mixed up for job arrays
#SBATCH --output=test_2_task_%a.out
#
#SBATCH --array=1-24

srun python3 test_2.py $SLURM_ARRAY_TASK_ID
