#!/bin/sh
echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
bundle install > /dev/null
bundle exec rake db:migrate db:test:prepare rspec
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
bundle install > /dev/null
bundle exec rake db:migrate app:db:test:prepare rspec
result+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
result+=$?

exit $result