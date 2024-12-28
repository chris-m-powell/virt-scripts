#!/bin/bash

for i in $(virsh list --name); do
  virsh destroy "${i}"
done

for i in $(virsh list --name --inactive); do
  for j in $(virsh snapshot-list --name ${i}); do
    virsh snapshot-delete \
      --domain "${i}" \
      --snapshotname "${j}"
  done
  virsh undefine "${i}" \
    --nvram \
    --remove-all-storage
done
