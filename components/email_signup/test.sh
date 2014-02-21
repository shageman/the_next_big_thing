#!/bin/bash

exit_code=0

echo "*** Running email signup engine specs"
bundle install | grep Installing
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/models
exit_code+=$?

exit $exit_code