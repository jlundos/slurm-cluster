#!/usr/bin/env bash

sudo cp -a /etc/munge/munge.key ~/ && cd ~ && sudo chown admin:admin ~/munge.key

source ~/shared/mungesetup/define_machines.sh

for m in "${machines[@]}"
do
  echo Coying to : "$m"
  scp ~/munge.key "$m":~
  echo Deploying to : "$m"
  ssh "$m" "sudo chown munge:munge munge.key && sudo mv -f munge.key /etc/munge/munge.key && sudo service munge restart"
done

rm ~/munge.key
