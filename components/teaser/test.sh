#!/bin/bash

exit_code=0

echo "*** Running teaser engine specs"
bundle install | grep Installing
RAILS_ENV=test bundle exec rake db:create db:migrate
bundle exec rspec spec/controllers
exit_code+=$?

echo "*** Running teaser engine request specs"
bundle exec rspec spec/requests
exit_code+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
exit_code+=$?

exit $exit_code
