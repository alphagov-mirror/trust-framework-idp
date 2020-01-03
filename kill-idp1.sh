#!/bin/bash
set -e

  if [ -f "./tmp/pids/idp1.pid" ]; then
    echo "Killing idp1"
    kill "$(< ./tmp/pids/idp1.pid)" || true
    rm -f ./tmp/pids/idp1.pid
  fi
