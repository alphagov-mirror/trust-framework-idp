#!/bin/bash
set -e

export IDP=idp2
export BROKER_DOMAIN=http://localhost:5510
export DIRECTORY_DOMAIN=http://localhost:3000
export PORT=3334

bundle check || bundle install

yarn check || yarn install

bin/rails s --pid `pwd`/tmp/pids/idp-2.pid
