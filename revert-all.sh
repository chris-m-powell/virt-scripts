#!/bin/bash

snapshot_name="initial"

for i in $(virsh list --name); do
  virsh destroy "${i}"
done

for i in $(virsh list --name --inactive); do
  echo "Reverting ${i} to ${snapshot_name}"
  virsh snapshot-revert \
    --domain "${i}" \
    --snapshotname "${snapshot_name}"
done
