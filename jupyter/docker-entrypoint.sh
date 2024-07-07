#!/bin/bash

sudo service munge start

source ./venv/bin/activate

jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

tail -f /dev/null
