# slurm-cluster
Docker local slurm cluster

Created by: Rodrigo Ancavil del Pino

https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601

The docker commands below might needed to be run as root depending on your setup.
In that case use `sudo` in front of the commands.

Build docker images by:

     $ make -j 3

The `-j 3` option builds the three images in parallel.

To run slurm cluster environment you must execute:

     $ docker-compose -f docker-compose-jupyter.yml up -d

To stop it, you must:

     $ docker-compose -f docker-compose-jupyter.yml stop

To check logs:

     $ docker-compose -f docker-compose-jupyter.yml logs -f

     (stop logs with CTRL-c")

To check running containers:

     $ docker-compose -f docker-compose-jupyter.yml ps

# Problem solving

If `sinfo` in a terminal (in jupyterlab) gives:

     admin@slurmjupyter:~$ sinfo
     slurm_load_partitions: Unexpected message received

then it is most likely because the generated munge keys are not identical on all nodes.
Fix is from the `~/shared/mungesetup` directory to run `distribute_mungekey.sh`:

     admin@slurmjupyter:~$ cd shared/mungesetup/
     admin@slurmjupyter:~/shared/mungesetup$ ./distribute_mungekey.sh

and answer `yes` to ssh key question and use the user `admin`s password `admin`.
