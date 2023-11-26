# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Code style check
To execute a code style check of the project, we can use the following options

run rubocop from console as single command or using bundler

* rubocop
* bundle exec rubocop

using a rake task

* rake rubocop                            # Run RuboCop
* rake rubocop:autocorrect                # Autocorrect RuboCop offenses (only when it's safe)
* rake rubocop:autocorrect_all            # Autocorrect RuboCop offenses (safe and unsafe)


## Code static analysis

To execute a code static analysis we can use the following options

run rubycritic from console as a single command or using bundler

* rubycritic
* bundle exec rubycritic

using a rake task

rake rubycritic   # Run RubyCritic
