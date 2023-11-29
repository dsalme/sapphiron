# README

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby:3.2.2


* System dependencies: 
    - Docker
    - RVM
    - Pre-commit: run `./scripts/install-hooks.bash` (`docker-compose up` already does this so you can skip this)(for further info read "How pre-commit was setup" down below)

* How to run the app: 
    `docker-compose build`
    `docker-compose up`
    The initializacion script (`/docker-entrypoint.sh`) creates the db if it doesn't exist and runs db migrations. This script is run by `docker-compose up` every time so you don't need to run it manually.

* Configuration

    - How pre-commit was setup:
        https://betterprogramming.pub/git-hooks-for-your-rails-app-to-run-rubocop-brakeman-and-rspec-on-push-or-commit-ab51cd65e713

* Database creation manually (not needed, docker-compose creates it for you)
    `docker-compose run web db:create`

* Database manually run migrations 
    `docker-compose run web db:migrate`

* Database initialization
    The database is containerized and orchestrated by docker-compose

* Database Seed: In a terminal, navigate to the project root folder and run: 
    `docker-compose run web rails db:seed`

* How to run the test suite:
    `docker-compose run web rspec`

## Keeping your docker env clean

* When you run any `docker-compose run web <command>` command, when running tests manually for example, it creates a new container, runs the command and exits, leaving a stale container in your docker containers list. In order to keep it clean, you can add a `--rm` flag, so that when the command runs, the container is automatically removed afterwards, like so: `docker-compose run --rm web <command>`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
