#!/bin/bash

exit_code=0

echo "*** Running container app specs"
bundle install | grep Installing
bundle exec rake db:create db:migrate #don't remove this line. If only run in test our schema.rb doesn't include required engine's migrations
RAILS_ENV=test bundle exec rake environment db:create db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code

