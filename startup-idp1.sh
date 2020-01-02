#!/bin/bash
set -e

export IDP=idp1
export BROKER_DOMAIN=http://localhost:6610
export DIRECTORY_DOMAIN=http://localhost:3000
export PORT=3333

bundle check || bundle install

yarn check || yarn install

bin/rails s -d --pid `pwd`/tmp/pids/idp1.pid
