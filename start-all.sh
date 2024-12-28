#!/bin/bash

for i in $(virsh list --name --inactive); do
  virsh start "${i}"
done

virt-manager \
  --connect qemu:///system \
  --show-domain-console controller
