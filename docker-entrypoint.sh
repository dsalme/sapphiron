#!/bin/bash
rm -f tmp/pids/server.pid
rails db:create
rails db:migrate
#rails server
./bin/dev
