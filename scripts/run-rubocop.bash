#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running rubocop"
docker-compose run -T --rm web rubocop app spec test -a -x -l