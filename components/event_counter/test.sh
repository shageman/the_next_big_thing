#!/bin/bash

exit_code=0

echo "*** Running event counter specs"
bundle install | grep Installing
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/models
exit_code+=$?

exit $exit_code