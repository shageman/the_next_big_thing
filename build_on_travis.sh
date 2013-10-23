export BUNDLE_PATH="$HOME/vendor/bundle"
export BUNDLE_GEMFILE=$PWD/Gemfile
BUNDLE_OPTIONS=""
unset BUNDLE_GEMFILE

#!/bin/sh
echo "*** Running container app specs"
bundle exec rake db:migrate db:test:prepare
bundle exec rspec spec
result=$?


cd engines/email_signup
echo "*** Running news signup engine specs"
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/models
result+=$?


cd ../../engines/teaser
echo "*** Running teaser engine specs"
bundle exec rake db:migrate app:db:test:prepare
bundle exec rspec spec/controllers
result+=$?

echo "*** Running teaser engine request specs"
bundle exec rspec spec/requests
result+=$?

echo "*** Running teaser engine javascript specs"
bundle exec rake app:jasmine:ci
result+=$?


cd ../..
cd gems/annoyance
echo "*** Running annoyance gem specs"
bundle exec rspec spec
result+=$?


if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result
