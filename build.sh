#!/bin/sh
echo "*** Running specs"
source ~/.rvm/scripts/rvm
bundle install > /dev/null
bundle exec rake db:migrate db:test:prepare
bundle exec rspec spec/models spec/controllers
result=$?

echo "*** Running request specs"
bundle exec rspec spec/requests
result+=$?

echo "*** Running javascript specs"
bundle exec rake jasmine:ci
result+=$?

if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result
