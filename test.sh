#!/bin/bash

exit_code=0

echo "*** Running container app specs"
bundle install | grep Installing
bundle exec rake db:migrate db:test:prepare
bundle exec rspec spec
exit_code+=$?

exit $exit_code

