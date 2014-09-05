#!/bin/bash

exit_code=0

echo "*** Running event counter specs"
bundle install | grep Installing
RAILS_ENV=test bundle exec rake db:create db:migrate
bundle exec rspec spec/models
exit_code+=$?

exit $exit_code