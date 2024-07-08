#!/usr/bin/env bash

source ~/shared/mungesetup/define_machines.sh

for m in "${machines[@]}"
do
  echo Testing: "$m"
  ssh "$m" "munge -n" | unmunge
done
