#!/bin/sh

set -e

compat duplicity restore /mnt/backup/main /data/data
compat duplicity restore /mnt/backup/mspDB /usr/src/app/msp/mspDB
compat duplicity restore /mnt/backup/public /usr/src/app/msp/public