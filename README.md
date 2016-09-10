[![Build Status](https://travis-ci.org/filip373/Travel-First.svg?branch=master)](https://travis-ci.org/filip373/Travel-First)
[![Dependency Status](https://gemnasium.com/badges/github.com/filip373/Travel-First.svg)](https://gemnasium.com/github.com/filip373/Travel-First)
[![Stories in Ready](https://badge.waffle.io/filip373/Travel-First.png?label=ready&title=Ready)](http://waffle.io/filip373/Travel-First)

# Travel First
Travel First is a community-driven travel guide which allows users to discover and share interesting places around the world.

[travel-first.herokuapp.com](https://travel-first.herokuapp.com/)

## How to run
1. Install project dependencies with `bundle install`
2. Initialize database with `bundle exec rails db:setup`
3. Run server with `bundle exec foreman start`

## How to develop
* Clone [GitHub repository](https://github.com/filip373/Travel-First) to get the codebase
* Join [Waffle](https://waffle.io/filip373/Travel-First/join) to track GitHub issues
* Run tests with `bundle exec rspec`
* Start Guard with `bundle exec guard`
* Develop on your branch and create a Pull Request when you're done ([recommended workflow](https://github.com/waffleio/waffle.io/wiki/Recommended-Workflow-Using-Pull-Requests-&-Automatic-Work-Tracking))
* Once you get positive code review from other contributor, merge your Pull Request and remove your branch

## How it works
* Ruby `2.3.1` and Rails `5.0.0`
* [PostgreSQL](https://www.postgresql.org/) for database
* [Rubocop](http://rubocop.readthedocs.io/en/latest/) for static code analysis
* [Pry](http://pryrepl.org/) for debugging
* [RSpec](http://rspec.info/), [Capybara](http://jnicklas.github.io/capybara/), [factory_girl](https://github.com/thoughtbot/factory_girl), [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) for testing
* [SimpleCov](https://github.com/colszowka/simplecov) for code coverage
* [Guard](http://guardgem.org/) for tasks automation
* [Travis CI](https://travis-ci.org/) for continous integration
* [Heroku](https://www.heroku.com/) for deployment
* [Bootstrap](http://www.getbootstrap.com/) for front-end design
* [Fog](https://github.com/fog/fog), [CarrierWave](https://github.com/carrierwaveuploader/carrierwave), [Amazon AWS](https://aws.amazon.com) for files upload
* [Figaro](https://github.com/laserlemon/figaro) for configuration

## Contributors
[Filip Soszyński](https://www.linkedin.com/in/filip-soszynski)
