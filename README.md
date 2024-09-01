# Slurm Cluster

## Docker local slurm cluster

- Created by: Rodrigo Ancavil del Pino in relation to the blog post https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601
- Updated to a newer version of Ubuntu, and further adapted and modified by: Jens Lund in https://github.com/jlundos/slurm-cluster
- Examples are inspired by https://github.com/statgen/SLURM-examples

This repository sets up a basic slurm cluster in docker containers, i.e. it runs several docker contains on the same machine in order to facilitate experimentation with the Slurm job scheduler.

It is not meant for production use but rather testing and learning.

The repository https://github.com/giovtorres/slurm-docker-cluster is similar in spirit, so also good for inspiration.

We do not cover setting up docker on you host machine etc. in this `README`, but only how to use the setup made here.

## Structure of the network

The docker compose file starts five containers:

- `slurmjupyter`, the frontend running the `slurm-client` and connects to
- `slurmmaster`, that controls the slurm network/nodes/job scheduling, running `slurmctld` and connects to the three
- `slurmnode[1-3]`, compute nodes, running the slurm daemon `slurmd` and actually executing the jobs.

## Building, starting and stoping the docker containers

The docker commands below might needed to be run as root depending on your setup.
In that case use `sudo` in front of the commands.

Build docker images by:

    $ make -j 3

The `-j 3` option builds the three images in parallel.

To run the slurm cluster environment you must execute:

    $ docker compose -f docker-compose-jupyter.yml up -d

Leave out the `-d` option to have service log statements in the terminal.
This will however block the terminal and you can then stop the services by `ctrl-c`.

To stop it, you must:

    $ docker compose -f docker-compose-jupyter.yml stop

To check logs:

    $ docker compose -f docker-compose-jupyter.yml logs -f

    (stop logs with `ctrl-c`)

To check running containers:

    $ docker compose -f docker-compose-jupyter.yml ps

## Connecting to the `slurmjupyter` node

Point a browser to `http://localhost:8888`.

## Submitting your first job and basic slurm commands

From the browser connected to the `slurmjupyter` node, start af terminal by clicking the terminal icon.
The following can be an inspiration of some basic Slurm commands:

- `sinfo` shows basic Slurm partition information.
- `scontrol show node` should show basic information on all nodes in the cluster.
  Note e.g. the `State=` information.
  If it says `State=IDLE` the nodes should be ready to accept jobs.
- `sbatch` submits a job, see the next section.
- `squeue` shows the job queue.

## Examples included here

The `shared` directory contains a few simple examples.
`job_[1-3].sh` are job scripts that runs the `test_[1-3].py` programs in various ways.

To get started and submit your first job:

    cd shared
    sbatch job_1.sh

The output will be in `*.out` files afterwards. See the job shell scripts and python programs for more details.

- `job_1.sh`/`test_1.py`, simply runs the same programme multiple times on the cluster.
- `job_2.sh`/`test_2.py`, is a simple job-array example to run jobs with different inputs and outputs.
- `job_3.sh`/`test_3.py`, demonstrates how to run a multithreaded programme at each node in the cluster.

## Problem solving

- Logging into running containers

  From the `slurmjupyter` terminal, use e.g. `ssh slurmnode1` to log into the first compute node or `ssh slurmmaster` for the control node.

  The default user is `admin` with password `admin`.
- `sudo`: the default `admin` user can run scripts as `root` in the containers with `sudo` without password.
- Inspect logs, e.g.

      sudo cat /var/log/slurm/slurmd.log

  on a compute node. or

      sudo cat /var/log/slurm/slurmctld.log 

  on the master node.
