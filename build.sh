#!/bin/sh
echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
bundle install > /dev/null
bundle exec rake db:migrate db:test:prepare rspec
result=$?


cd engines/teaser
echo "*** Running teaser engine non-request specs"
bundle install > /dev/null
bundle exec rake db:migrate app:db:test:prepare
rspec spec/models spec/controllers
result+=$?

echo "*** Running teaser engine request specs"
rspec spec/reqests
result+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
result+=$?


cd ../..
cd gems/annoyance
echo "*** Running annoyance gem specs"
bundle install > /dev/null
bundle exec rspec spec
result+=$?


exit $result
