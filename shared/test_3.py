#!/usr/bin/env python3

import time
import os
import socket
from datetime import datetime as dt
import multiprocessing as mp

description = """Test 3: a multithreaded program at each node, running the same test_3.py program on all nodes and let it use multiple threads."""

def pool_task(number):
    print(f'Hello from pool task {number} on {socket.gethostname()}, pid {os.getpid()}')
    sleep_sec = 1 # Let task sleep for this many seconds to simulate "real work" - otherwise we wouldn't see all thread pool ids in the output.
    time.sleep(sleep_sec)

if __name__ == '__main__':
    print('\n---\n')
    print(f'Process started {dt.now()}')
    local_id = os.environ.get('SLURM_LOCALID')
    if local_id=='0': print(f'{description}')
    print(f'Job name : {os.environ.get('SLURM_JOB_NAME')}')
    node = socket.gethostname()
    print(f'NODE : {node}')
    print(f'Slurm CPUs on node : {os.environ.get('SLURM_CPUS_ON_NODE')}')
    print(f'Python CPUs on node : {mp.cpu_count()}')
    print(f'Number of nodes allocated : {os.environ.get('SLURM_JOB_NUM_NODES')}')
    print(f'CPUs per task : {os.environ.get('SLURM_CPUS_PER_TASK')}')
    print(f'Ntasks : {os.environ.get('SLURM_NTASKS')}')
    print(f'Local task id : {local_id}')
    print(f'PID  : {os.getpid()}')
    tasks_to_run_in_pool = 40
    print(f'We will run {tasks_to_run_in_pool} tasks in the pool')
    pool = mp.Pool()
    print(f'\n{node} threadpool information : {pool}')
    mp_children = mp.active_children()
    print(f'{node} threadpool with {len(mp_children)} children : {mp_children}')
    pool.map(pool_task,range(tasks_to_run_in_pool))
    print(f'Process finished {dt.now()}\n')
