#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi 

if [ -f tmp/pids/karafka ]; then
  rm -f tmp/pids/karafka
fi 

bundle exec rails s -b 0.0.0.0 -d

exec "$@"
