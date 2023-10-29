#!/bin/sh

set -e

export ADMIN_USER=$(yq .username < /data/start9/config.yaml)
export ADMIN_PASSWORD=$(yq .password < /data/start9/config.yaml)

exec pm2-runtime server/index.js