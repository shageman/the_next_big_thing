#!/bin/bash

exit_code=0

echo "*** Running teaser engine specs"
bundle install | grep Installing
bundle exec rake db:create db:migrate #don't remove this line. If only run in test our schema.rb doesn't include required engine's migrations
RAILS_ENV=test bundle exec rake db:create db:migrate
bundle exec rspec spec/controllers
exit_code+=$?

echo "*** Running teaser engine request specs"
bundle exec rspec spec/features
exit_code+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
exit_code+=$?

exit $exit_code
