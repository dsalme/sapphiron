#!/usr/bin/env bash

echo "Running pre-commit hook"
if test $(git rev-parse --abbrev-ref HEAD) = "master" ; then 
  echo "Cannot commit on master"
  exit 1
fi
if test $(git rev-parse --abbrev-ref HEAD) = "develop" ; then 
  echo "Cannot commit on develop"
  exit 1
fi
#./scripts/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before commiting"
 exit 1
fi