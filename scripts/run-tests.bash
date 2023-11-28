#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running tests"
docker-compose run -T --rm web rspec