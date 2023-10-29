#!/bin/sh

set -e

mkdir -p /mnt/backup/main
mkdir -p /mnt/backup/mspDB
mkdir -p /mnt/backup/public

compat duplicity create /mnt/backup/main /data/data
compat duplicity create /mnt/backup/mspDB /usr/src/app/msp/mspDB
compat duplicity create /mnt/backup/public /usr/src/app/msp/public