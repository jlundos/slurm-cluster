#!/usr/bin/env python3

import time
import os
import socket
from datetime import datetime as dt

description = """Test 1: run the same test_1.py program as many times as ntasks specified in the job_1.sh script"""
sleep_sec = 5

if __name__ == '__main__':
    print(f'Process started {dt.now()}')
    local_id = os.environ.get('SLURM_LOCALID')
    if local_id=='0': print(f'{description}')
    print(f'Job name : {os.environ.get('SLURM_JOB_NAME')}')
    print(f'NODE : {socket.gethostname()}')
    print(f'Local task id : {local_id}')
    print(f'PID  : {os.getpid()}')
    print(f'Executing for {sleep_sec} secs')
    time.sleep(sleep_sec)
    print(f'Process finished {dt.now()}\n')
