#!/bin/bash

exit_code=0

echo "*** Running teaser engine specs"
bundle install | grep Installing
bundle exec rake db:create 
bundle exec rake db:migrate
RAILS_ENV=test bundle exec rake db:create 
RAILS_ENV=test bundle exec rake db:migrate
bundle exec rspec spec/controllers
exit_code+=$?

echo "*** Running teaser engine request specs"
bundle exec rspec spec/features
exit_code+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
exit_code+=$?

exit $exit_code
