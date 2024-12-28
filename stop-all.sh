#!/bin/bash

for i in $(virsh list --name); do
  virsh destroy "${i}"
done
