#!/bin/bash

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install
RUBYOPT='-W0' RAILS_ENV=test  xvfb-run -n1 bundle exec rspec $1
