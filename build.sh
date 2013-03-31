#!/bin/sh
echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
bundle install > /dev/null
bundle exec rake db:migrate db:test:prepare
rspec spec
result=$?


cd engines/news_signup
echo "*** Running news signup engine specs"
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/models
result+=$?


cd ../../engines/teaser
echo "*** Running teaser engine non-request specs"
bundle install > /dev/null
bundle exec rake db:migrate app:db:test:prepare
rspec spec/models spec/controllers
result+=$?

echo "*** Running teaser engine request specs"
rspec spec/requests
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

if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result
