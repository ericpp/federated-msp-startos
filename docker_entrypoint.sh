#!/bin/sh -x

node dockerStart.js

# Run the main application
pm2-docker server/index.js