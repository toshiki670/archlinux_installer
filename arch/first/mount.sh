#!/bin/bash

mount() {
  if [[ $# != 1 ]]; then
    echo "${0##*/}: Requires 1 argument." >&1
    return 16
  fi

  if [[ ! -b $1 ]]; then
    echo "${0##*/}: $1 isn't a device file." >&1
    return 32
  fi


  mount /dev/mapper/system-root /mnt
  mkdir /mnt/boot
  # mkdir /mnt/boot /mnt/home
  mount $1 /mnt/boot
  # mount /dev/mapper/system-home /mnt/home
}
