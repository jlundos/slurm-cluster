#!/usr/bin/env python3

import time
import os
import sys
import socket
from datetime import datetime as dt

description = """Test 2: simple job-array example, running the same test_2.py program with a job-array number argument and reading it from a variable. Obviously file input could depend on array task id, etc."""
sleep_sec = 5

if __name__ == '__main__':
    print(f'Process started {dt.now()}')
    local_id = os.environ.get('SLURM_LOCALID')
    if local_id=='0': print(f'{description}')
    print(f'Job name : {os.environ.get('SLURM_JOB_NAME')}')
    print(f'NODE : {socket.gethostname()}')
    print(f'Array task id from environment : {os.environ.get('SLURM_ARRAY_TASK_ID')}')
    print(f'Array task id from cmd line : {sys.argv[1]}')
    print(f'Local task id : {local_id}')
    print(f'PID  : {os.getpid()}')
    print(f'Executing for {sleep_sec} secs')
    time.sleep(sleep_sec)
    print(f'Process finished {dt.now()}\n')
