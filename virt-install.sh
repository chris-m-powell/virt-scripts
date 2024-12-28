#!/bin/bash

NAME="${1}"
OS_VARIANT="${2}" # rhel9.4
CDROM="${3}" # /var/lib/libvirt/images/rhel-9.5-*
RAM="${4}" # 1024
CPUS="${5}" # 1
SIZE="${6}" # 5

virt-install \
  --name "${NAME}" \
  --description "" \
  --os-variant="${OS_VARIANT}" \
  --ram="${RAM}" \
  --vcpus="${CPUS}" \
  --disk pool=default,size="${SIZE}",format=qcow2 \
  --cdrom "${CDROM}" \
  --boot uefi
  #--network bridge:br0 \
