# README

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
    The initializacion script (`/docker-entrypoint.sh`) creates the db if it doesn't exist and runs db migrations.

* Configuration

    - How pre-commit was setup:
        https://betterprogramming.pub/git-hooks-for-your-rails-app-to-run-rubocop-brakeman-and-rspec-on-push-or-commit-ab51cd65e713

* Database creation
    `docker-compose run web db:create`

* Database manually run migrations 
    `docker-compose run web db:migrate`

* Database initialization
    The database is containerized and orchestrated by docker-compose

* Database Seed: In a terminal, navigate to the project root folder and run: 
    `docker-compose run web rails db:seed`

* How to run the test suite:
    `docker-compose run web rspec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
