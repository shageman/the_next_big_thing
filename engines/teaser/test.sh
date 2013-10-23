#!/bin/sh

exit_code=0

echo "*** Running teaser engine specs"
bundle install | grep Installing
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/controllers
exit_code+=$?

echo "*** Running teaser engine request specs"
bundle exec rspec spec/requests
exit_code+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
exit_code+=$?

exit $exit_code
