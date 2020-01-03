#!/bin/bash
set -e

  if [ -f "./tmp/pids/idp2.pid" ]; then
    echo "Killing idp2"
    kill "$(< ./tmp/pids/idp2.pid)" || true
    rm -f ./tmp/pids/idp2.pid
  fi