#!/bin/bash
set -e

export IDP=idp1
export BROKER_DOMAIN=http://localhost:6610
export DIRECTORY_DOMAIN=http://localhost:3000

bundle check || bundle install

yarn check || yarn install

bin/rails s --pid `pwd`/tmp/pids/idp-1.pid
